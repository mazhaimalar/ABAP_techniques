*"* use this source file for your ABAP unit test classes

CLASS ltcl_fizz_buzz DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.
  PUBLIC SECTION.
    CLASS-DATA: lo_obj TYPE REF TO ltcl_fizz_buzz.
    METHODS :
      _01_fizzbuzz_string_mod_3 FOR TESTING RAISING cx_static_check,
      _02_fizzbuzz_string_mod_5 FOR TESTING RAISING cx_static_check.
  PRIVATE SECTION.
    CLASS-METHODS: class_setup.
    CLASS-METHODS: class_teardown.
    METHODS:
      setup,
      teardown.
ENDCLASS.


CLASS ltcl_fizz_buzz IMPLEMENTATION.

  METHOD _01_fizzbuzz_string_mod_3.
    DATA(lv_mod3) = z_fizz_buzz=>l_create(  ).
    CALL METHOD lv_mod3->get_fizzbuzz_string
                IMPORTING ev_val = data(test_result).
    cl_abap_unit_assert=>assert_equals( act = 'Fizz'
                                        exp =  test_result[ 3 ] ).
  ENDMETHOD.

  METHOD class_setup.
    lo_obj = NEW #(  ).
  ENDMETHOD.

  METHOD class_teardown.

  ENDMETHOD.

  METHOD setup.

  ENDMETHOD.

  METHOD teardown.

  ENDMETHOD.

  METHOD _02_fizzbuzz_string_mod_5.

  ENDMETHOD.

ENDCLASS.
