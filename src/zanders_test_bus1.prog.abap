*&---------------------------------------------------------------------*
*& Report ZANDERS_TEST_BUS1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zanders_test_bus1.

PARAMETERS: p_key1 TYPE zanders_key1,
            p_key2 TYPE zanders_key2.

DATA:ls_keys TYPE zanders_keys,
     lv_key  type zanders_obj_key,
     lr_bus1 TYPE REF TO zanders_if_bus1.

ls_keys = VALUE #( key1 = p_key1 key2 = p_key2 ).
lv_key = |{ p_key1 }{ p_key2 }|.

CALL TRANSFORMATION id SOURCE keys = ls_keys RESULT XML DATA(lx_details).
lr_bus1 ?= zanders_cf_object=>inst_by_infname( EXPORTING
                                                iv_infname  = 'ZANDERS_IF_BUS1'
                                                iv_objkey     = lv_key
                                               CHANGING
                                                 cv_details  = lx_details
                                              ).
BREAK-POINT.
lr_bus1->display( ).
