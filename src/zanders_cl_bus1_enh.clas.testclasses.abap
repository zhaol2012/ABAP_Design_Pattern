*"* use this source file for your ABAP unit test classes
CLASS lcl_test DEFINITION FOR TESTING
  DURATION MEDIUM
  RISK LEVEL HARMLESS
.
  PRIVATE SECTION.
    DATA: mr_cut TYPE REF TO zanders_cl_bus1_enh.

    METHODS: my_display FOR TESTING.
ENDCLASS.

CLASS lcl_test IMPLEMENTATION.
  METHOD my_display.
    DATA lr_bus1 TYPE REF TO zanders_if_bus1.

    lr_bus1 ?= cl_abap_testdouble=>create( |ZANDERS_IF_BUS1| ).
    zanders_cf_object_i=>inject_obj( iv_infname = |ZANDERS_IF_BUS1| ir_obj = lr_bus1 ).
    cl_abap_testdouble=>configure_call( lr_bus1 )->ignore_all_parameters( )->and_expect( )->is_called_once( ).
    lr_bus1->display( ).

    mr_cut = NEW #( ).
    mr_cut->my_display( value #( key1 = 1 key2 = 2 ) ).
    cl_abap_testdouble=>verify_expectations( lr_bus1 ).
  ENDMETHOD.
ENDCLASS.
