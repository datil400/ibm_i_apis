      /If Defined( TCPIP_H )
      /Eof
      /Endif
      /Define TCPIP_H

    � *
    � *  NOMBRE.......: TCPIP_H
    � *  DESCRIPCION..: Declaraci�n de los tipos y prototipos para las
    � *                 APIs relacionadas con la gesti�n de TCP/IP.
    � *
    � *    Con estas APIs podr� recuperar informaci�n sobre la configuraci�n
    � *    de TCP/IP y su estado, adem�s podr� cambiar algunos valores
    � *    relacionados.
    � *
    � *  Programador..: Javier Mora
    � *  Fecha........: 11.04.2008
    � *
    � *  Historia:
    � *
    � *   Fecha   Programador        Observaciones
    � *  -------- ------------------ -------------
    � *
    � *  Usar como:
    � *
    � *    /Copy API,Tcpip_H
    � *
    � *  Notas:
    � *

    � * ==================================================================
    � * = OTROS FICHEROS DE CABECERA                                     =
    � * ==================================================================

      /Copy Api,StdTyp_H

    � * ==================================================================
    � * = DEFINICI�N DE CONSTANTES                                       =
    � * ==================================================================

    � * ==================================================================
    � * = DEFINICI�N DE TIPOS                                            =
    � * ==================================================================

    � * ------------------------------------------------------------------
    � * - Formato TCPA0100 para la informaci�n devuelta por la API       -
    � * - "Retrieve TCP/IP Attributes (QtocRtvTCPA)"                     -
    � * -                                                                -
    � * - Contiene el estado de la pila TCP/IPv4.                        -
    � * ------------------------------------------------------------------
    � * - bytRtn         Bytes devueltos.                                -
    � * - bytAvl         Bytes disponibles.                              -
    � * - stkSts         Estado de la pila TCP/IPv4.                     -
    � * - actTim         Tiempo, en segundos, que lleva activa la pila   -
    � * -                TCP/IP.                                         -
    � * - lstStrD        �ltima fecha de inicio.                         -
    � * - lstStrT        �ltima hora de inicio.                          -
    � * - lstEndD        �ltima fecha de finalizaci�n.                   -
    � * - lstEndT        �ltima hora de finalizaci�n.                    -
    � * - strJob         Nombre del trabajo que arranc� TCP/IP.          -
    � * - strUsr         Nombre del usuario que arranc� TCP/IP.          -
    � * - strNbr         N�mero del trabajo que arranc� TCP/IP.          -
    � * - strJobInt      Indentificador interno del trabajo que arranc�  -
    � * -                TCP/IP.                                         -
    � * - endJob         Nombre del trabajo que finaliz� TCP/IP.         -
    � * - endUsr         Nombre del usuario que finaliz� TCP/IP.         -
    � * - endNbr         N�mero del trabajo que finaliz� TCP/IP.         -
    � * - endJobInt      Indentificador interno del trabajo que finaliz� -
    � * -                TCP/IP.                                         -
    � * - ofsAddInf      Desplazamiento a zona del buffer con            -
    � * -                informaci�n adicional.                          -
    � * - lenAddInf      Tama�o de la informaci�n adicional.             -
    � * - lmtMod         Modo limitado.                                  -
    � * ------------------------------------------------------------------

     D TCPA0100_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   bytRtn                      10I 0 Overlay( TCPA0100_T:   1 )
     D   BytAvl                      10I 0 Overlay( TCPA0100_T:   5 )
     D   stkSts                      10I 0 Overlay( TCPA0100_T:   9 )
     D   actTim                      10I 0 Overlay( TCPA0100_T:  13 )
     D   lstStrD                      8A   Overlay( TCPA0100_T:  17 )
     D   lstStrT                      6A   Overlay( TCPA0100_T:  25 )
     D   lstEndD                      8A   Overlay( TCPA0100_T:  31 )
     D   lstEndT                      6A   Overlay( TCPA0100_T:  39 )
     D   strJob                      10A   Overlay( TCPA0100_T:  45 )
     D   strUsr                      10A   Overlay( TCPA0100_T:  55 )
     D   strNbr                       6A   Overlay( TCPA0100_T:  65 )
     D   strJobInt                   16A   Overlay( TCPA0100_T:  71 )
     D   endJob                      10A   Overlay( TCPA0100_T:  87 )
     D   endUsr                      10A   Overlay( TCPA0100_T:  97 )
     D   endNbr                       6A   Overlay( TCPA0100_T: 107 )
     D   endJobInt                   16A   Overlay( TCPA0100_T: 113 )
     D   ofsAddInf                   10I 0 Overlay( TCPA0100_T: 129 )
     D   lenAddInf                   10I 0 Overlay( TCPA0100_T: 133 )
     D   lmtMod                      10I 0 Overlay( TCPA0100_T: 137 )

    � * ==================================================================
    � * = DECLARACI�N DE FUNCIONES Y PROCEDIMIENTOS PUBLICOS             =
    � * ==================================================================

    � * ------------------------------------------------------------------
    � * - RtvTcpA - Recuperar atributos TCP/IP                           -
    � * -                                                                -
    � * - Retrieve TCP/IP attributes (QtocRtvTCPA)                       -
    � * ------------------------------------------------------------------

     D RtvTcpA         PR                  ExtProc( 'QtocRtvTCPA' )
     D   rcvVar                                  Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   rcvVarLen                         Const Like( TypeInt )
     D   format                            Const Like( TypeApiFormat )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )
