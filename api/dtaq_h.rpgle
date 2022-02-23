      /If Defined( DTAQ_H )
      /Eof
      /Endif
      /Define DTAQ_H

    ‚ *
    ‚ *  NOMBRE.......: DTAQ_H
    ‚ *  DESCRIPCION..: Declaración de prototipos y tipos de las APIs
    ‚ *                 relacionadas con Colas de Datos (*DTAQ)
    ‚ *
    ‚ *  Programador..: Javier Mora
    ‚ *  Fecha........: 31.01.2007
    ‚ *
    ‚ *  Historia:
    ‚ *
    ‚ *   Fecha   Programador        Observaciones
    ‚ *  -------- ------------------ -------------
    ‚ *  18.09.09 Javier Mora        Revisión de estilo.
    ‚ *                              Pierde compatibilidad con v.2
    ‚ *
    ‚ *  Usar como:
    ‚ *
    ‚ *    /Copy API,DtaQ_H
    ‚ *
    ‚ *  Notas:
    ‚ *

    ‚ * ==================================================================
    ‚ * = OTROS FICHEROS DE CABECERA                                     =
    ‚ * ==================================================================

      /Copy Api,StdTyp_H

    ‚ * ==================================================================
    ‚ * = DEFINICIÓN DE TIPOS                                            =
    ‚ * ==================================================================

     D DQ_pack5_T      S              5P 0 Based( ApiTyp_ )
     D DQ_pack3_T      S              3P 0 Based( ApiTyp_ )
     D DQ_keyOrder_T   S              2A   Based( ApiTyp_ )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato con la información del remitente del mensaje           -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytesRet       Bytes devueltos                                 -
    ‚ * - bytesAvl       Bytes disponibles                               -
    ‚ * - jobName        Nombre del trabajo que envió el mensaje         -
    ‚ * - usrprf         Nombre del perfil de usuario del trabajo que    -
    ‚ * -                envió el mensaje                                -
    ‚ * - jobNbr         Número del trabajo que envió el mensaje         -
    ‚ * - sndCurUsrPrf   El usuario actual del trabajo que envió el      -
    ‚ * -                mensaje                                         -
    ‚ * ------------------------------------------------------------------

     D DQ_senderInf_T...
     D                 DS                  Based( StdTyp_ )
     D                                     Qualified
     D   bytesRet                     7P 0 Overlay( DQ_senderInf_T:  1 )
     D   bytesAvl                     7P 0 Overlay( DQ_senderInf_T:  5 )
     D   jobName                     10A   Overlay( DQ_senderInf_T:  9 )
     D   usrprf                      10A   Overlay( DQ_senderInf_T: 19 )
     D   jobNbr                       6A   Overlay( DQ_senderInf_T: 29 )
     D   sndCurUsrPrf                10A   Overlay( DQ_senderInf_T: 35 )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato RDQM0100 utilizado en el API Recuperar Mensaje de una  -
    ‚ * - cola de datos (QMHRDQM)                                        -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytesRtn       Bytes devueltos.                                -
    ‚ * - bytesAvl       Bytes disponibles.                              -
    ‚ * - nbrMsgRtn      Número de mensajes devueltos.                   -
    ‚ * - nbrMsgAvl      Número de mensajes disponibles.                 -
    ‚ * - msgKeyLenRtn   Longitud devuelta de la clave del mensaje.      -
    ‚ * - msgKeyLenAvl   Longitud disponible de la clave del mensaje.    -
    ‚ * - maxMsgTxtLenR  Longitud máxima solicitada para texto del       -
    ‚ * -                mensaje.                                        -
    ‚ * - maxMsgTxtLenA  Longitud máxima disponible para texto del       -
    ‚ * -                mensaje.                                        -
    ‚ * - entLenRtn      Longitud devuelta de la entrada.                -
    ‚ * - entLenAvl      Longitud disponible de la entrada.              -
    ‚ * - offFirstMsgE   Desplazamiento al primer mensaje recuperado.    -
    ‚ * - actDqLibName   Nombre real de la biblioteca de la cola.        -
    ‚ * - char(*)        Buffer con los datos de las entradas recuperadas-
    ‚ * ------------------------------------------------------------------

     D RDQM0100_T      DS                  Based( StdTyp_ )
     D                                     Qualified
     D   bytesRtn                    10I 0 Overlay( RDQM0100_T:  1 )
     D   bytesAvl                    10I 0 Overlay( RDQM0100_T:  5 )
     D   nbrMsgRtn                   10I 0 Overlay( RDQM0100_T:  9 )
     D   nbrMsgAvl                   10I 0 Overlay( RDQM0100_T: 13 )
     D   msgKeyLenRtn                10I 0 Overlay( RDQM0100_T: 17 )
     D   msgKeyLenAvl                10I 0 Overlay( RDQM0100_T: 21 )
     D   maxMsgTxtLenR...
     D                               10I 0 Overlay( RDQM0100_T: 25 )
     D   maxMsgTxtLenA...
     D                               10I 0 Overlay( RDQM0100_T: 29 )
     D   entLenRtn                   10I 0 Overlay( RDQM0100_T: 33 )
     D   entLenAvl                   10I 0 Overlay( RDQM0100_T: 37 )
     D   offFirstMsgE                10I 0 Overlay( RDQM0100_T: 41 )
     D   actDqLibName                10A   Overlay( RDQM0100_T: 45 )
    ‚D* Char(*)                            Overlay( RDQM0100_T: 55 )

     D RDQM0100_msgEnt_T...
     D                 DS                  Based( StdTyp_ )
     D                                     Qualified
     D   offnextMsgE                 10I 0
     D   dateTime                     8A
     D   buffer                    4096A

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato RDQM0200 utilizado en el API Recuperar Mensaje de una  -
    ‚ * - cola de datos (QMHRDQM)                                        -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytesRtn       Bytes devueltos.                                -
    ‚ * - bytesAvl       Bytes disponibles.                              -
    ‚ * - nbrMsgRtn      Número de mensajes devueltos.                   -
    ‚ * - nbrMsgAvl      Número de mensajes disponibles.                 -
    ‚ * - msgKeyLenRtn   Longitud devuelta de la clave del mensaje.      -
    ‚ * - msgKeyLenAvl   Longitud disponible de la clave del mensaje.    -
    ‚ * - maxMsgTxtLenR  Longitud máxima solicitada para texto del       -
    ‚ * -                mensaje.                                        -
    ‚ * - maxMsgTxtLenA  Longitud máxima disponible para texto del       -
    ‚ * -                mensaje.                                        -
    ‚ * - reserved       Reservado.                                      -
    ‚ * - offFirstMsgE   Desplazamiento al primer mensaje recuperado.    -
    ‚ * - actDqLibName   Nombre real de la biblioteca de la cola.        -
    ‚ * - Char(*)        Buffer con los datos de las entradas recuperadas-
    ‚ * ------------------------------------------------------------------

     D RDQM0200_T      DS                  Based( StdTyp_ )
     D                                     Qualified
     D   bytesRtn                    10I 0 Overlay( RDQM0200_T:  1 )
     D   bytesAvl                    10I 0 Overlay( RDQM0200_T:  5 )
     D   nbrMsgRtn                   10I 0 Overlay( RDQM0200_T:  9 )
     D   nbrMsgAvl                   10I 0 Overlay( RDQM0200_T: 13 )
     D   msgKeyLenRtn                10I 0 Overlay( RDQM0200_T: 17 )
     D   msgKeyLenAvl                10I 0 Overlay( RDQM0200_T: 21 )
     D   maxMsgTxtLenR...
     D                               10I 0 Overlay( RDQM0200_T: 25 )
     D   maxMsgTxtLenA...
     D                               10I 0 Overlay( RDQM0200_T: 29 )
     D   reserved                     8A   Overlay( RDQM0200_T: 33 )
     D   offFirstMsgE                10I 0 Overlay( RDQM0200_T: 41 )
     D   actDqLibName                10A   Overlay( RDQM0200_T: 45 )
    ‚D* Char(*)                            Overlay( RDQM0200_T: 55 )

     D RDQM0200_msgEnt_T...
     D                 DS                  Based( StdTyp_ )
     D                                     Qualified
     D   offnextMsgE                 10I 0
     D   dateTime                     8A
     D   msgEntLen                   10I 0
     D   buffer                    4096A


    ‚ * ------------------------------------------------------------------
    ‚ * - Formato RDQS0100 para el parámetro de información de selección -
    ‚ * - de mensajes sin clave (API QMHRDQM).                           -
    ‚ * ------------------------------------------------------------------
    ‚ * - selTyp         Tipo de selección.                              -
    ‚ * - reserved       Reservado.                                      -
    ‚ * - bytesRtv       Número de bytes a recuperar para el mensaje.    -
    ‚ * ------------------------------------------------------------------

     D RDQS0100_T      DS                  Based( StdTyp_ )
     D                                     Qualified
     D   selTyp                       1A   Overlay( RDQS0100_T:  1 )
     D   reserved                     3A   Overlay( RDQS0100_T:  2 )
     D   bytesRtv                    10I 0 Overlay( RDQS0100_T:  5 )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato RDQS0200 para el parámetro de información de selección -
    ‚ * - de mensajes con clave (API QMHRDQM).                           -
    ‚ * ------------------------------------------------------------------
    ‚ * - selTyp         Tipo de selección.                              -
    ‚ * - order          Orden de búsqueda de la clave.                  -
    ‚ * - reserved       Reservado.                                      -
    ‚ * - msgBytRtv      Bytes a recuperar del mensaje.                  -
    ‚ * - keyBytRtv      Bytes a recuperar de la clave.                  -
    ‚ * - keyLen         Longitud de la clave.                           -
    ‚ * - key            La clave.                                       -
    ‚ * ------------------------------------------------------------------

     D RDQS0200_T      DS                  Based( StdTyp_ )
     D                                     Qualified
     D   selTyp                       1A   Overlay( RDQS0200_T:  1 )
     D   order                        2A   Overlay( RDQS0200_T:  2 )
     D   reserved                     1A   Overlay( RDQS0200_T:  4 )
     D   msgBytRtv                   10I 0 Overlay( RDQS0200_T:  5 )
     D   keyBytRtv                   10I 0 Overlay( RDQS0200_T:  9 )
     D   keyLen                      10I 0 Overlay( RDQS0200_T: 13 )
     D   key                       1024A   Overlay( RDQS0200_T: 17 )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato RDQD0100 para recuperar información de la descripción  -
    ‚ * - de una cola de datos. Utilizado por el API QMHQRDQD Recuperar  -
    ‚ * - Descripción de la Cola de Datos.                               -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytesRtn       Bytes devueltos.                                -
    ‚ * - bytesAvl       Bytes disponibles.                              -
    ‚ * - msgLen         Longitud del mensaje.                           -
    ‚ * - keyLen         Longitud de la clave.                           -
    ‚ * - sequence       Secuencia.                                      -
    ‚ * - incSender      Incluye el id del remitente.                    -
    ‚ * - force          Indicador de forzar almacenamiento.             -
    ‚ * - text           Texto descriptivo.                              -
    ‚ * - type           Tipo de cola de datos.                          -
    ‚ * - autRcl         Reclamar automáticamente.                       -
    ‚ * - reserved       Reservado.                                      -
    ‚ * - nbrMsg         Número de mensajes.                             -
    ‚ * - nbrEntAlc      Número de entradas actualmente alojados.        -
    ‚ * - name           Nombre de la cola de datos.                     -
    ‚ * - lib            Biblioteca de la cola de datos.                 -
    ‚ * - maxNbrEntAlw   Máximo número de entradas permitidas.           -
    ‚ * - iniNbrEnt      Número inicial de entradas.                     -
    ‚ * - maxNbrEnt      Número máximo de entradas especificadas.        -
    ‚ * ------------------------------------------------------------------

     D RDQD0100_T      DS                  Based( StdTyp_ )
     D                                     Qualified
     D   bytesRtn                    10I 0 Overlay( RDQD0100_T:  1 )
     D   bytesAvl                    10I 0 Overlay( RDQD0100_T:  5 )
     D   msgLen                      10I 0 Overlay( RDQD0100_T:  9 )
     D   keyLen                      10I 0 Overlay( RDQD0100_T: 13 )
     D   sequence                     1A   Overlay( RDQD0100_T: 17 )
     D   incSender                    1A   Overlay( RDQD0100_T: 18 )
     D   force                        1A   Overlay( RDQD0100_T: 19 )
     D   text                        50    Overlay( RDQD0100_T: 20 )
     D   type                         1A   Overlay( RDQD0100_T: 70 )
     D   autRcl                       1A   Overlay( RDQD0100_T: 71 )
     D   reserved                     1A   Overlay( RDQD0100_T: 72 )
     D   nbrMsg                      10I 0 Overlay( RDQD0100_T: 73 )
     D   nbrEntalc                   10I 0 Overlay( RDQD0100_T: 77 )
     D   name                        10A   Overlay( RDQD0100_T: 81 )
     D   lib                         10A   Overlay( RDQD0100_T: 91 )
     D   maxNbrEntAlw                10I 0 Overlay( RDQD0100_T: 101 )
     D   iniNbrEnt                   10I 0 Overlay( RDQD0100_T: 105 )
     D   maxNbrEnt                   10I 0 Overlay( RDQD0100_T: 109 )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato RDQD0200 para recuperar información de la descripción  -
    ‚ * - de una cola de datos. Utilizado por el API QMHQRDQD Recuperar  -
    ‚ * - Descripción de la Cola de Datos.                               -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytesRtn       Bytes devueltos.                                -
    ‚ * - bytesAvl       Bytes disponibles.                              -
    ‚ * - appcDevDesc    Descripción de dispositivo APPC.                -
    ‚ * - mode           Modo.                                           -
    ‚ * - rmtLocNam      Nombre ubicación remota.                        -
    ‚ * - lclLocNam      Nombre ubicación local.                         -
    ‚ * - rmtNetId       Identificador de red remoto.                    -
    ‚ * - rmtDqNam       Nombre de la cola de datos remota.              -
    ‚ * - rmtDqLib       Biblioteca de la cola de datos remota.          -
    ‚ * - name           Nombre de la cola de datos.                     -
    ‚ * - lib            Biblioteca de la cola de datos.                 -
    ‚ * - dbname         Nombre de la base de datos relacional.          -
    ‚ * ------------------------------------------------------------------

     D RDQD0200_T      DS                  Based( StdTyp_ )
     D                                     Qualified
     D   bytesRtn                    10I 0 Overlay( RDQD0200_T:  1 )
     D   bytesAvl                    10I 0 Overlay( RDQD0200_T:  5 )
     D   appcDevDesc                 10A   Overlay( RDQD0200_T:  9 )
     D   mode                         8A   Overlay( RDQD0200_T: 19 )
     D   rmtLocNam                    8A   Overlay( RDQD0200_T: 27 )
     D   lclLocNam                    8A   Overlay( RDQD0200_T: 35 )
     D   rmtNetId                     8A   Overlay( RDQD0200_T: 43 )
     D   rmtDqNam                    10A   Overlay( RDQD0200_T: 51 )
     D   rmtDqLib                    10A   Overlay( RDQD0200_T: 61 )
     D   name                        10A   Overlay( RDQD0200_T: 71 )
     D   lib                         10A   Overlay( RDQD0200_T: 81 )
     D   dbname                      18A   Overlay( RDQD0200_T: 91 )

    ‚ * ==================================================================
    ‚ * = DECLARACIÓN DE FUNCIONES Y PROCEDIMIENTOS PUBLICOS             =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - SndDtaQ - Enviar una entrada a una cola de datos               -
    ‚ * -                                                                -
    ‚ * - Send Data Queue (QSNDDTAQ)                                     -
    ‚ * ------------------------------------------------------------------

     D SndDtaQ         PR                  ExtPgm( 'QSNDDTAQ' )
     D   name                              Const Like( TypeName )
     D   libName                           Const Like( TypeName )
     D   dataLen                           Const Like( DQ_pack5_T )
     D   data                              Const Like( TypeBuffer )
     D                                           Options( *VARSIZE )
    ‚D* Grupo opcional 1 - (Con clave):
     D   keyLen                            Const Like( DQ_pack3_T )
     D                                           Options( *NOPASS )
     D   keyData                           Const Like( TypeBuffer )
     D                                           Options( *VARSIZE
     D                                                  : *NOPASS )
    ‚D* Grupo opcional 2:
     D   asyncRqs                          Const Like( TypeName )
     D                                           Options( *NOPASS )
    ‚D* Grupo opcional 3:
     D   dtaFrmJrnEnt                      Const Like( TypeName )
     D                                           Options( *NOPASS )

    ‚ * ------------------------------------------------------------------
    ‚ * - RcvDtaQ - Recibir una entrada desde una cola de datos          -
    ‚ * -                                                                -
    ‚ * - Receive Data Queue (QRCVDTAQ)                                  -
    ‚ * ------------------------------------------------------------------

     D RcvDtaQ         PR                  ExtPgm( 'QRCVDTAQ' )
     D   name                              Const Like( TypeName )
     D   libName                           Const Like( TypeName )
     D   dataLen                                 Like( DQ_pack5_T )
     D   data                                    Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   waitTime                          Const Like( DQ_pack5_T )
    ‚D* Grupo opcional 1 - (Con clave):
     D   keyOrder                          Const Like( DQ_keyorder_T )
     D                                           Options( *NOPASS )
     D   keyLen                            Const Like( DQ_pack3_T )
     D                                           Options( *NOPASS )
     D   keyData                                 Like( TypeBuffer )
     D                                           Options( *VARSIZE
     D                                                  : *NOPASS )
     D   sndrInfLen                        Const Like( DQ_pack3_T )
     D                                           Options( *NOPASS )
     D   sndrInfo                                LikeDs( DQ_senderInf_T )
     D                                           Options( *VARSIZE
     D                                                  : *NOPASS )
    ‚D* Grupo opcional 2:
     D   removeMsg                         Const Like( TypeName )
     D                                           Options( *NOPASS )
     D   rcvSize                           Const Like( DQ_pack5_T )
     D                                           Options( *NOPASS )
     D   error                                   LikeDs( TypeApiError )
     D                                           Options( *VARSIZE
     D                                                  : *NOPASS )

    ‚ * ------------------------------------------------------------------
    ‚ * - RtvDtaQ - Recuperar uno o más mensajes de una colad de datos   -
    ‚ * -           sin quitar las entradas de la cola                   -
    ‚ * -                                                                -
    ‚ * - Retrieve Data Queue Message (QMHRDQM)                          -
    ‚ * ------------------------------------------------------------------

     D RtvDtaQMsg      PR                  ExtPgm( 'QMHRDQM' )
     D   rcvVar                                  Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   rcvVarLen                         Const Like( TypeInt )
     D   format                            Const Like( TypeApiFormat )
     D   qualName                          Const Like( TypeQualName )
     D   msgSelInf                         Const Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   msgSelLen                         Const Like( TypeInt )
     D   msgSelFmt                         Const Like( TypeApiFormat )
     D   error                                   LikeDs( TypeApiError )
     D                                           Options( *VARSIZE )

    ‚ * ------------------------------------------------------------------
    ‚ * - ClrDtaQ - Borrar una cola de datos                             -
    ‚ * -                                                                -
    ‚ * - Clear Data Queue (QCLRDTAQ)                                    -
    ‚ * ------------------------------------------------------------------

     D ClrDtaQ         PR                  ExtPgm( 'QCLRDTAQ' )
     D   name                              Const Like( TypeName )
     D   libName                           Const Like( TypeName )
    ‚D* Grupo opcional:
     D   keyOrder                          Const Like( DQ_keyOrder_T )
     D                                           Options( *NOPASS )
     D   keyLen                            Const Like( DQ_pack3_T )
     D                                           Options( *NOPASS )
     D   keyData                                 Like( TypeBuffer )
     D                                           Options( *VARSIZE
     D                                                  : *NOPASS )
     D   error                                   LikeDs( TypeApiError )
     D                                           Options( *VARSIZE
     D                                                  : *NOPASS )

    ‚ * ------------------------------------------------------------------
    ‚ * - RtvDtaQDesc - Recuperar descripción de la cola de datos        -
    ‚ * -                                                                -
    ‚ * - Retrieve Data Queue Description (QMHQRDQD)                     -
    ‚ * ------------------------------------------------------------------

     D RtvDtaQDesc     PR                  ExtPgm( 'QMHQRDQD' )
     D   rcvVar                                  Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   rcvVarLen                         Const Like( TypeInt )
     D   format                            Const Like( TypeApiFormat )
     D   qualName                          Const Like( TypeQualName )
