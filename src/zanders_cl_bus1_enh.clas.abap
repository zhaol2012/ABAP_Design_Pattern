class ZANDERS_CL_BUS1_ENH definition
  public
  create public .

public section.

  methods MY_DISPLAY
    importing
      !IS_KEYS type ZANDERS_KEYS .
protected section.
private section.
ENDCLASS.



CLASS ZANDERS_CL_BUS1_ENH IMPLEMENTATION.


  METHOD my_display.
    data lv_objkey type zanders_obj_key.
    lv_objkey = |{ is_keys-key1 }{ is_keys-key2 }|.
    CALL TRANSFORMATION id SOURCE keys = is_keys RESULT XML DATA(lx_details).
    DATA(lr_bus1) = CAST zanders_if_bus1( zanders_cf_object=>inst_by_infname( EXPORTING
                                                iv_infname  = 'ZANDERS_IF_BUS1'
                                                iv_objkey   = lv_objkey
*                                                is_keys     = is_keys
                                               CHANGING
                                                 cv_details  = lx_details
                                              )
                                       ).

    lr_bus1->display( ).
  ENDMETHOD.
ENDCLASS.
