class ZANDERS_CF_OBJECT definition
  public
  create public

  global friends ZANDERS_CF_OBJECT_I .

public section.

  class-methods INST_BY_INFNAME
    importing
      !IV_INFNAME type ZANDERS_IFNAME
      !IV_OBJKEY type ZANDERS_OBJ_KEY
    changing
      !CV_DETAILS type XSTRING optional
    returning
      value(RO_INSTANCE) type ref to OBJECT .
PROTECTED SECTION.

  TYPES:
    BEGIN OF st_inf_obj,
      infname TYPE zanders_ifname,
      obj     TYPE REF TO object,
      used    TYPE abap_bool,
    END OF st_inf_obj .
  TYPES:
    tt_inf_obj TYPE STANDARD TABLE OF st_inf_obj.
private section.

  class-data MT_OBJ type TT_INF_OBJ .
ENDCLASS.



CLASS ZANDERS_CF_OBJECT IMPLEMENTATION.


  METHOD inst_by_infname.
* this method is used to determine the class for an interface and initialize the class
* the functionalities of this class can be divided into two parts:

* 1. class determination for a given interface
*    The determination process contains three steps:
*    a. get default class name by replacing 'IF_' with 'CL_'
*    b. get class name by the customing
*    c. get class name by the BADI implementation
*    class determination priority  c > b > a

* 2. class initializaiton
    DATA: lr_badi       TYPE REF TO zanders_if,
          lv_objkey	    TYPE zanders_obj_key,
          lv_implclname TYPE zanders_implclname.

******************* class determination begin *******************
    SORT mt_obj BY infname.
    READ TABLE mt_obj ASSIGNING FIELD-SYMBOL(<fs_obj>) WITH KEY infname = iv_infname
                                                                used = abap_false
                                                        BINARY SEARCH.

    IF sy-subrc = 0.
      ro_instance = <fs_obj>-obj.
      <fs_obj>-used = abap_true.
    ELSE.
*  Generate the default class name
      lv_implclname = replace( val = iv_infname sub = 'IF_' with = 'CL_' ).

* First enhancement from configuration
      SELECT SINGLE implclname FROM zanders_if_impl
                           WHERE implifname = @iv_infname
                            AND objkey = @iv_objkey
         INTO @lv_implclname.
      IF sy-subrc <> 0.
        SELECT SINGLE implclname FROM zanders_if_impl
                     WHERE implifname = @iv_infname
                       AND objkey LIKE @iv_objkey
                      INTO @lv_implclname.
        IF sy-subrc <> 0.
          lv_objkey = '*'.
          SELECT SINGLE implclname FROM zanders_if_impl
                       WHERE implifname = @iv_infname
                         AND objkey = @lv_objkey
                        INTO @lv_implclname.

          IF sy-subrc <> 0.
            lv_implclname = replace( val = iv_infname sub = 'IF_' with = 'CL_' ).
          ENDIF.
        ENDIF.
      ENDIF.
* Second enhancement from configuration
      TRY.
          GET BADI lr_badi
            FILTERS
              objkey     = iv_objkey
              implifname = iv_infname.

          DATA(lr_impl) = lr_badi->imps[ 1 ].
          lr_impl->get_implclname( EXPORTING iv_infname    = iv_infname
                                   CHANGING  cv_data       = cv_details
                                             cv_implclname = lv_implclname ).
        CATCH cx_badi_not_implemented
            cx_badi_multiply_implemented.
      ENDTRY.
      CREATE OBJECT ro_instance TYPE (lv_implclname).
      CAST zanders_if_obj_init( ro_instance )->init( cv_details ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
