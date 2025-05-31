class ZANDERS_CL_BUS1 definition
  public
  create protected

  global friends ZANDERS_CF_OBJECT .

public section.

  interfaces ZANDERS_IF_BUS1 .
  interfaces ZANDERS_IF_OBJ_INIT .

  aliases DISPALY
    for ZANDERS_IF_BUS1~DISPLAY .
protected section.

  aliases INIT
    for ZANDERS_IF_OBJ_INIT~INIT .

  data MV_DATA type CHAR14 .
private section.
ENDCLASS.



CLASS ZANDERS_CL_BUS1 IMPLEMENTATION.


  METHOD ZANDERS_IF_BUS1~DISPLAY.
    cl_demo_output=>display( mv_data ).
  ENDMETHOD.


  METHOD zanders_if_obj_init~init.
    DATA ls_keys TYPE zanders_keys.
    CALL TRANSFORMATION id
         SOURCE XML iv_details
         RESULT keys = ls_keys.

    mv_data = |{ ls_keys-key1 }{ ls_keys-key2 }|.
  ENDMETHOD.
ENDCLASS.
