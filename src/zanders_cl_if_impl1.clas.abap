class ZANDERS_CL_IF_IMPL1 definition
  public
  final
  create public .

public section.

  interfaces IF_BADI_INTERFACE .
  interfaces ZANDERS_IF_INSTANCE .
protected section.
private section.
ENDCLASS.



CLASS ZANDERS_CL_IF_IMPL1 IMPLEMENTATION.


  METHOD zanders_if_instance~get_implclname.
    IF iv_infname = 'ZANDERS_IF_BUS1'.
      SELECT SINGLE *
           FROM dd02l
           WHERE tabname = 'ZANDERS_IF_IMPL'
           INTO @DATA(ls_dd02l).

      CALL TRANSFORMATION id SOURCE dd02l = ls_dd02l RESULT XML DATA(lx_dd02l).
      cv_data = lx_dd02l.
      cv_implclname = 'ZANDERS_CL_BUS3'.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
