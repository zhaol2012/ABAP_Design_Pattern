class ZANDERS_CL_CHECK definition
  public
  create protected

  global friends ZANDERS_CF_OBJECT .

public section.

  interfaces ZANDERS_IF_CHECK .
  interfaces ZANDERS_IF_OBJ_INIT .
protected section.
private section.
ENDCLASS.



CLASS ZANDERS_CL_CHECK IMPLEMENTATION.


  method ZANDERS_IF_CHECK~CHECK.
    if iv_value > 100.
      rv_pass = abap_true.
    ENDIF.
  endmethod.


  method ZANDERS_IF_OBJ_INIT~INIT.
  endmethod.
ENDCLASS.
