class ZANDERS_CF_OBJECT_I definition
  public
  final
  create public
  for testing .

public section.

  class-methods INJECT_OBJ
    importing
      !IV_INFNAME type ZANDERS_IFNAME
      !IR_OBJ type ref to OBJECT .
protected section.
private section.
ENDCLASS.



CLASS ZANDERS_CF_OBJECT_I IMPLEMENTATION.


  METHOD inject_obj.
    APPEND VALUE #( infname = iv_infname obj = ir_obj used = abap_false ) TO zanders_cf_object=>mt_obj.
  ENDMETHOD.
ENDCLASS.
