interface ZANDERS_IF_CHECK
  public .


  interfaces ZANDERS_IF_OBJ_INIT .

  methods CHECK
    importing
      !IV_VALUE type INT4
    returning
      value(RV_PASS) type ABAP_BOOL .
endinterface.
