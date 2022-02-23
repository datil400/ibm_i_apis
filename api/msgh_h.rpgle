      /IF DEFINED( MSGH_H )
      /EOF
      /ENDIF
      /DEFINE MSGH_H

    ‚ *
    ‚ *  NOMBRE.......: MSGH_H
    ‚ *  DESCRIPCION..: Declaración de los tipos y prototipos para los
    ‚ *                 APIs manejo de mensajes.
    ‚ *
    ‚ *    Los APIs de manejo de mensajes permite a las aplicaciones
    ‚ *    trabajar con los mensajes AS/400 directamente. Estos APIs
    ‚ *    le proporcionan las siguientes características:
    ‚ *      - Enviar mensajes a usuarios o programas.
    ‚ *      - Recibir mensajes desde una cola de mensajes.
    ‚ *      - Manejar errores.
    ‚ *      - Devolver mensaje e información de la cola de mensajes.
    ‚ *      - Devolver la descripción de un mensaje y del fichero de
    ‚ *        de mensajes.
    ‚ *
    ‚ *  Programador..: Javier Mora
    ‚ *  Fecha........: 17.11.2006
    ‚ *
    ‚ *  Historia:
    ‚ *
    ‚ *   Fecha   Programador        Observaciones
    ‚ *  -------- ------------------ -------------
    ‚ *  27.11.07 Javier Mora        Incluir las APIs QMHRTVM y QMHMOVPM.
    ‚ *  09.06.08 Javier Mora        Cambiar nombre a estructuras de datos:
    ‚ *                                RSNM0100   por RSNM0100_T
    ‚ *                                RCVM0100   por RCVM0100_T
    ‚ *                                RCVM0200   por RCVM0200_T
    ‚ *                                LSTM0100   por LSTM0100_T
    ‚ *                                LSTM_Field por LSTM_Field_T
    ‚ *                                MSLT0100   por MSLT0100_T
    ‚ *  23.10.08 Javier Mora        Modificar estructura de datos MSLT0100.
    ‚ *                              No mantiene la compatibilidad con las
    ‚ *                              versiones anteriores de este fuente.
    ‚ *  05.06.09 Javier Mora        Revisión de estilo.
    ‚ *  03.08.11 Javier Mora        Cambiar valores por defecto de la
    ‚ *                              estructura RSNM0100_T.
    ‚ *  Abr 2012 Javier Mora        Revisar estructura RCVM0200_T.
    ‚ *                              Incluir estructura RCVM0300*.
    ‚ *  19.06.13 Javier Mora        Corregir estructura RCVM0200_T.
    ‚ *  Sep 2013 Javier Mora        Corregir errores en la estructura
    ‚ *                              RCVM0300PM_senderInf_T
    ‚ *
    ‚ *  Usar como:
    ‚ *
    ‚ *    /Copy API,MsgH_H
    ‚ *
    ‚ *  Notas:
    ‚ *

    ‚ * ==================================================================
    ‚ * = OTROS FICHEROS DE CABECERA                                     =
    ‚ * ==================================================================

      /COPY API,StdTyp_H

    ‚ * ==================================================================
    ‚ * = DEFINICIÓN DE TIPOS                                            =
    ‚ * ==================================================================

     D TypeMessageKey  S              4A   Based( apityp_ )
     D MessageKey_T    S              4A   Based( apityp_ )

    ‚ * ------------------------------------------------------------------
    ‚ * - Información que la API QMHRSNEM necesita cuando reenvía        -
    ‚ * - mensajes de error.                                             -
    ‚ * -                                                                -
    ‚ * - N.P.: No se declara como "Based( StdTyp_ )" para conseguir     -
    ‚ * - la inicialización por defecto, que es la más usada en en un    -
    ‚ * - programa ILE para reenviar mensajes al programa llamador.      -
    ‚ * ------------------------------------------------------------------
    ‚ * - Valores originales en versión 3.0, que son compatibles con los -
    ‚ * - nuevos si se emplea para reenviar mensajes al programa         -
    ‚ * - llamador desde un programa ILE.                                -
    ‚ * ------------------------------------------------------------------
    ‚D*RSNM0100_T      DS                  Qualified
    ‚D*  callStkCnt                  10I 0 Inz( 2 )
    ‚D*  callStkEntQual...
    ‚D*                              20A   Inz( '*NONE     *NONE' )
    ‚D*  lenCalStkEntId...
    ‚D*                              10I 0 Inz( 7 )
    ‚D*  callStkEntId                 7A   Inz( '*' )
    ‚ * ------------------------------------------------------------------

     D RSNM0100_T      DS                  Qualified
     D/IF DEFINED( *V6R1M0 )
     D                                     Template
     D/ENDIF
     D   callStkCnt                  10I 0 Inz( 1 )
     D   callStkEntQual...
     D                               20A   Inz( '*NONE     *NONE' )
     D   lenCalStkEntId...
     D                               10I 0 Inz( 7 )
     D   callStkEntId                 7A   Inz( '*PGMBDY' )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato RCVM0100 con información relacionada con el mensaje    -
    ‚ * - recuperado desde una cola de mensajes (de usuario o programa)  -
    ‚ * -                                                                -
    ‚ * - Formato válido para las APIs:                                  -
    ‚ * -   Receive Nonprogram Message (QMHRCVM)                         -
    ‚ * -   Receive Program Message (QMHRCVPM)                           -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytesRtn       Bytes devueltos                                 -
    ‚ * - bytesAvl       Bytes disponibles                               -
    ‚ * - msgSev         Gravedad del mensaje                            -
    ‚ * - msgId          Identificador del mensaje                       -
    ‚ * - msgType        Tipo del mensaje                                -
    ‚ * - msgKey         Clave del mensaje                               -
    ‚ * - CCSIDstatus    Indicardor estado de conversión del CCSID del   -
    ‚ * -                texto o los datos del mensaje                   -
    ‚ * - CCSID          CCSID del texto o datos del mensaje             -
    ‚ * - msgDtaLen      Longitud de los datos o del texto directo del   -
    ‚ * -                mensaje                                         -
    ‚ * - msgDtaAvail    Tamaño del espacio disponible para los datos o  -
    ‚ * -                texto directo del mensaje                       -
    ‚ * -                                                                -
    ‚ * - PARTE VARIABLE DE LA ESTRUCTURA DE DATOS                       -
    ‚ * -                                                                -
    ‚ * - Char(*)        Datos del mensaje o texto directo               -
    ‚ * ------------------------------------------------------------------

     D RCVM0100_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   bytesRtn                    10I 0 Overlay( RCVM0100_T:  1 )
     D   bytesAvl                    10I 0 Overlay( RCVM0100_T:  5 )
     D   msgSev                      10I 0 Overlay( RCVM0100_T:  9 )
     D   msgID                        7A   Overlay( RCVM0100_T: 13 )
     D   msgType                      2A   Overlay( RCVM0100_T: 20 )
     D   msgKey                       4A   Overlay( RCVM0100_T: 22 )
     D                                7A
     D   CCSIDstatus                 10I 0 Overlay( RCVM0100_T: 33 )
     D   CCSID                       10I 0 Overlay( RCVM0100_T: 37 )
     D   msgDtaLen                   10I 0 Overlay( RCVM0100_T: 41 )
     D   msgDtaAvail                 10I 0 Overlay( RCVM0100_T: 45 )
    ‚D* Desde aquí la parte variable...

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato RCVM0200 con información relacionada con el mensaje    -
    ‚ * - recuperado desde una cola de mensajes de usuario.              -
    ‚ * -                                                                -
    ‚ * - Formato válido para las APIs:                                  -
    ‚ * -   Receive Nonprogram Message (QMHRCVM)                         -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytesRtn       Bytes devueltos                                 -
    ‚ * - bytesAvl       Bytes disponibles                               -
    ‚ * - msgSev         Gravedad del mensaje                            -
    ‚ * - msgId          Identificador del mensajes                      -
    ‚ * - msgType        Tipo del mensaje                                -
    ‚ * - msgKey         Clave del mensaje                               -
    ‚ * - msgFName       Nombre del archivo de mensajes                  -
    ‚ * - msgFlibSpec    Biblioteca del archivo de mensajes que se ha    -
    ‚ * -                especificado                                    -
    ‚ * - msgFlibUsed    Biblioteca del archivo de mensajes que se       -
    ‚ * -                está utilizando                                 -
    ‚ * - sndJobName     Nombre del trabajo que envía el mensaje         -
    ‚ * - sndJobUsr      Nombre de usuario del trabajo que envía el      -
    ‚ * -                mensaje                                         -
    ‚ * - sndJobNbr      Número del trabajo que envía el mensaje         -
    ‚ * - sndPgmName     Nombre del programa que envía el mensaje        -
    ‚ * - datSent        Fecha de envío del mensaje                      -
    ‚ * - timSent        Hora de envío del mensaje                       -
    ‚ * - timSntMs       Microsegundos                                   -
    ‚ * - sndUsrPrf      Usuario que ha enviado el mensaje               -
    ‚ * - CCSIDStsTxt    Indicador del estado de conversión CCSID para   -
    ‚ * -                el texto                                        -
    ‚ * - CCSIDStsDta    Indicador del estado de conversión CCSID para   -
    ‚ * -                los datos del mensaje o del texto directo del   -
    ‚ * -                mensaje                                         -
    ‚ * - alrOpt         Opción de alerta                                -
    ‚ * - CCSIDMsgTxt    CCSID del mensaje o de la ayuda                 -
    ‚ * - CCSIDMsgDta    CCSID del de los datos del mensaje o del texto  -
    ‚ * -                directo del mensaje                             -
    ‚ * - dtaLenRtn      Longitud devuelta de los datos del mensaje o    -
    ‚ * -                del texto directo del mensaje                   -
    ‚ * - dtaLenAvl      Longitud disponible de los datos del mensaje o  -
    ‚ * -                del texto directo del mensaje                   -
    ‚ * - msgLenRtn      Longitud devuelta del mensaje                   -
    ‚ * - msgLenAvl      Longitud disponible del mensaje                 -
    ‚ * - hlpLenRtn      Longitud devuelta de la ayuda del mensaje       -
    ‚ * -                texto directo del mensaje                       -
    ‚ * -                                                                -
    ‚ * - PARTE VARIABLE DE LA ESTRUCTURA DE DATOS                       -
    ‚ * -                                                                -
    ‚ * - Char(*)        Datos del mensaje (valores de las variables),   -
    ‚ * -                el texto directo del mensaje, el texto del      -
    ‚ * -                mensaje y la ayuda del mensaje                  -
    ‚ * ------------------------------------------------------------------

     D RCVM0200_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   bytesRtn                    10I 0 Overlay( RCVM0200_T:  1 )
     D   bytesAvl                    10I 0 Overlay( RCVM0200_T:  5 )
     D   msgSev                      10I 0 Overlay( RCVM0200_T:  9 )
     D   msgId                        7A   Overlay( RCVM0200_T: 13 )
     D   msgType                      2A   Overlay( RCVM0200_T: 20 )
     D   msgKey                       4A   Overlay( RCVM0200_T: 22 )
     D   msgFName                    10A   Overlay( RCVM0200_T: 26 )
     D   msgFlibSpec                 10A   Overlay( RCVM0200_T: 36 )
     D   msgFlibUsed                 10A   Overlay( RCVM0200_T: 46 )
     D   sndJobName                  10A   Overlay( RCVM0200_T: 56 )
     D   sndJobUsr                   10A   Overlay( RCVM0200_T: 66 )
     D   sndJobNbr                    6A   Overlay( RCVM0200_T: 76 )
     D   sndPgmName                  12A   Overlay( RCVM0200_T: 82 )
     D                                4A
     D   datSent                      7A   Overlay( RCVM0200_T: 98 )
     D   timSent                      6A   Overlay( RCVM0200_T: 105 )
     D   timSntMs                     6A   Overlay( RCVM0200_T: 111 )
     D   sndUsrPrf                   10A   Overlay( RCVM0200_T: 117 )
     D                                1A
     D   CCSIDStsTxt                 10I 0 Overlay( RCVM0200_T: 128 )
     D   CCSIDStsDta                 10I 0 Overlay( RCVM0200_T: 132 )
     D   alrOpt                       9A   Overlay( RCVM0200_T: 136 )
     D   CCSIDMsgTxt                 10I 0 Overlay( RCVM0200_T: 145 )
     D   CCSIDMsgDta                 10I 0 Overlay( RCVM0200_T: 149 )
     D   dtaLenRtn                   10I 0 Overlay( RCVM0200_T: 153 )
     D   dtaLenAvl                   10I 0 Overlay( RCVM0200_T: 157 )
     D   msgLenRtn                   10I 0 Overlay( RCVM0200_T: 161 )
     D   msgLenAvl                   10I 0 Overlay( RCVM0200_T: 165 )
     D   hlpLenRtn                   10I 0 Overlay( RCVM0200_T: 169 )
     D   hlpLenAvl                   10I 0 Overlay( RCVM0200_T: 173 )
    ‚D* Desde aquí la parte variable...

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato RCVM0200 con información relacionada con el mensaje    -
    ‚ * - recuperado desde una cola de mensajes de la pila de llamadas.  -
    ‚ * -                                                                -
    ‚ * - Formato válido para las APIs:                                  -
    ‚ * -   Receive Program Message (QMHRCVPM)                           -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytesRtn       Bytes devueltos                                 -
    ‚ * - bytesAvl       Bytes disponibles                               -
    ‚ * - msgSev         Gravedad del mensaje                            -
    ‚ * - msgId          Identificador del mensajes                      -
    ‚ * - msgType        Tipo del mensaje                                -
    ‚ * - msgKey         Clave del mensaje                               -
    ‚ * - msgFName       Nombre del archivo de mensajes                  -
    ‚ * - msgFlibSpec    Biblioteca del archivo de mensajes que se ha    -
    ‚ * -                especificado                                    -
    ‚ * - msgFlibUsed    Biblioteca del archivo de mensajes que se       -
    ‚ * -                está utilizando                                 -
    ‚ * - sndJobName     Nombre del trabajo que envía el mensaje         -
    ‚ * - sndJobUsr      Nombre de usuario del trabajo que envía el      -
    ‚ * -                mensaje                                         -
    ‚ * - sndJobNbr      Número del trabajo que envía el mensaje         -
    ‚ * - sndPgmName     Nombre del programa que envía el mensaje        -
    ‚ * - datSent        Fecha de envío del mensaje                      -
    ‚ * - timSent        Hora de envío del mensaje                       -
    ‚ * - sndUsrPrf      Usuario que ha enviado el mensaje               -
    ‚ * - CCSIDStsTxt    Indicador del estado de conversión CCSID para   -
    ‚ * -                el texto                                        -
    ‚ * - CCSIDStsDta    Indicador del estado de conversión CCSID para   -
    ‚ * -                los datos del mensaje o del texto directo del   -
    ‚ * -                mensaje                                         -
    ‚ * - alrOpt         Opción de alerta                                -
    ‚ * - CCSIDMsgTxt    CCSID del mensaje o de la ayuda                 -
    ‚ * - CCSIDMsgDta    CCSID del de los datos del mensaje o del texto  -
    ‚ * -                directo del mensaje                             -
    ‚ * - dtaLenRtn      Longitud devuelta de los datos del mensaje o    -
    ‚ * -                del texto directo del mensaje                   -
    ‚ * - dtaLenAvl      Longitud disponible de los datos del mensaje o  -
    ‚ * -                del texto directo del mensaje                   -
    ‚ * - msgLenRtn      Longitud devuelta del mensaje                   -
    ‚ * - msgLenAvl      Longitud disponible del mensaje                 -
    ‚ * - hlpLenRtn      Longitud devuelta de la ayuda del mensaje       -
    ‚ * -                texto directo del mensaje                       -
    ‚ * -                                                                -
    ‚ * - PARTE VARIABLE DE LA ESTRUCTURA DE DATOS                       -
    ‚ * -                                                                -
    ‚ * - Char(*)        Datos del mensaje (valores de las variables),   -
    ‚ * -                el texto directo del mensaje, el texto del      -
    ‚ * -                mensaje y la ayuda del mensaje                  -
    ‚ * ------------------------------------------------------------------

     D RCVM0200PM_T    DS                  Based( apityp_ )
     D                                     Qualified
     D   bytesRtn                    10I 0 Overlay( RCVM0200PM_T:  1 )
     D   bytesAvl                    10I 0 Overlay( RCVM0200PM_T:  5 )
     D   msgSev                      10I 0 Overlay( RCVM0200PM_T:  9 )
     D   msgId                        7A   Overlay( RCVM0200PM_T: 13 )
     D   msgType                      2A   Overlay( RCVM0200PM_T: 20 )
     D   msgKey                       4A   Overlay( RCVM0200PM_T: 22 )
     D   msgFName                    10A   Overlay( RCVM0200PM_T: 26 )
     D   msgFlibSpec                 10A   Overlay( RCVM0200PM_T: 36 )
     D   msgFlibUsed                 10A   Overlay( RCVM0200PM_T: 46 )
     D   sndJobName                  10A   Overlay( RCVM0200PM_T: 56 )
     D   sndJobUsr                   10A   Overlay( RCVM0200PM_T: 66 )
     D   sndJobNbr                    6A   Overlay( RCVM0200PM_T: 76 )
     D   sndPgmName                  12A   Overlay( RCVM0200PM_T: 82 )
     D   sndPgmInstNbr...
     D                                4A   Overlay( RCVM0200PM_T: 94 )
     D   datSent                      7A   Overlay( RCVM0200PM_T: 98 )
     D   timSent                      6A   Overlay( RCVM0200PM_T: 105 )
     D   rcvPgmName                  10A   Overlay( RCVM0200PM_T: 111 )
     D   rcvPgmInstNbr...
     D                                1A   Overlay( RCVM0200PM_T: 121 )
     D   sndType                      1A   Overlay( RCVM0200PM_T: 125 )
     D   rcvType                      1A   Overlay( RCVM0200PM_T: 126 )
     D                                1A
     D   CCSIDStsTxt                 10I 0 Overlay( RCVM0200PM_T: 128 )
     D   CCSIDStsDta                 10I 0 Overlay( RCVM0200PM_T: 132 )
     D   alrOpt                       9A   Overlay( RCVM0200PM_T: 136 )
     D   CCSIDMsgTxt                 10I 0 Overlay( RCVM0200PM_T: 145 )
     D   CCSIDMsgDta                 10I 0 Overlay( RCVM0200PM_T: 149 )
     D   dtaLenRtn                   10I 0 Overlay( RCVM0200PM_T: 153 )
     D   dtaLenAvl                   10I 0 Overlay( RCVM0200PM_T: 157 )
     D   msgLenRtn                   10I 0 Overlay( RCVM0200PM_T: 161 )
     D   msgLenAvl                   10I 0 Overlay( RCVM0200PM_T: 165 )
     D   hlpLenRtn                   10I 0 Overlay( RCVM0200PM_T: 169 )
     D   hlpLenAvl                   10I 0 Overlay( RCVM0200PM_T: 173 )
    ‚D* Desde aquí la parte variable...

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato RCVM0300 con información relacionada con el mensaje    -
    ‚ * - recuperado desde una cola de mensajes de la pila de llamadas.  -
    ‚ * -                                                                -
    ‚ * - Formato válido para las APIs:                                  -
    ‚ * -   Receive Program Message (QMHRCVPM)                           -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytesRtn       Bytes devueltos                                 -
    ‚ * - bytesAvl       Bytes disponibles                               -
    ‚ * - msgSev         Gravedad del mensaje                            -
    ‚ * - msgId          Identificador del mensajes                      -
    ‚ * - msgType        Tipo del mensaje                                -
    ‚ * - msgKey         Clave del mensaje                               -
    ‚ * - msgFName       Nombre del archivo de mensajes                  -
    ‚ * - msgFlibSpec    Biblioteca del archivo de mensajes que se ha    -
    ‚ * -                especificado                                    -
    ‚ * - msgFlibUsed    Biblioteca del archivo de mensajes que se       -
    ‚ * -                está utilizando                                 -
    ‚ * - alertOpt       Opción de alerta                                -
    ‚ * - CCSIDStsIndMsgAndHlp                                           -
    ‚ * -                CCSID conversion status indicator of message    -
    ‚ * -                and message help                                -
    ‚ * - CCSIDStsIndDtaOrTxt                                            -
    ‚ * -                CCSID conversion status indicator of message    -
    ‚ * -                data or text                                    -
    ‚ * - CCSIDRplDtaOrTxt                                               -
    ‚ * -                CCSID de los datos de sustitución o del texto   -
    ‚ * -                directo del mensaje                             -
    ‚ * - CCSIDRplDtaAndHlp                                              -
    ‚ * -                CCSID de los datos de sustitución y de la       -
    ‚ * -                ayuda del mensaje                               -
    ‚ * - rplDtaOrTxtLenRtn                                              -
    ‚ * -                Longitud devuelta de los datos de sustitución o -
    ‚ * -                del texto directo del mensaje                   -
    ‚ * - rplDtaOrTxtLenAvl                                              -
    ‚ * -                Longitud disponible de los datos de sustitución -
    ‚ * -                o del texto directo del mensaje                 -
    ‚ * - msgLenRtn      Longitud devuelta del mensaje                   -
    ‚ * - msgLenAvl      Longitud disponible del mensaje                 -
    ‚ * - hlpLenRtn      Longitud devuelta de la ayuda del mensaje       -
    ‚ * - hlpLenAvl      Longitud disponible de la ayuda del mensaje     -
    ‚ * - senderInfLenRtn                                                -
    ‚ * -                Longitud devuelta de la información del         -
    ‚ * -                remitente del mensaje                           -
    ‚ * - senderInfLenAvl                                                -
    ‚ * -                Longitud disponible de la información del       -
    ‚ * -                remitente del mensaje                           -
    ‚ * -                                                                -
    ‚ * - PARTE VARIABLE DE LA ESTRUCTURA DE DATOS                       -
    ‚ * -                                                                -
    ‚ * - Char(*)         Datos de reemplazo o texto directo del mensaje.-
    ‚ * - Char(*)         Mensaje.                                       -
    ‚ * - Char(*)         Ayuda del mensaje.                             -
    ‚ * - Char(*)         Información del remitente.                     -
    ‚ * ------------------------------------------------------------------

     D RCVM0300PM_T    DS                  Based( apityp_ )
     D                                     Qualified
     D   bytesRtn                    10I 0 Overlay( RCVM0300PM_T:  1 )
     D   bytesAvl                    10I 0 Overlay( RCVM0300PM_T:  5 )
     D   msgSev                      10I 0 Overlay( RCVM0300PM_T:  9 )
     D   msgId                        7A   Overlay( RCVM0300PM_T: 13 )
     D   msgType                      2A   Overlay( RCVM0300PM_T: 20 )
     D   msgKey                       4A   Overlay( RCVM0300PM_T: 22 )
     D   msgFName                    10A   Overlay( RCVM0300PM_T: 26 )
     D   msgFlibSpec                 10A   Overlay( RCVM0300PM_T: 36 )
     D   msgFlibUsed                 10A   Overlay( RCVM0300PM_T: 46 )
     D   alertOpt                     9A   Overlay( RCVM0300PM_T: 56 )
     D   CCSIDStsIndMsgAndHlp...
     D                               10I 0 Overlay( RCVM0300PM_T: 65 )
     D   CCSIDStsIndDtaOrTxt...
     D                               10I 0 Overlay( RCVM0300PM_T: 69 )
     D   CCSIDRplDtaOrTxt...
     D                               10I 0 Overlay( RCVM0300PM_T: 73 )
     D   CCSIDRplDtaAndHlp...
     D                               10I 0 Overlay( RCVM0300PM_T: 77 )
     D   rplDtaOrTxtLenRtn...
     D                               10I 0 Overlay( RCVM0300PM_T: 81 )
     D   rplDtaOrTxtLenAvl...
     D                               10I 0 Overlay( RCVM0300PM_T: 85 )
     D   msgLenRtn                   10I 0 Overlay( RCVM0300PM_T: 89 )
     D   msgLenAvl                   10I 0 Overlay( RCVM0300PM_T: 93 )
     D   hlpLenRtn                   10I 0 Overlay( RCVM0300PM_T: 97 )
     D   hlpLenAvl                   10I 0 Overlay( RCVM0300PM_T: 101 )
     D   senderInfLenRtn...
     D                               10I 0 Overlay( RCVM0300PM_T: 105 )
     D   senderInfLenAvl...
     D                               10I 0 Overlay( RCVM0300PM_T: 109 )
    ‚D* Desde aquí la parte variable (113) ...
    ‚D*   1. Datos de reemplazo o texto directo del mensaje.
    ‚D*   2. Mensaje.
    ‚D*   3. Ayuda del mensaje.
    ‚D*   4. Información del remitente.
    ‚D* Los desplazamientos de estos campos se calculan tomando el
    ‚D* desplazamiento del último campo de longitud fija más la
    ‚D* la longitud de los campos variables anteriores.

    ‚ * ------------------------------------------------------------------
    ‚ * - Estructura con la información del remitente incluida en el     -
    ‚ * - formato RCVM0300.                                              -
    ‚ * -                                                                -
    ‚ * - Formato válido para las APIs:                                  -
    ‚ * -   Receive Program Message (QMHRCVPM)                           -
    ‚ * ------------------------------------------------------------------
    ‚ * - jobName        Nombre del trabajo que envía el mensaje.        -
    ‚ * - jobUser        Usuario del nombre del trabajo que envía.       -
    ‚ * - jobNbr         Número del trabajo que envía.                   -
    ‚ * - date           Fecha de envío.                                 -
    ‚ * - time           Hora de envío.                                  -
    ‚ * - sendingType    Tipo del remitente.                             -
    ‚ * - sndProgramName Nombre del programa remitente.                  -
    ‚ * - sndModuleName  Nombre del módulo remitente.                    -
    ‚ * - sndProcedureName                                               -
    ‚ * -                Nombre del procedimiento remitente.             -
    ‚ * - sndNbrOfStatementNumbersAvl                                    -
    ‚ * -                La cantidad de número de sentencias o           -
    ‚ * -                instrucciones del programa remitente.           -
    ‚ * - sndPgmStatementNumbers                                         -
    ‚ * -                Número de las sentencias o instrucciones.       -
    ‚ * - rcvProgramName Nombre del programa destinatario.               -
    ‚ * - rcvModuleName  Nombre del módulo destinatario.                 -
    ‚ * - rcvProcedureName                                               -
    ‚ * -                Nombre del procedimiento destinatario.          -
    ‚ * - rcvNbrOfStatementNumbersAvl                                    -
    ‚ * -                La cantidad del número de sentencias o          -
    ‚ * -                instrucciones del programa destinatario.        -
    ‚ * - rcvPgmStatementNumbers                                         -
    ‚ * -                Número de las sentencias o instrucciones.       -
    ‚ * - offsLongSndProgramName                                         -
    ‚ * -                Desplazamiento al nombre largo del programa     -
    ‚ * -                remitente.                                      -
    ‚ * - lenLongSndProgramName                                          -
    ‚ * -                Longitud del nombre largo del programa          -
    ‚ * -                remitente.                                      -
    ‚ * - offsLongSndProcedureName                                       -
    ‚ * -                Desplazamiento al nombre largo del procedimiento-
    ‚ * -                remitente.                                      -
    ‚ * - lenLongSndProcedureName                                        -
    ‚ * -                Longitud del nombre largo del procedimiento     -
    ‚ * -                remitente.                                      -
    ‚ * - offsLongRcvProcedureName                                       -
    ‚ * -                Desplazamiento al nombre largo del procedimiento-
    ‚ * -                destinatario.                                   -
    ‚ * - lenLongRcvProcedureName                                        -
    ‚ * -                Longitud del nombre largo del procedimiento     -
    ‚ * -                destinatario.                                   -
    ‚ * - microseconds   Microsegundos.                                  -
    ‚ * - sendingUser    Nombre del usario actual que envía el mensaje.  -
    ‚ * -                                                                -
    ‚ * - PARTE VARIABLE DE LA ESTRUCTURA DE DATOS                       -
    ‚ * -                                                                -
    ‚ * - Char(*)        Nombre largo del programa remitente.            -
    ‚ * - Char(*)        Nombre largo del procedimiento remitente.       -
    ‚ * - Char(*)        Nombre largo del procedimiento destinatario.    -
    ‚ * ------------------------------------------------------------------

     D RCVM0300PM_senderInf_T...
     D                 DS                  Based( apityp_ )
     D                                     Qualified
     D   jobName                     10A   Overlay( RCVM0300PM_senderInf_T:  1 )
     D   jobUser                     10A   Overlay( RCVM0300PM_senderInf_T: 11 )
     D   jobNbr                       6A   Overlay( RCVM0300PM_senderInf_T: 21 )
     D   date                         7A   Overlay( RCVM0300PM_senderInf_T: 27 )
     D   time                         6A   Overlay( RCVM0300PM_senderInf_T: 34 )
     D   sendingType                  1A   Overlay( RCVM0300PM_senderInf_T: 39 )
     D   receivingTyp                 1A   Overlay( RCVM0300PM_senderInf_T: 41 )
    ‚D*    En la documentación V5R4 este campo está definido de 12A.
     D   sndProgramName...
     D                               10A   Overlay( RCVM0300PM_senderInf_T: 42 )
     D                                2A
     D   sndModuleName...
     D                               10A   Overlay( RCVM0300PM_senderInf_T: 54 )
     D   sndProcedureName...
     D                              256A   Overlay( RCVM0300PM_senderInf_T: 64 )
     D                                1A
    ‚D* ¡Obsoleto!
     D   sndNbrOfStatementNumbresAvl...
     D                               10I 0 Overlay( RCVM0300PM_senderInf_T:321 )
    ‚D*
     D   sndNbrOfStatementNumbersAvl...
     D                               10I 0 Overlay( RCVM0300PM_senderInf_T:321 )
     D   sndPgmStatementNumbers...
     D                               30A   Overlay( RCVM0300PM_senderInf_T:325 )
    ‚D*    En la documentación V5R4 este campo está definido de 12A.
     D   rcvProgramName...
     D                               10A   Overlay( RCVM0300PM_senderInf_T:355 )
     D   rcvModuleName...
     D                               10A   Overlay( RCVM0300PM_senderInf_T:365 )
     D   rcvProcedureName...
     D                              256A   Overlay( RCVM0300PM_senderInf_T:375 )
     D                               10A
    ‚D* ¡Obsoleto!
     D   rcvNbrOfStatementNumbresAvl...
     D                               10I 0 Overlay( RCVM0300PM_senderInf_T:641 )
    ‚D*
     D   rcvNbrOfStatementNumbersAvl...
     D                               10I 0 Overlay( RCVM0300PM_senderInf_T:641 )
     D   rcvPgmStatementNumbers...
     D                               30A   Overlay( RCVM0300PM_senderInf_T:645 )
     D                                2A
     D   offsLongSndProgramName...
     D                               10I 0 Overlay( RCVM0300PM_senderInf_T:677 )
     D   lenLongSndProgramName...
     D                               10I 0 Overlay( RCVM0300PM_senderInf_T:681 )
     D   offsLongSndProcedureName...
     D                               10I 0 Overlay( RCVM0300PM_senderInf_T:685 )
     D   lenLongSndProcedureName...
     D                               10I 0 Overlay( RCVM0300PM_senderInf_T:689 )
     D   offsLongRcvProcedureName...
     D                               10I 0 Overlay( RCVM0300PM_senderInf_T:693 )
     D   lenLongRcvProcedureName...
     D                               10I 0 Overlay( RCVM0300PM_senderInf_T:697 )
     D   microseconds                 6A   Overlay( RCVM0300PM_senderInf_T:701 )
     D   sendingUser                 10A   Overlay( RCVM0300PM_senderInf_T:707 )
    ‚D* Desde aquí la parte variable (717) ...
    ‚D*   1. Reservado.
    ‚D*   2. Nombre largo del programa que envía.
    ‚D*   3. Nombre largo del procedimiento que envía.
    ‚D*   4. Nombre largo del procedimiento que recibe.

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato LSTM0100 usado por la API List Nonprogram Messages     -
    ‚ * - QMHLSTM. Es la estructura de cada una de las entradas de       -
    ‚ * - la sección de datos del espacio de usuario.                    -
    ‚ * ------------------------------------------------------------------
    ‚ * - offsNxtEnt     Desplazamiento para la siguiente entrada        -
    ‚ * - offsFldRet     Desplazamiento a la lista de campos devueltos   -
    ‚ * - nbrFldRet      Número de campos devueltos                      -
    ‚ * - msgSev         Gravedad del mensaje                            -
    ‚ * - msgId          Identificador del mensaje                       -
    ‚ * - msgType        Tipo del mensaje                                -
    ‚ * - msgKey         Clave del mensaje                               -
    ‚ * - msgFileName    Nombre del archivo de mensajes                  -
    ‚ * - msgFileLib     Biblioteca del archivo de mensajes en el        -
    ‚ * -                momento del envío                               -
    ‚ * - msgQNam        Cola de mensajes                                -
    ‚ * - msgQLib        Biblioteca de la cola de mensajes               -
    ‚ * - dateSent       Fecha del envío del mensaje                     -
    ‚ * - timeSent       Hora del envío del mensaje                      -
    ‚ * - microsec       Microsegundos                                   -
    ‚ * -                texto directo del mensaje                       -
    ‚ * -                                                                -
    ‚ * - PARTE VARIABLE DE LA ESTRUCTURA DE DATOS                       -
    ‚ * -                                                                -
    ‚ * - Char(*)        Información por cada identificador de campo.    -
    ‚ * ------------------------------------------------------------------

     D LSTM0100_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   offsNxtEnt                  10I 0 Overlay( LSTM0100_T:  1 )
     D   offsFldRet                  10I 0 Overlay( LSTM0100_T:  5 )
     D   nbrFldRet                   10I 0 Overlay( LSTM0100_T:  9 )
     D   msgSev                      10I 0 Overlay( LSTM0100_T: 13 )
     D   msgId                        7A   Overlay( LSTM0100_T: 17 )
     D   msgType                      2A   Overlay( LSTM0100_T: 24 )
     D   msgKey                       4A   Overlay( LSTM0100_T: 26 )
     D   msgFileName                 10A   Overlay( LSTM0100_T: 30 )
     D   msgFileLib                  10A   Overlay( LSTM0100_T: 40 )
     D   msgQNam                     10A   Overlay( LSTM0100_T: 50 )
     D   msgQLib                     10A   Overlay( LSTM0100_T: 60 )
     D   dateSent                     7A   Overlay( LSTM0100_T: 70 )
     D   timeSent                     6A   Overlay( LSTM0100_T: 77 )
     D   microsec                     6A   Overlay( LSTM0100_T: 83 )
    ‚D* Aquí la parte variable con la información de los campos...

    ‚ * ------------------------------------------------------------------
    ‚ * - Estructura para los datos de los distintos identificadores     -
    ‚ * - de campo devuelto por el API QHMLSTM junto con el formato      -
    ‚ * - LSTM0100.                                                      -
    ‚ * ------------------------------------------------------------------

     D LSTM_field_T    DS                  Based( apityp_ )
     D                                     Qualified
     D   offsNxtFld                  10I 0
     D   lenFldInfRet                10I 0
     D   idFld                       10I 0
     D   type                         1A
     D   status                       1A
     D                               14A
     D   lenData                     10I 0
    ‚D* Char(*) - Datos
    ‚D* Char(*) - Reservado

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato MSLT0100 usado por la API List Nonprogram Messages     -
    ‚ * - QMHLSTM. Utilizado en el parámetro donde se suministra         -
    ‚ * - información de selección de mensajes.                          -
    ‚ * ------------------------------------------------------------------
    ‚ * - maxMsgReq      Número máximo de mensajes solicitados           -
    ‚ * - listDirec      La dirección de la lista de mensajes            -
    ‚ * - selCriteria    Criterio de selección                           -
    ‚ * - sevCriteria    Criterio de gravedad                            -
    ‚ * - maxMsgLen      Longitud máxima del mensaje                     -
    ‚ * - maxMsgHlpLen   Longitud máxima de la ayuda del mensaje         -
    ‚ * - offsetMsgQNames Desplazamiento a la lista de nombres           -
    ‚ * -                 calificados de colas de mensaje                -
    ‚ * - offsetMsgKeys  Desplazamiento a la lista de claves             -
    ‚ * - nbrMsgQueues   Número de colas de mensajes                     -
    ‚ * - offsetIdFldRet Desplazamiento a la lista de identificadores de -
    ‚ * -                campos a devolver                               -
    ‚ * - nbrFldRet      Número de campos a devolver                     -
    ‚ * ------------------------------------------------------------------

     D MSLT0100_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   maxMsgReq                   10I 0 Overlay( MSLT0100_T:  1 )
     D   listDirec                   10A   Overlay( MSLT0100_T:  5 )
     D   selCriteria                 10A   Overlay( MSLT0100_T: 15 )
     D   sevCriteria                 10I 0 Overlay( MSLT0100_T: 25 )
     D   maxMsgLen                   10I 0 Overlay( MSLT0100_T: 29 )
     D   maxMsgHlpLen                10I 0 Overlay( MSLT0100_T: 33 )
     D   offsMsgQNames...
     D                               10I 0 Overlay( MSLT0100_T: 37 )
     D   offsMsgKeys                 10I 0 Overlay( MSLT0100_T: 41 )
     D   nbrMsgQueues                10I 0 Overlay( MSLT0100_T: 45 )
     D   offsIdFldsRet...
     D                               10I 0 Overlay( MSLT0100_T: 49 )
     D   nbrFldsRet                  10I 0 Overlay( MSLT0100_T: 53 )

     D MSLT0100_msgQNam_T...
     D                 DS                  Based( apityp_ )
     D                                     Qualified
     D   msgQName                    20A

     D MSLT0100_strMsgKey_T...
     D                 DS                  Based( apityp_ )
     D                                     Qualified
     D   strMsgkey                    4A

     D MSLT0100_idFldRet_T...
     D                 DS                  Based( apityp_ )
     D                                     Qualified
     D   idFldRet                    10I 0

    ‚ * ==================================================================
    ‚ * = DECLARACIÓN DE FUNCIONES Y PROCEDIMIENTOS PUBLICOS             =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * -  OPERACIONES CON COLAS DE MENSAJES                             -
    ‚ * ------------------------------------------------------------------

    ‚ * ------------------------------------------------------------------
    ‚ * - SndMsg - Enviar un mensaje a una cola de mensajes              -
    ‚ * -                                                                -
    ‚ * - Send Nonprogram Message (QMHSNDM)                              -
    ‚ * ------------------------------------------------------------------

     D SndMsg          PR                  ExtPgm( 'QMHSNDM' )
     D   msgID                             Const Like( TypeMessageId )
     D   mdgF                              Const Like( TypeQualName )
     D   msgTxt                            Const Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   msgTxtLen                         Const Like( TypeInt )
     D   msgType                           Const Like( TypeName )
     D   msgQueues                         Const Like( TypeQualName )
     D                                           Dim( 50 )
     D                                           Options( *VARSIZE )
     D   numQueues                         Const Like( TypeInt )
     D   rpyQueue                          Const Like( TypeQualName )
     D   msgKey                                  Like( TypeMessageKey )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )
    ‚D* Grupo opcional 1
     D   CCSID                             Const Like( TypeInt )
     D                                           Options( *NOPASS )

    ‚ * ------------------------------------------------------------------
    ‚ * - RcvMsg - Recibir mensaje de una cola de mensajes               -
    ‚ * -                                                                -
    ‚ * - Receive Nonprogram Message (QMHRCVM)                           -
    ‚ * ------------------------------------------------------------------

     D RcvMsg          PR                  ExtPgm( 'QMHRCVM' )
     D   rcvVar                                  Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   rcvVarLen                         Const Like( TypeInt )
     D   fmtNam                            Const Like( TypeApiFormat )
     D   msgQueQ                           Const Like( TypeQualName )
     D   msgTyp                            Const Like( TypeName )
     D   msgKey                            Const Like( TypeMessageKey )
     D   wait                              Const Like( TypeInt )
     D   msgAct                            Const Like( TypeName )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )
    ‚D* Grupo opcional 1
     D   ccsId                             Const Like( TypeInt )
     D                                           Options( *NOPASS )
    ‚D* Grupo opcional 2
     D   alwDftRpyRj                       Const Like( TypeName )
     D                                           Options( *NOPASS )

    ‚ * ------------------------------------------------------------------
    ‚ * - RmvMsg - Elimina mensajes de una cola de mensajes              -
    ‚ * -                                                                -
    ‚ * - Remove Nonprogram Messages (QMHRMVM)                           -
    ‚ * ------------------------------------------------------------------

     D RmvMsg          PR                  ExtPgm( 'QMHRMVM' )
     D   msgQueQ                           Const Like( TypeQualName )
     D   msgKey                            Const Like( TypeMessageKey )
     D   rmvOpt                            Const Like( TypeName )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )
    ‚D* Grupo opcional 1
     D   alwDftRpyRj                       Const Like( TypeName )
     D                                           Options( *NOPASS )

    ‚ * ------------------------------------------------------------------
    ‚ * - LstMsg - Listar mensajes de una cola de mensajes               -
    ‚ * -                                                                -
    ‚ * - List Nonprogram Messages (QMHLSTM)                             -
    ‚ * ------------------------------------------------------------------

     D LstMsg          PR                  ExtPgm( 'QMHLSTM' )
     D   usrSpc                            Const Like( TypeQualName )
     D   format                            Const Like( TypeApiFormat )
     D   msgSelInf                         Const Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   sizMsgSelInf                      Const Like( TypeInt )
     D   fmtMsgSelInf                      Const Like( TypeApiFormat )
     D   errorCode                               Like( TypeApiError )
     D                                           Options( *VARSIZE )


    ‚ * ------------------------------------------------------------------
    ‚ * -  OPERACIONES CON COLAS DE MENSAJES DE PROGRAMAS                -
    ‚ * ------------------------------------------------------------------

    ‚ * ------------------------------------------------------------------
    ‚ * - SndPgmMsg - Enviar mensaje a cola de mensajes de programa      -
    ‚ * -                                                                -
    ‚ * - Send Program Message (QMHSNDPM)                                -
    ‚ * ------------------------------------------------------------------

     D SndPgmMsg       PR                  ExtPgm( 'QMHSNDPM' )
     D   msgID                             Const Like( TypeMessageId )
     D   msgF                              Const Like( TypeQualName )
     D   msgData                           Const Like( TypeBuffer )
     D   msgDataLen                        Const Like( TypeInt )
     D   msgType                           Const Like( TypeName )
     D   callStackEnt                      Const Like( TypeName )
     D   callStackCtr                      Const Like( TypeInt )
     D   msgKey                                  Like( TypeMessageKey )
     D   error                                   Like( TypeAPIError )
     D                                           Options( *VARSIZE )
    ‚D* Grupo opcional 1
     D   lenCallStackEnt...
     D                                     Const Like( TypeInt )
     D                                           Options( *NOPASS )
     D   callStackEntQual...
     D                                     Const Like( TypeQualName )
     D                                           Options( *NOPASS )
     D   screenWaitTime...
     D                                     Const Like( TypeInt )
     D                                           Options( *NOPASS )
    ‚D* Grupo opcional 2
     D   callStackEntDtaType...
     D                                     Const Like( TypeName )
     D                                           Options( *NOPASS )
     D   codedCharSetId...
     D                                     Const Like( TypeInt )
     D                                           Options( *NOPASS )

    ‚ * ------------------------------------------------------------------
    ‚ * - RcvPgmMsg - Recibir mensaje de una cola de mensajes de programa-
    ‚ * -                                                                -
    ‚ * - Recieve Program Message (QMHRCVPM)                             -
    ‚ * ------------------------------------------------------------------

     D RcvPgmMsg       PR                  ExtPgm( 'QMHRCVPM' )
     D   rcvVar                                  Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   rcvVarLen                         Const Like( TypeInt )
     D   format                            Const Like( TypeApiFormat )
     D   stackEntry                        Const Like( TypeName )
     D   stackCount                        Const Like( TypeInt )
     D   msgType                           Const Like( TypeName )
     D   msgKey                            Const Like( TypeMessageKey )
     D   waitTime                          Const Like( TypeInt )
     D   msgAction                         Const Like( TypeName )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )
    ‚D* Grupo opcional 1
     D   lenCallStackEnt...
     D                                     Const Like( TypeInt )
     D                                           Options( *NOPASS )
     D   callStackEntQual...
     D                                     Const Like( TypeQualName )
     D                                           Options( *NOPASS )
    ‚D* Grupo opcional 2
     D   callStackEntDtaType...
     D                                     Const Like( TypeName )
     D                                           Options( *NOPASS )
     D   codedCharSetId...
     D                                     Const Like( TypeInt )
     D                                           Options( *NOPASS )
    ‚D* Grupo opcional 3
     D   alwDftRpyRj                       Const Like( TypeName )
     D                                           Options( *NOPASS )

    ‚ * ------------------------------------------------------------------
    ‚ * - RmvPgmMsg - Elimina mensajes de la cola de mensajes de programa-
    ‚ * -                                                                -
    ‚ * - Remove Program Messages (QMHRMVPM)                             -
    ‚ * ------------------------------------------------------------------

     D RmvPgmMsg       PR                  ExtPgm( 'QMHRMVPM' )
     D   callStackEnt                      Const Like( TypeString )
     D   callStack                         Const Like( TypeInt )
     D   msgKey                            Const Like( TypeMessageKey )
     D   msgRmv                            Const Like( TypeName )
     D   error                                   Like( TypeAPIError )
    ‚D* Grupo opcional 1
     D   lenCallStackEnt...
     D                                     Const Like( TypeInt )
     D                                           Options( *NOPASS )
     D   callStackEntQual...
     D                                     Const Like( TypeQualName )
     D                                           Options( *NOPASS )
     D   rmvUnHandledExcpt...
     D                                     Const Like( TypeName )
     D                                           Options( *NOPASS )
    ‚D* Grupo opcional 2
     D   callStackEntDtaType...
     D                                     Const Like( TypeName )
     D                                           Options( *NOPASS )

    ‚ * ------------------------------------------------------------------
    ‚ * - MovPgmMsg - Mover mensajes de programa                         -
    ‚ * -                                                                -
    ‚ * - Move Programa Messages (QMHMOVPM)                              -
    ‚ * ------------------------------------------------------------------

     D MovPgmMsg       PR                  ExtPgm( 'QMHMOVPM' )
     D   msgKey                            Const Like( TypeMessageKey )
     D   msgTypes                          Const Like( TypeName )
     D                                           Dim( 4 )
     D                                           Options( *VARSIZE )
     D   nbrMsgTypes                       Const Like( TypeInt )
     D   toCallStkE                        Const Like( TypeBuffer )
     D                                           Options( *VARSIZE)
     D   toCallStkCnt                      Const Like( TypeInt )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )
    ‚D* Grupo opcional 1
     D   toCallStkLen                      Const Like( TypeInt )
     D                                           Options( *NOPASS )
     D   toCallStkEq                       Const Like( TypeQualName )
     D                                           Options( *NOPASS )
    ‚D* Grupo opcional 2
     D   toCalStkEdt                       Const Like( TypeName )
     D                                           Options( *NOPASS )
     D   frmCalStkEad                      Const Like( TypePtr )
     D                                           Options( *NOPASS )
     D   frmCalStkCnt                      Const Like( TypeInt )
     D                                           Options( *NOPASS )

    ‚ * ------------------------------------------------------------------
    ‚ * - RsnEscMsg - Reenviar Mensaje de Escape                         -
    ‚ * -                                                                -
    ‚ * - Resend Escape Message (QMHRSNEM)                               -
    ‚ * ------------------------------------------------------------------

     D RsnEscMsg       PR                  ExtPgm('QMHRSNEM')
     D   msgKey                            Const Like( TypeMessageKey )
     D   errorCode                               Like( TypeApiError )
     D                                           Options( *VARSIZE )
    ‚D* Grupo opcional 1
     D   toStkEntry                              Like( TypeBuffer)
     D                                           Options( *VARSIZE: *NOPASS )
     D   toStkEntryLn                      Const Like( TypeInt )
     D                                           Options( *NOPASS )
     D   format                            Const Like( TypeApiFormat )
     D                                           Options( *NOPASS )
     D   fromEntry                         Const Like( TypePtr )
     D                                           Options( *NOPASS )
     D   fromCounter                       const Like( TypeInt )
     D                                           Options( *NOPASS )


    ‚ * ------------------------------------------------------------------
    ‚ * -  OPERACIONES CON ARCHIVOS DE MENSAJES                          -
    ‚ * ------------------------------------------------------------------

    ‚ * ------------------------------------------------------------------
    ‚ * - RtvMsgD - Recuperar descripción de mensaje                     -
    ‚ * -                                                                -
    ‚ * - Retrieve Message (QMHRTVM)                                     -
    ‚ * ------------------------------------------------------------------

     D RtvMsgD         PR                  ExtPgm( 'QMHRTVM' )
     D   rcvVar                                  Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   lenRcvVar                         Const Like( TypeInt )
     D   format                            Const Like( TypeApiFormat )
     D   msgId                             Const Like( TypeMessageId )
     D   msgf                              Const Like( TypeQualName )
     D   msgDta                            Const Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   lenMsgDta                         Const Like( TypeInt )
     D   rplSubVal                         Const Like( TypeName )
     D   rtnFmtChr                         Const Like( TypeName )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )
    ‚D* Grupo opcional 1
     D   rtvOpt                            Const Like( TypeName )
     D                                           Options( *NOPASS )
     D   cvtCCSID                          Const Like( TypeInt )
     D                                           Options( *NOPASS )
     D   rplCCSID                          Const Like( TypeInt )
     D                                           Options( *NOPASS )
