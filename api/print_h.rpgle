      /If Defined( PRINT_H )
      /Eof
      /Endif
      /Define PRINT_H

    ‚ *
    ‚ *  NOMBRE.......: PRINT_H
    ‚ *  DESCRIPCION..: Declaración de los tipos y prototipos para las
    ‚ *                 APIs generales de impresión.
    ‚ *
    ‚ *    Con estas APIs podrá recuperar información y realizar actividades
    ‚ *    de impresión.
    ‚ *
    ‚ *  Programador..: Javier Mora
    ‚ *  Fecha........: 19.08.2008
    ‚ *
    ‚ *  Historia:
    ‚ *
    ‚ *   Fecha   Programador        Observaciones
    ‚ *  -------- ------------------ -------------
    ‚ *  21.09.09 Javier Mora        Incluir prototipo API QPQRAFPI.
    ‚ *
    ‚ *  Usar como:
    ‚ *
    ‚ *    /Copy API,Print_H
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
    ‚ * - Formato OUTQ0100 con información sobre la cola de salida y     -
    ‚ * - sólo uno de los transcriptores que estén iniciados.            -
    ‚ * -                                                                -
    ‚ * - API Retrieve Output Queue Information (QSPROUTQ)               -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytesRtn       Bytes devueltos.                                -
    ‚ * - bytesAvl       Bytes disponibles.                              -
    ‚ * - outqNam        Nombre de la cola de salida.                    -
    ‚ * - outqLib        Nombre de la biblioteca de la cola de salida.   -
    ‚ * - seq            Orden de los archivos en la cola.               -
    ‚ * - dspDta         Visualizar cualquier archivo.                   -
    ‚ * - jobSep         Separadores de trabajos.                        -
    ‚ * - oprCtl         Controlado por operador.                        -
    ‚ * - dtaqNam        Nombre de la cola de datos.                     -
    ‚ * - dtaqLib        Nombre de la biblioteca de la cola de datos.    -
    ‚ * - autChk         Autorización a comprobar.                       -
    ‚ * - nbrFiles       Número de archivos.                             -
    ‚ * - status         Estado de la cola de salida.                    -
    ‚ * - wtrJobNam      Nombre del trabajo transcriptor.                -
    ‚ * - wtrJobUsr      Usuario del trabajo transcriptor.               -
    ‚ * - wtrJobNbr      Número del trabajo transcriptor.                -
    ‚ * - wtrJobSts      Estado del trabajo transcriptor.                -
    ‚ * - prtDevNam      Nombre del dispositivo de impresora.            -
    ‚ * - text           Texto descriptivo.                              -
    ‚ * - nbrSplfPags    Para una archivo en spool, el número máximo de  -
    ‚ * -                páginas permitido.                              -
    ‚ * - nbrWtrStr      Número de transcriptores iniciados para la cola.-
    ‚ * - wtrAutStr      Transcriptores durante arranque automático.     -
    ‚ * - rmtSysNamTyp   Tipo del sistema remoto.                        -
    ‚ * - rmtSysNam      Nombre del sistema remoto.                      -
    ‚ * - rmtPrtq        Cola de impresora remota.                       -
    ‚ * - msgqNam        Cola para los mensajes del transcriptor.        -
    ‚ * - msgqLib        Biblioteca de la cola para los mensajes del     -
    ‚ * -                transcriptor.                                   -
    ‚ * - cnnTyp         Tipo de conexión.                               -
    ‚ * - destTyp        Tipo de destino.                                -
    ‚ * - WMMVSclass     Clase VM/MVS.                                   -
    ‚ * - formsCtlBuf    Buffer de control de formularios para archivos  -
    ‚ * -                enviados a sistemas VM/MVS.                     -
    ‚ * - transform      Transformación de impresión en sistema          -
    ‚ * -                principal (HPT).                                -
    ‚ * - mfrTypMdl      Fabricante, tipo y modelo.                      -
    ‚ * - wsCstNam       Nombre del objeto de personalización de         -
    ‚ * -                estación de trabajo.                            -
    ‚ * - wsCstLib       Biblioteca del objeto de personalización de     -
    ‚ * -                estación de trabajo.                            -
    ‚ * - splfASP        ASP del archivo en spool.                       -
    ‚ * - offsMaxSplfPagE                                                -
    ‚ * -                Desplazamiento a la lista e entradas de página. -
    ‚ * - nbrPagEnt      Número de entradas de página de la lista.       -
    ‚ * - lenSizEnt      Longitud, en bytes, de cada entrada de tamaño   -
    ‚ * -                de archivo en spool.                            -
    ‚ * - destOpt        Opciones de destino.                            -
    ‚ * - wtrTyp         Tipo de transcriptor iniciado en la cola.       -
    ‚ * - sepPage        Imprimir página separadora.                     -
    ‚ * - longRmtPrtQ    Nombre de la cola de impresión remota.          -
    ‚ * - imgCfg         Configuración de imagen.                        -
    ‚ * - imgCfgLib      Biblioteca del objeto de configuración de       -
    ‚ * -                imagen.                                         -
    ‚ * - netDirPubSts   Estado de publicación en el directorio de red.  -
    ‚ * - splfASPid      Identificador del ASP del archivo en spool.     -
    ‚ * - splfASPdev     Dispositivo del ASP del archivo en spool.       -
    ‚ * - buffer         Espacio adicional necesario para almacenar las  -
    ‚ * -                entradas de la lista (no se especifica en la    -
    ‚ * -                estructura de datos).                           -
    ‚ * ------------------------------------------------------------------

     D OUTQ0100_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   bytesRtn                    10I 0 Overlay( OUTQ0100_T:   1 )
     D   bytesAvl                    10I 0 Overlay( OUTQ0100_T:   5 )
     D   outqNam                     10A   Overlay( OUTQ0100_T:   9 )
     D   outqLib                     10A   Overlay( OUTQ0100_T:  19 )
     D   seq                         10A   Overlay( OUTQ0100_T:  29 )
     D   dspDta                      10A   Overlay( OUTQ0100_T:  39 )
     D   jobSep                      10I 0 Overlay( OUTQ0100_T:  49 )
     D   oprCtl                      10A   Overlay( OUTQ0100_T:  53 )
     D   dtaqNam                     10A   Overlay( OUTQ0100_T:  63 )
     D   dtaqLib                     10A   Overlay( OUTQ0100_T:  73 )
     D   autChk                      10A   Overlay( OUTQ0100_T:  83 )
     D   nbrFiles                    10I 0 Overlay( OUTQ0100_T:  93 )
     D   status                      10A   Overlay( OUTQ0100_T:  97 )
     D   wtrJobNam                   10A   Overlay( OUTQ0100_T: 107 )
     D   wtrJobUsr                   10A   Overlay( OUTQ0100_T: 117 )
     D   wrtJobNbr                    6A   Overlay( OUTQ0100_T: 127 )
     D   wtrJobSts                   10A   Overlay( OUTQ0100_T: 133 )
     D   prtDevNam                   10A   Overlay( OUTQ0100_T: 143 )
     D   text                        50A   Overlay( OUTQ0100_T: 153 )
     D                                2A   Overlay( OUTQ0100_T: 203 )
     D   nbrSplfPags                 10I 0 Overlay( OUTQ0100_T: 205 )
     D   nbrWtrStr                   10I 0 Overlay( OUTQ0100_T: 209 )
     D   wtrAutStr                   10I 0 Overlay( OUTQ0100_T: 213 )
     D   rmtSysNamTyp                 1A   Overlay( OUTQ0100_T: 217 )
     D   rmtSysNam                  255A   Overlay( OUTQ0100_T: 218 )
     D   rmtPrtq                    128A   Overlay( OUTQ0100_T: 473 )
     D   msgqNam                     10A   Overlay( OUTQ0100_T: 601 )
     D   msgqLib                     10A   Overlay( OUTQ0100_T: 611 )
     D   cnnTyp                      10I 0 Overlay( OUTQ0100_T: 621 )
     D   destTyp                     10I 0 Overlay( OUTQ0100_T: 625 )
     D   VMMVSclass                   1A   Overlay( OUTQ0100_T: 629 )
     D   formsCtlBuf                  8A   Overlay( OUTQ0100_T: 630 )
     D   transform                    1A   Overlay( OUTQ0100_T: 638 )
     D   mfrTypMdl                   17A   Overlay( OUTQ0100_T: 639 )
     D   wsCstNam                    10A   Overlay( OUTQ0100_T: 656 )
     D   wsCstLib                    10A   Overlay( OUTQ0100_T: 666 )
     D   splfASP                      1A   Overlay( OUTQ0100_T: 676 )
     D   offsMaxSplfPagE...
     D                               10I 0 Overlay( OUTQ0100_T: 677 )
     D   nbrPagEnt                   10I 0 Overlay( OUTQ0100_T: 681 )
     D   lenSizEnt                   10I 0 Overlay( OUTQ0100_T: 685 )
     D   destOpt                    128A   Overlay( OUTQ0100_T: 689 )
     D   wtrTyp                       1A   Overlay( OUTQ0100_T: 817 )
     D   sepPage                      1A   Overlay( OUTQ0100_T: 818 )
     D   longRmtPrtQ                255A   Overlay( OUTQ0100_T: 819 )
     D   imgCfg                      10A   Overlay( OUTQ0100_T: 1074 )
     D   imgCfgLib                   10A   Overlay( OUTQ0100_T: 1084 )
     D   netDirPubSts                 1A   Overlay( OUTQ0100_T: 1094 )
     D                                2A   Overlay( OUTQ0100_T: 1095 )
     D   splfASPid                   10I 0 Overlay( OUTQ0100_T: 1097 )
     D   splfASPdev                  10A   Overlay( OUTQ0100_T: 1101 )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato OUTQ0200 con información sobre la cola de salida y     -
    ‚ * - todos los transcriptores que estén iniciados.                  -
    ‚ * -                                                                -
    ‚ * - API Retrieve Output Queue Information (QSPROUTQ)               -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytesRtn       Bytes devueltos.                                -
    ‚ * - bytesAvl       Bytes disponibles.                              -
    ‚ * - outqNam        Nombre de la cola de salida.                    -
    ‚ * - outqLib        Nombre de la biblioteca de la cola de salida.   -
    ‚ * - seq            Orden de los archivos en la cola.               -
    ‚ * - dspDta         Visualizar cualquier archivo.                   -
    ‚ * - jobSep         Separadores de trabajos.                        -
    ‚ * - oprCtl         Controlado por operador.                        -
    ‚ * - dtaqNam        Nombre de la cola de datos.                     -
    ‚ * - dtaqLib        Nombre de la biblioteca de la cola de datos.    -
    ‚ * - autChk         Autorización a comprobar.                       -
    ‚ * - nbrFiles       Número de archivos.                             -
    ‚ * - status         Estado de la cola de salida.                    -
    ‚ * - text           Texto descriptivo.                              -
    ‚ * - nbrSplfPags    Para una archivo en spool, el número máximo de  -
    ‚ * -                páginas permitido.                              -
    ‚ * - nbrWtrStr      Número de transcriptores iniciados para la cola.-
    ‚ * - wtrAutStr      Transcriptores durante arranque automático.     -
    ‚ * - rmtSysNamTyp   Tipo del sistema remoto.                        -
    ‚ * - rmtSysNam      Nombre del sistema remoto.                      -
    ‚ * - rmtPrtq        Cola de impresora remota.                       -
    ‚ * - msgqNam        Cola para los mensajes del transcriptor.        -
    ‚ * - msgqLib        Biblioteca de la cola para los mensajes del     -
    ‚ * -                transcriptor.                                   -
    ‚ * - cnnTyp         Tipo de conexión.                               -
    ‚ * - destTyp        Tipo de destino.                                -
    ‚ * - WMMVSclass     Clase VM/MVS.                                   -
    ‚ * - formsCtlBuf    Buffer de control de formularios para archivos  -
    ‚ * -                enviados a sistemas VM/MVS.                     -
    ‚ * - transform      Transformación de impresión en sistema          -
    ‚ * -                principal (HPT).                                -
    ‚ * - mfrTypMdl      Fabricante, tipo y modelo.                      -
    ‚ * - wsCstNam       Nombre del objeto de personalización de         -
    ‚ * -                estación de trabajo.                            -
    ‚ * - wsCstLib       Biblioteca del objeto de personalización de     -
    ‚ * -                estación de trabajo.                            -
    ‚ * - splfASP        ASP del archivo en spool.                       -
    ‚ * - offsMaxSplfPagE                                                -
    ‚ * -                Desplazamiento a la lista e entradas de página. -
    ‚ * - nbrPagEnt      Número de entradas de página de la lista.       -
    ‚ * - lenSizEnt      Longitud, en bytes, de cada entrada de tamaño   -
    ‚ * -                de archivo en spool.                            -
    ‚ * - offsWtrEnt     Desplazamiento al espacio de memoria ocupado    -
    ‚ * -                por la lista de transcriptores activos.         -
    ‚ * - nbrWtrEnt      Número de entradas en la lista de transcriptores-
    ‚ * - lenWtrEnt      Longitud de cada entrada de la lista de         -
    ‚ * -                transcriptores.                                 -
    ‚ * - destOpt        Opciones de destino.                            -
    ‚ * - wtrTyp         Tipo de transcriptor iniciado en la cola.       -
    ‚ * - sepPage        Imprimir página separadora.                     -
    ‚ * - longRmtPrtQ    Nombre de la cola de impresión remota.          -
    ‚ * - offsUsrDfnOpt  Desplazamiento al espacio de memoria ocupado    -
    ‚ * -                por la lista de opcines definidas por el usuario-
    ‚ * - nbrUsrDfnOpt   Número de entradas en la lista de opciones      -
    ‚ * -                definidas por el usuario.                       -
    ‚ * - lenUsrDfnOpt   Longitud de cada entrada de la lista de opciones-
    ‚ * -                definidas por el usuario.                       -
    ‚ * - offsUsrDfnDta  Desplazamiento al espacio de memoria ocupado    -
    ‚ * -                por la lista de datos definidos por el usuario. -
    ‚ * - bytUsrDfnDtaR  Bytes devueltos para los datos definidos por el -
    ‚ * -                usuario.                                        -
    ‚ * - bytUsrDfnDtaA  Bytes disponibles para los datos definidos por  -
    ‚ * -                el usuario.                                     -
    ‚ * - usrDfnObj      Nombre del objeto definido por el usuario.      -
    ‚ * - usrDfnObjLib   Biblioteca del objeto definido por el usuario.  -
    ‚ * - usrDfnObjTyp   Tipo del objeto definido por el usuario.        -
    ‚ * - usrDrvPgm      Programa controlador.                           -
    ‚ * - usrDrvPgmLib   Biblioteca del programa controlador.            -
    ‚ * - usrDtaTfm      Programa de usuaro para la transformación de    -
    ‚ * -                datos.                                          -
    ‚ * - usrDtaTfmLib   Biblioteca del programa de usuario para la      -
    ‚ * -                transformación de datos.                        -
    ‚ * - imgCfg         Configuración de imagen.                        -
    ‚ * - imgCfgLib      Biblioteca del objeto de configuración de       -
    ‚ * -                imagen.                                         -
    ‚ * - netDirPubSts   Estado de publicación en el directorio de red.  -
    ‚ * - splfASPid      Identificador del ASP del archivo en spool.     -
    ‚ * - splfASPdev     Dispositivo del ASP del archivo en spool.       -
    ‚ * - buffer         Espacio adicional necesario para almacenar las  -
    ‚ * -                entradas de las distintas listas de este        -
    ‚ * -                formato. Este campo no se declara en la         -
    ‚ * -                estructura de datos.                            -
    ‚ * ------------------------------------------------------------------

     D OUTQ0200_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   bytesRtn                    10I 0 Overlay( OUTQ0200_T:   1 )
     D   bytesAvl                    10I 0 Overlay( OUTQ0200_T:   5 )
     D   outqNam                     10A   Overlay( OUTQ0200_T:   9 )
     D   outqLib                     10A   Overlay( OUTQ0200_T:  19 )
     D   seq                         10A   Overlay( OUTQ0200_T:  29 )
     D   dspDta                      10A   Overlay( OUTQ0200_T:  39 )
     D   jobSep                      10I 0 Overlay( OUTQ0200_T:  49 )
     D   oprCtl                      10A   Overlay( OUTQ0200_T:  53 )
     D   dtaqNam                     10A   Overlay( OUTQ0200_T:  63 )
     D   dtaqLib                     10A   Overlay( OUTQ0200_T:  73 )
     D   autChk                      10A   Overlay( OUTQ0200_T:  83 )
     D   nbrFiles                    10I 0 Overlay( OUTQ0200_T:  93 )
     D   status                      10A   Overlay( OUTQ0200_T:  97 )
     D   text                        50A   Overlay( OUTQ0200_T: 107 )
     D   nbrSplfPags                 10I 0 Overlay( OUTQ0200_T: 157 )
     D   nbrWtrStr                   10I 0 Overlay( OUTQ0200_T: 161 )
     D   wtrAutStr                   10I 0 Overlay( OUTQ0200_T: 165 )
     D   rmtSysNamTyp                 1A   Overlay( OUTQ0200_T: 169 )
     D   rmtSysNam                  255A   Overlay( OUTQ0200_T: 170 )
     D   rmtPrtq                    128A   Overlay( OUTQ0200_T: 425 )
     D   msgqNam                     10A   Overlay( OUTQ0200_T: 553 )
     D   msgqLib                     10A   Overlay( OUTQ0200_T: 563 )
     D   cnnTyp                      10I 0 Overlay( OUTQ0200_T: 573 )
     D   destTyp                     10I 0 Overlay( OUTQ0200_T: 577 )
     D   VMMVSclass                   1A   Overlay( OUTQ0200_T: 581 )
     D   formsCtlBuf                  8A   Overlay( OUTQ0200_T: 582 )
     D   transform                    1A   Overlay( OUTQ0200_T: 590 )
     D   mfrTypMdl                   17A   Overlay( OUTQ0200_T: 591 )
     D   wsCstNam                    10A   Overlay( OUTQ0200_T: 608 )
     D   wsCstLib                    10A   Overlay( OUTQ0200_T: 618 )
     D   splfASP                      1A   Overlay( OUTQ0200_T: 628 )
     D   offsMaxSplfPagE...
     D                               10I 0 Overlay( OUTQ0200_T: 629 )
     D   nbrPagEnt                   10I 0 Overlay( OUTQ0200_T: 633 )
     D   lenSizEnt                   10I 0 Overlay( OUTQ0200_T: 637 )
     D   offsWtrEnt                  10I 0 Overlay( OUTQ0200_T: 641 )
     D   nbrWtrEnt                   10I 0 Overlay( OUTQ0200_T: 645 )
     D   lenWtrEnt                   10I 0 Overlay( OUTQ0200_T: 649 )
     D   destOpt                    128A   Overlay( OUTQ0200_T: 653 )
     D   wtrTup                       1A   Overlay( OUTQ0200_T: 781 )
     D   sepPage                      1A   Overlay( OUTQ0200_T: 782 )
     D   longRmtPrtQ                255A   Overlay( OUTQ0200_T: 783 )
     D                                3A   Overlay( OUTQ0200_T: 1038 )
     D   offsUsrDfnOpt...
     D                               10I 0 Overlay( OUTQ0200_T: 1041 )
     D   nbrUsrDfnOpt                10I 0 Overlay( OUTQ0200_T: 1045 )
     D   lenUsrDfnOpt                10I 0 Overlay( OUTQ0200_T: 1049 )
     D   offsUsrDfnDta...
     D                               10I 0 Overlay( OUTQ0200_T: 1053 )
     D   bytUsrDfnDtaR...
     D                               10I 0 Overlay( OUTQ0200_T: 1045 )
     D   bytUsrDfnDtaA...
     D                               10I 0 Overlay( OUTQ0200_T: 1061 )
     D   usrDfnObj                   10A   Overlay( OUTQ0200_T: 1065 )
     D   usrDfnObjLib                10A   Overlay( OUTQ0200_T: 1075 )
     D   usrDfnObjTyp                10A   Overlay( OUTQ0200_T: 1085 )
     D   usrDrvPgm                   10A   Overlay( OUTQ0200_T: 1095 )
     D   usrDrvPgmLib                10A   Overlay( OUTQ0200_T: 1105 )
     D   usrDtaTfm                   10A   Overlay( OUTQ0200_T: 1115 )
     D   usrDtaTfmLib                10A   Overlay( OUTQ0200_T: 1125 )
     D   imgCfg                      10A   Overlay( OUTQ0200_T: 1135 )
     D   imgCfgLib                   10A   Overlay( OUTQ0200_T: 1145 )
     D   netDirPubSts                 1A   Overlay( OUTQ0200_T: 1155 )
     D                                1A   Overlay( OUTQ0200_T: 1156 )
     D   splfASPid                   10I 0 Overlay( OUTQ0200_T: 1157 )
     D   splfASPdev                  10A   Overlay( OUTQ0200_T: 1161 )

     D OUTQ0200_wtrEnt_T...
     D                 DS                  Based( apityp_ )
     D                                     Qualified
     D   wtrJobNam                   10A
     D   wtrJobUsr                   10A
     D   wrtJobNbr                    6A
     D   wtrJobSts                   10A
     D   prtDevNam                   10A

     D OUTQ0200_usrDfnOptEnt_T...
     D                 DS                  Based( apityp_ )
     D                                     Qualified
     D   usrDfnOpt                   10A

    ‚ * ==================================================================
    ‚ * = DECLARACIÓN DE FUNCIONES Y PROCEDIMIENTOS PUBLICOS             =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - RtvOutqInf - Recuperar información de cola de salida           -
    ‚ * -                                                                -
    ‚ * - Retrieve Output Queue Information (QSPROUTQ)                   -
    ‚ * ------------------------------------------------------------------

     D RtvOutqInf      PR                  ExtPgm( 'QSPROUTQ' )
     D   rcvVar                                  Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   rcvVarLen                         Const Like( TypeInt )
     D   format                            Const Like( TypeApiFormat )
     D   outqNam                           Const Like( TypeQualName )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )

    ‚ * ------------------------------------------------------------------
    ‚ * - RtvAfpInf - Recuperar información AFP                          -
    ‚ * -                                                                -
    ‚ * - Retrieve AFP Information (QPQRAFPI)                            -
    ‚ * ------------------------------------------------------------------

     D RtvAfpInf       PR                  ExtPgm( 'QPQRAFPI' )
     D   rcvVar                                  Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   rcvVarLen                         Const Like( TypeInt )
     D   format                            Const Like( TypeApiFormat )
     D   afpQobj                           Const Like( TypeQualName )
     D   afpType                           Const Like( TypeName )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )
