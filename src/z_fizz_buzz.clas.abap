CLASS z_fizz_buzz DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC ."Create private signifies that an
  "object cannot be created outside of the class

  PUBLIC SECTION.
    CLASS-DATA:
    "data declaration
        lo_object TYPE REF TO z_fizz_buzz.


    CLASS-METHODS:
      l_create "factory method to create the object
        RETURNING VALUE(ro_object) TYPE REF TO z_fizz_buzz   .
    INTERFACES if_oo_adt_classrun.

    TYPES: lty_string TYPE STANDARD TABLE OF string WITH DEFAULT KEY.

    METHODS:
      l_logic " logic on the object created
        EXPORTING VALUE(ev_stream_string) TYPE lty_string
                  VALUE(ev_val)           TYPE lty_string.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS z_fizz_buzz IMPLEMENTATION.
  METHOD l_create.
    lo_object = NEW z_fizz_buzz(  ).
    RETURN lo_object.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.

    DATA(lv_object_value) = z_fizz_buzz=>l_create(  ).
    out->write( lv_object_value ).
    "out->write( z_fizz_buzz=>l_create(  )->l_logic(  ) ).
    CALL METHOD lv_object_value->l_logic
      IMPORTING
        ev_val = DATA(val1).
    out->write( val1 ).


  ENDMETHOD.

  METHOD l_logic.
    "string_table is an inbuilt table type for storing strings
    "thus string_table is same as declaring a table type for strings like below
    " types: lty standard table of string with default key
    DATA(lv_stream_string1) = NEW lty_string(
                      FOR i = 1 WHILE i < 1000 (
                      COND #( WHEN i MOD 3 EQ 0 AND i MOD 5 EQ 0 THEN |FizzBuzz|
                              WHEN i MOD 3 EQ 0 THEN |Fizz|
                              WHEN i MOD 5 EQ 0 THEN |Buzz|
                              ) ) ).
    ev_val = lv_stream_string1->*.
    "As new operator returns the result as reference object we must dereference it
    "If we use value operator we dont have to derefernce
    "it the output itself would be the dereferenced value
  ENDMETHOD.

ENDCLASS.



