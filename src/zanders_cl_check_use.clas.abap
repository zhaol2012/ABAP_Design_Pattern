class ZANDERS_CL_CHECK_USE definition
  public
  create public .

public section.

  methods CHECK_USE
    importing
      !IV_VALUE type INT4
    returning
      value(RV_RIGHT) type ABAP_BOOL .
protected section.
private section.
ENDCLASS.



CLASS ZANDERS_CL_CHECK_USE IMPLEMENTATION.


  METHOD check_use.
    DATA(lv_pass1) = NEW zanders_cl_check_enh1( )->check_enh1( iv_value ).
    DATA(lv_pass2) = NEW zanders_cl_check_enh2( )->check_enh2( iv_value ).

    IF lv_pass1 = abap_true AND lv_pass2 = abap_false.
      rv_right = abap_true.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
