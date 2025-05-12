CLASS zki_abap_local_class_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zki_abap_local_class_class IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA connection   TYPE REF TO           lcl_connection.
    DATA carrier_id   TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.
    DATA connection2  TYPE REF TO           lcl_connection.
    DATA connections  TYPE TABLE OF REF TO  lcl_connection.


    connection = NEW #( ).

    TRY.
    connection->set_attributes(
      i_carrier_id    = 'LH'
      i_connection_id = '0400' ).

*    connection->carrier_id = 'LH'.
*    connection->connection_id = '0400'.

    APPEND connection TO connections.

    CATCH cx_abap_invalid_value.

        out->write( 'Method Call Failed' ).
    ENDTRY.

**********************************************************

    connection = NEW #( ).

    TRY.
     connection->set_attributes(
       i_carrier_id    = 'AA'
       i_connection_id = '0017' ).

     APPEND connection TO connections.

*    connection->carrier_id = 'AA'.
*    connection->connection_id = '0017'.

     CATCH cx_abap_invalid_value.
        out->write( |'Method Call Failed| ).
     ENDTRY.

**********************************************************

     connection = NEW #( ).

    TRY.
     connection->set_attributes(
       i_carrier_id    = 'SQ'
       i_connection_id = '0001' ).

     APPEND connection TO connections.

*    connection->carrier_id = 'SQ'.
*    connection->connection_id = '0001'.

     CATCH cx_abap_invalid_value.
        out->write( |'Method Call Failed| ).
     ENDTRY.

*********************************************************

    LOOP AT connections INTO connection.

        out->write( connection->get_output( ) ).

*        connection->get_attributes(
*            IMPORTING
*            e_carrier_id    = carrier_id
*            e_connection_id = connection_id ).
*
*        out->write( |Flight connection: { carrier_id } { connection_id }| ).

    ENDLOOP.
*********************************************************
  ENDMETHOD.
ENDCLASS.
