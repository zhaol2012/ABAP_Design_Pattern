*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZANDERS_IF_IMPL.................................*
DATA:  BEGIN OF STATUS_ZANDERS_IF_IMPL               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZANDERS_IF_IMPL               .
CONTROLS: TCTRL_ZANDERS_IF_IMPL
            TYPE TABLEVIEW USING SCREEN '0100'.
*.........table declarations:.................................*
TABLES: *ZANDERS_IF_IMPL               .
TABLES: ZANDERS_IF_IMPL                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
