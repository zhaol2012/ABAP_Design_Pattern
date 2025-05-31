class ZANDERS_CL_CHECK_ENH2 definition
  public
  create public .

public section.

  methods CHECK_ENH2
    importing
      !IV_VALUE type INT4
    returning
      value(RV_PASS) type ABAP_BOOL .
protected section.
private section.
ENDCLASS.



CLASS ZANDERS_CL_CHECK_ENH2 IMPLEMENTATION.


  METHOD check_enh2.
    DATA(lv_value) = iv_value - 20.
    rv_pass = CAST zanders_if_check( zanders_cf_object=>inst_by_infname( EXPORTING
                                                iv_infname  = 'ZANDERS_IF_CHECK'
                                                iv_objkey     = VALUE #( )
                                              ) )->check( lv_value ).
  ENDMETHOD.
ENDCLASS.
