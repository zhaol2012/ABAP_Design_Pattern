*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_ZANDERS_IF_IMPL
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_ZANDERS_IF_IMPL    .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
