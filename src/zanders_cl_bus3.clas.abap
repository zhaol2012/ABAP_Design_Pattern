class ZANDERS_CL_BUS3 definition
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

  data MS_DD02L type DD02L .
private section.
ENDCLASS.



CLASS ZANDERS_CL_BUS3 IMPLEMENTATION.


  METHOD ZANDERS_IF_BUS1~DISPLAY.
    cl_demo_output=>display( ms_dd02l ).
  ENDMETHOD.


  METHOD ZANDERS_IF_OBJ_INIT~INIT.
    CALL TRANSFORMATION id
         SOURCE XML iv_details
         RESULT dd02l = ms_dd02l.
  ENDMETHOD.
ENDCLASS.
