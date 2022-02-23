      /If Defined( TCPIP_H )
      /Eof
      /Endif
      /Define TCPIP_H

    ‚ *
    ‚ *  NOMBRE.......: TCPIP_H
    ‚ *  DESCRIPCION..: Declaración de los tipos y prototipos para las
    ‚ *                 APIs relacionadas con la gestión de TCP/IP.
    ‚ *
    ‚ *    Con estas APIs podrá recuperar información sobre la configuración
    ‚ *    de TCP/IP y su estado, además podrá cambiar algunos valores
    ‚ *    relacionados.
    ‚ *
    ‚ *  Programador..: Javier Mora
    ‚ *  Fecha........: 11.04.2008
    ‚ *
    ‚ *  Historia:
    ‚ *
    ‚ *   Fecha   Programador        Observaciones
    ‚ *  -------- ------------------ -------------
    ‚ *
    ‚ *  Usar como:
    ‚ *
    ‚ *    /Copy API,Tcpip_H
    ‚ *
    ‚ *  Notas:
    ‚ *

    ‚ * ==================================================================
    ‚ * = OTROS FICHEROS DE CABECERA                                     =
    ‚ * ==================================================================

      /Copy Api,StdTyp_H

    ‚ * ==================================================================
    ‚ * = DEFINICIÓN DE CONSTANTES                                       =
    ‚ * ==================================================================

    ‚ * ==================================================================
    ‚ * = DEFINICIÓN DE TIPOS                                            =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato TCPA0100 para la información devuelta por la API       -
    ‚ * - "Retrieve TCP/IP Attributes (QtocRtvTCPA)"                     -
    ‚ * -                                                                -
    ‚ * - Contiene el estado de la pila TCP/IPv4.                        -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytRtn         Bytes devueltos.                                -
    ‚ * - bytAvl         Bytes disponibles.                              -
    ‚ * - stkSts         Estado de la pila TCP/IPv4.                     -
    ‚ * - actTim         Tiempo, en segundos, que lleva activa la pila   -
    ‚ * -                TCP/IP.                                         -
    ‚ * - lstStrD        Última fecha de inicio.                         -
    ‚ * - lstStrT        Última hora de inicio.                          -
    ‚ * - lstEndD        Última fecha de finalización.                   -
    ‚ * - lstEndT        Última hora de finalización.                    -
    ‚ * - strJob         Nombre del trabajo que arrancó TCP/IP.          -
    ‚ * - strUsr         Nombre del usuario que arrancó TCP/IP.          -
    ‚ * - strNbr         Número del trabajo que arrancó TCP/IP.          -
    ‚ * - strJobInt      Indentificador interno del trabajo que arrancó  -
    ‚ * -                TCP/IP.                                         -
    ‚ * - endJob         Nombre del trabajo que finalizó TCP/IP.         -
    ‚ * - endUsr         Nombre del usuario que finalizó TCP/IP.         -
    ‚ * - endNbr         Número del trabajo que finalizó TCP/IP.         -
    ‚ * - endJobInt      Indentificador interno del trabajo que finalizó -
    ‚ * -                TCP/IP.                                         -
    ‚ * - ofsAddInf      Desplazamiento a zona del buffer con            -
    ‚ * -                información adicional.                          -
    ‚ * - lenAddInf      Tamaño de la información adicional.             -
    ‚ * - lmtMod         Modo limitado.                                  -
    ‚ * ------------------------------------------------------------------

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

    ‚ * ==================================================================
    ‚ * = DECLARACIÓN DE FUNCIONES Y PROCEDIMIENTOS PUBLICOS             =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - RtvTcpA - Recuperar atributos TCP/IP                           -
    ‚ * -                                                                -
    ‚ * - Retrieve TCP/IP attributes (QtocRtvTCPA)                       -
    ‚ * ------------------------------------------------------------------

     D RtvTcpA         PR                  ExtProc( 'QtocRtvTCPA' )
     D   rcvVar                                  Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   rcvVarLen                         Const Like( TypeInt )
     D   format                            Const Like( TypeApiFormat )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )
