interface ZANDERS_IF_INSTANCE
  public .


  interfaces IF_BADI_INTERFACE .

  methods GET_IMPLCLNAME
    importing
      !IV_INFNAME type ZANDERS_IFNAME
    changing
      !CV_DATA type XSTRING
      !CV_IMPLCLNAME type ZANDERS_IMPLCLNAME .
endinterface.
