class ZANDERS_CL_CHECK_ENH1 definition
  public
  create public .

public section.

  methods CHECK_ENH1
    importing
      !IV_VALUE type INT4
    returning
      value(RV_PASS) type ABAP_BOOL .
protected section.
private section.
ENDCLASS.



CLASS ZANDERS_CL_CHECK_ENH1 IMPLEMENTATION.


  method CHECK_ENH1.
    data(lv_value) = iv_value + 20.
    rv_pass = cast ZANDERS_IF_CHECK( zanders_cf_object=>inst_by_infname( EXPORTING
                                                iv_infname  = 'ZANDERS_IF_CHECK'
                                                iv_objkey     = VALUE #( )
                                              ) )->check( lv_value ).
  endmethod.
ENDCLASS.
