*"* use this source file for your ABAP unit test classes
CLASS lcl_test DEFINITION FOR TESTING
  DURATION MEDIUM
  RISK LEVEL HARMLESS
.
  PRIVATE SECTION.
    DATA: mr_cut TYPE REF TO zanders_cl_check_use.

    METHODS: test_check_use FOR TESTING.
ENDCLASS.

CLASS lcl_test IMPLEMENTATION.
  METHOD test_check_use.

    DATA: lr_check1 TYPE REF TO zanders_if_check,
          lr_check2 TYPE REF TO zanders_if_check.

    lr_check1 ?= cl_abap_testdouble=>create( |ZANDERS_IF_CHECK| ).
    zanders_cf_object_i=>inject_obj( iv_infname = |ZANDERS_IF_CHECK| ir_obj = lr_check1 ).
    cl_abap_testdouble=>configure_call( lr_check1 )->ignore_all_parameters( )->returning( abap_true ).
    lr_check1->check( 0 ).


    lr_check2 ?= cl_abap_testdouble=>create( |ZANDERS_IF_CHECK| ).
    zanders_cf_object_i=>inject_obj( iv_infname = |ZANDERS_IF_CHECK| ir_obj = lr_check2 ).
    cl_abap_testdouble=>configure_call( lr_check2 )->ignore_all_parameters( )->returning( abap_false ).
    lr_check1->check( 200 ).

    mr_cut = NEW #( ).
    DATA(lv_right) = mr_cut->check_use( -100 ).
    cl_abap_unit_assert=>assert_equals(
     EXPORTING
       act = lv_right
       exp = abap_true ).
  ENDMETHOD.
ENDCLASS.
