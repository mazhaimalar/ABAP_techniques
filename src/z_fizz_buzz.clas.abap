CLASS z_fizz_buzz DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC ."Create private signifies that an
  "object cannot be created outside of the class

  PUBLIC SECTION.
    CLASS-DATA:
        lo_object TYPE REF TO z_fizz_buzz.
    CLASS-METHODS:
      l_create
        RETURNING VALUE(ro_object) TYPE REF TO z_fizz_buzz   .
    INTERFACES if_oo_adt_classrun.
    METHODS:
      l_logic
        RETURNING VALUE(lv_stream_string) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS z_fizz_buzz IMPLEMENTATION.
  METHOD l_create.
    lo_object = NEW z_fizz_buzz(  ).
    RETURN lo_object.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
*    out->write( 'Started...' ).
    data(lv_object_value) = z_fizz_buzz=>l_create(  ).
    out->write( lv_object_value ).
    out->write( z_fizz_buzz=>l_create(  )->l_logic(  ) ).
  ENDMETHOD.

  METHOD l_logic.
    lv_stream_string = 'Success'.
  ENDMETHOD.

ENDCLASS.



