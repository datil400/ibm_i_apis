      /If Defined( SYSTEM_H )
      /Eof
      /Endif
      /Define SYSTEM_H

    ‚ *
    ‚ *  NOMBRE.......: SYSTEM_H
    ‚ *  DESCRIPCION..: Declaración de prototipos de las APIs de mandatos
    ‚ *                 CL (CL Command APIs).
    ‚ *
    ‚ *  Programador..: Javier Mora
    ‚ *  Fecha........: 7.01.2006
    ‚ *
    ‚ *  Historia:
    ‚ *
    ‚ *   Fecha   Programador        Observaciones
    ‚ *  -------- ------------------ -------------
    ‚ *  25.09.06 Javier Mora        Se incluye formato CPOP0100 para el
    ‚ *                              API QCAPCMD.
    ‚ *  05.08.08 Javier Mora        Incluir API QCLRPGMI - Recuperar
    ‚ *                              información de programa.
    ‚ *
    ‚ *  Usar como:
    ‚ *
    ‚ *    /Copy API,System_H
    ‚ *
    ‚ *  Notas:
    ‚ *

    ‚ * ==================================================================
    ‚ * = OTROS FICHEROS DE CABECERA                                     =
    ‚ * ==================================================================

      /Copy API,StdTyp_H

    ‚ * ==================================================================
    ‚ * = DEFINICIÓN DE CONSTANTES                                       =
    ‚ * ==================================================================

    ‚D*  Valores de retorno de la función system()
     D SYSTEM_RC_NULL  C                   Const( -1 )
     D SYSTEM_RC_SUCC  C                   Const( 0 )
     D SYSTEM_RC_FAIL  C                   Const( 1 )

      /If Defined( EXCP_MSGID_DEF )
    ‚D*  Identificador del mensaje de error cuando se produce una excepción
    ‚D*  en la llamada a system()
     D Excp_MsgId      S              7A   Import( '_EXCP_MSGID' )
      /Endif

    ‚ * ==================================================================
    ‚ * = DEFINICIÓN DE TIPOS                                            =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato CPOP0100 con información para el parámetro de bloque   -
    ‚ * - de control del API QCAPCMD                                     -
    ‚ * ------------------------------------------------------------------
    ‚ * - typeProc       Tipo de proceso para el mandato                 -
    ‚ * -                  0 = Ejecutar el mandato (QCMDEXC).            -
    ‚ * -                  1 = Comprobar la sintaxis del mandato.        -
    ‚ * -                  2 = Ejecución desde línea de mandato.         -
    ‚ * -                  3 = Comprobación de sistaxis desde línea de   -
    ‚ * -                      mandato.                                  -
    ‚ * -                  4 = Sentencia para programa CL.               -
    ‚ * -                  5 = CL input stream.                          -
    ‚ * -                  6 = Sentencia para definición de mandatos.    -
    ‚ * -                  7 = Sentencia para definición del lenguaje de -
    ‚ * -                      enlace.                                   -
    ‚ * -                  8 = Opciones definidas por el usuario.        -
    ‚ * -                  9 = Fuente para programa ILE CL.              -
    ‚ * -                 10 = Command prompt string.                    -
    ‚ * - DBCSDtaHdl     Manejo de los datos DBCS:                       -
    ‚ * -                  0 = Ignora los datos DBCS.                    -
    ‚ * -                  1 = Maneja los datos DBCS.                    -
    ‚ * - promptAct      Si debe llamarse la solicitud del mandato:      -
    ‚ * -                  0 = Nunca.                                    -
    ‚ * -                  1 = Siempre.                                  -
    ‚ * -                  2 = Sólo si hay caracteres de selección en el -
    ‚ * -                      mandato.                                  -
    ‚ * -                  3 = Mostar ayuda.                             -
    ‚ * - cmdSyntax      Sintaxis de la cadena del mandato:              -
    ‚ * -                  0 = Usa sintaxis del sistema. Formato objetos -
    ‚ * -                      calificados como "biblioteca/objeto".     -
    ‚ * -                  1 = Usa sintaxis S/38. Formato objetos        -
    ‚ * -                      calificados como "objeto.biblioteca".     -
    ‚ * - msgRtvKey      Clave de mensaje                                -
    ‚ * -                                                                -
    ‚ * - Nota: Esta estructura de datos no se define basada en un       -
    ‚ * - puntero (Based(..)) para permitir la inicialización de varios  -
    ‚ * - de sus campos.                                                 -
    ‚ * ------------------------------------------------------------------
     D CPOP0100        DS                  Qualified
     D   typeProc                    10I 0 Overlay( CPOP0100:  1 )
     D   DBCSDtaHdl                   1A   Overlay( CPOP0100:  5 )
     D   promptAct                    1A   Overlay( CPOP0100:  6 )
     D   cmdSyntax                    1A   Overlay( CPOP0100:  7 )
     D   msgRtvKey                    4A   Overlay( CPOP0100:  8 )
     D                                     Inz( *ALLX'00' )
     D                                9A   Overlay( CPOP0100: 12 )
     D                                     Inz( *ALLX'00' )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato PGMI0100 con información sobre un programa devuelta    -
    ‚ * - la API Recuperar Información de Programa (QCLRPGMI)            -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytesRtn       Bytes devueltos.                                -
    ‚ * - bytesAvl       Bytes disponibles.                              -
    ‚ * - pgmNam         Nombre del programa.                            -
    ‚ * - pgmLib         Biblioteca del programa.                        -
    ‚ * - pgmOwner       Propietario del programa.                       -
    ‚ * - pgmAttr        Atributos del programa.                         -
    ‚ * - crtDatTim      Fecha y hora de creación del programa.          -
    ‚ * - srcFilNam      Nombre del archivo fuente.                      -
    ‚ * - srcFilLib      Biblioteca del archivo fuente.                  -
    ‚ * - srcFilMbr      Miembro fuento.                                 -
    ‚ * - srcUpdDatTim   Fecha y hora de última actualización del        -
    ‚ * -                archivo fuente.                                 -
    ‚ * - obsInf         Información observable.                         -
    ‚ * - usrPrfOpt      Opción de perfil de usuario.                    -
    ‚ * - useAdpAut      Usa autorización adoptada.                      -
    ‚ * - logCmd         Anotar mandatos.                                -
    ‚ * - alowRtvClSrc   Permitir recuperar fuente CL.                   -
    ‚ * - fixDecDta      Arreglar datos decimales.                       -
    ‚ * - text           Texto descriptivo.                              -
    ‚ * - typPgm         Tipo de programa.                               -
    ‚ * - teraspace      Teraespacio habilitado para el programa.        -
    ‚ * - minNbrParm     Número mínimo de parámetros.                    -
    ‚ * - maxNbrParm     Número máximo de parámetros.                    -
    ‚ * - pgmSize        Tamaño de programa.                             -
    ‚ * - asocSpcSiz     Tamaño del espacio asociado.                    -
    ‚ * - staticStgSiz   Tamaño del almacenamiento estático.             -
    ‚ * - autStgSiz      Tamaño del almacenamiento automático.           -
    ‚ * - nbrMiIns       Número de instrucciones MI.                     -
    ‚ * - nbrMiOdtEnt    Número de entradas MI ODT.                      -
    ‚ * - pgmStt         Estado del programa.                            -
    ‚ * - compId         Identificación del compilador.                  -
    ‚ * - relCanRun      Primer release que puede ejecutar el programa.  -
    ‚ * - sortSeqTblN    Nombre de la tabla de ordenación de secuencia.  -
    ‚ * - sortSeqTblL    Biblioteca de la tabla de ordenación.           -
    ‚ * - lang           Identificador de idioma.                        -
    ‚ * - pgmDmn         Dominio del programa.                           -
    ‚ * - cnvReq         Requiere conversión.                            -
    ‚ * - optimization   Optimización.                                   -
    ‚ * - pagPool        Agrupación paginación.                          -
    ‚ * - updPASA        ¿?                                              -
    ‚ * - clrPASA        ¿?                                              -
    ‚ * - pagAmount      Cantidad paginación.                            -
    ‚ * - pgmEntProcMod  Módulo del procedimiento de entrada al programa.-
    ‚ * - pgmEntProcModLib                                               -
    ‚ * -                Biblioteca del módulo del procedimiento de      -
    ‚ * -                entrada.                                        -
    ‚ * - actGrpAttr     Atributo grupo de activación.                   -
    ‚ * - obsInfComp     Información observable comprimida.              -
    ‚ * - runInfComp     Información de tiempo de ejecución comprimida.  -
    ‚ * - relCrtOn       Release en el que se ha creado el programa.     -
    ‚ * - shrActGrp      Grupo de activación compartido.                 -
    ‚ * - allowUpd       Permite actualización.                          -
    ‚ * - CCSID          Identificador de juego de caracteres.           -
    ‚ * - nbrMods        Número de módulos.                              -
    ‚ * - nbrSrvPgms     Número de programas de servicio.                -
    ‚ * - nbrCopyRight   Número de Copyrights.                           -
    ‚ * - nbrUnresolRefs Número de referencias sin resolver.             -
    ‚ * - relCrtFor      Release para el que se creó el programa.        -
    ‚ * - allowStaStgReinit                                              -
    ‚ * -                Permitir reinicialización del almacenamiento    -
    ‚ * -                estático.                                       -
    ‚ * - allCrtDta      Todos los datos de creación.                    -
    ‚ * - allowBound     Permitir actualización de nombre de biblioteca  -
    ‚ * -                *SRVPGM enlazada.                               -
    ‚ * - profDta        Datos de perfilado.                             -
    ‚ * - teraspcStgEnbl Módulos con almacenamiento en teraespacio       -
    ‚ * -                habilitados.                                    -
    ‚ * - stgModel       Modelo de almacenamiento.                       -
    ‚ * ------------------------------------------------------------------

     D PGMI0100_T      DS                  Based( apitype_ )
     D                                     Qualified
     D   bytesRtn                    10I 0 Overlay( PGMI0100_T:   1 )
     D   bytesAvl                    10I 0 Overlay( PGMI0100_T:   5 )
    ‚D*  Información sobre creación del programa
     D   pgmNam                      10A   Overlay( PGMI0100_T:   9 )
     D   pgmLib                      10A   Overlay( PGMI0100_T:  19 )
     D   pgmOwner                    10A   Overlay( PGMI0100_T:  29 )
     D   pgmAttr                     10A   Overlay( PGMI0100_T:  39 )
     D   crtDatTim                   13A   Overlay( PGMI0100_T:  49 )
     D   srcFilNam                   10A   Overlay( PGMI0100_T:  62 )
     D   srcFilLib                   10A   Overlay( PGMI0100_T:  72 )
     D   srcFilMbr                   10A   Overlay( PGMI0100_T:  82 )
     D   srcUpdDatTim                13A   Overlay( PGMI0100_T:  92 )
     D   obsInf                       1A   Overlay( PGMI0100_T: 105 )
     D   usrPrfOpt                    1A   Overlay( PGMI0100_T: 106 )
     D   useAdpAut                    1A   Overlay( PGMI0100_T: 107 )
     D   logCmd                       1A   Overlay( PGMI0100_T: 108 )
     D   alowRtvClSrc                 1A   Overlay( PGMI0100_T: 109 )
     D   fixDecDta                    1A   Overlay( PGMI0100_T: 110 )
     D   text                        50A   Overlay( PGMI0100_T: 111 )
     D   typPgm                       1A   Overlay( PGMI0100_T: 161 )
     D   teraspace                    1A   Overlay( PGMI0100_T: 162 )
     D                               58A
    ‚D*  Información sobre estadísticas
     D   minNbrParm                  10I 0 Overlay( PGMI0100_T: 221 )
     D   maxNbrParm                  10I 0 Overlay( PGMI0100_T: 225 )
     D   pgmSize                     10I 0 Overlay( PGMI0100_T: 229 )
     D   asocSpcSiz                  10I 0 Overlay( PGMI0100_T: 233 )
     D   staticStgSiz                10I 0 Overlay( PGMI0100_T: 237 )
     D   autStgSiz                   10I 0 Overlay( PGMI0100_T: 241 )
     D   nbrMiIns                    10I 0 Overlay( PGMI0100_T: 245 )
     D   nbrMiOdtEnt                 10I 0 Overlay( PGMI0100_T: 249 )
     D   pgmStt                       1A   Overlay( PGMI0100_T: 253 )
     D   compId                      14A   Overlay( PGMI0100_T: 254 )
     D   relCanRun                    6A   Overlay( PGMI0100_T: 268 )
     D   sortSeqTblN                 10A   Overlay( PGMI0100_T: 274 )
     D   sortSeqTblL                 10A   Overlay( PGMI0100_T: 284 )
     D   lang                        10A   Overlay( PGMI0100_T: 294 )
     D   pgmDmn                       1A   Overlay( PGMI0100_T: 304 )
     D   cnvReq                       1A   Overlay( PGMI0100_T: 305 )
     D                               20A
    ‚D*  Información sobre rendimiento
     D   optimization                 1A   Overlay( PGMI0100_T: 326 )
     D   pagPool                      1A   Overlay( PGMI0100_T: 327 )
     D   updPASA                      1A   Overlay( PGMI0100_T: 328 )
     D   clrPASA                      1A   Overlay( PGMI0100_T: 329 )
     D   pagAmount                    1A   Overlay( PGMI0100_T: 330 )
     D                               18A
    ‚D*  Información sobre ILE
     D   pgmEntProcMod...
     D                               10A   Overlay( PGMI0100_T: 349 )
     D   pgmEntProcModLib...
     D                               10A   Overlay( PGMI0100_T: 359 )
     D   actGrpAttr                  30A   Overlay( PGMI0100_T: 369 )
     D   obsInfComp                   1A   Overlay( PGMI0100_T: 399 )
     D   runInfComp                   1A   Overlay( PGMI0100_T: 400 )
     D   relCrtOn                     6A   Overlay( PGMI0100_T: 401 )
     D   shrActGrp                    1A   Overlay( PGMI0100_T: 407 )
     D   allowUpd                     1A   Overlay( PGMI0100_T: 408 )
     D   CCSID                       10I 0 Overlay( PGMI0100_T: 409 )
     D   nbrMods                     10I 0 Overlay( PGMI0100_T: 413 )
     D   nbrSrvPgms                  10I 0 Overlay( PGMI0100_T: 417 )
     D   nbrCopyRight                10I 0 Overlay( PGMI0100_T: 421 )
     D   nbrUnresolRefs...
     D                               10I 0 Overlay( PGMI0100_T: 425 )
     D   relCrtFor                    6A   Overlay( PGMI0100_T: 429 )
     D   allowStaStgReinit...
     D                                1A   Overlay( PGMI0100_T: 435 )
     D   allCrtDta                    1A   Overlay( PGMI0100_T: 436 )
     D   allowBound                   1A   Overlay( PGMI0100_T: 437 )
     D   profDta                     10A   Overlay( PGMI0100_T: 438 )
     D   teraspcStgEnbl...
     D                                1A   Overlay( PGMI0100_T: 448 )
     D   stgModel                     1A   Overlay( PGMI0100_T: 449 )
     D                               87A

    ‚ * ==================================================================
    ‚ * = DECLARACIÓN DE FUNCIONES Y PROCEDIMIENTOS PUBLICOS             =
    ‚ * ==================================================================

    ‚ * ==================================================================
    ‚ * = Operaciones con mandatos CL                                    =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - ExecCmd - Ejecutar mandato                                     -
    ‚ * -           Execute Command (QCMDEXC)                            -
    ‚ * ------------------------------------------------------------------

     D ExecCmd         PR                  ExtPgm( 'QCMDEXC' )
     D   command                           Const Like( TypeCommand )
     D                                           Options( *VARSIZE )
     D   length                            Const Like( TypeDec )

    ‚ * ------------------------------------------------------------------
    ‚ * - PrcCmds - Procesar mandatos (API QCAPCMD)                      -
    ‚ * -                                                                -
    ‚ * - El API Procesar mandatos se usa para realizar un análisis de   -
    ‚ * - la cadena del mandato. Se puede verificar o ejecutar mandatos  -
    ‚ * - desde lenguajes de alto nivel así como el chequeo de la        -
    ‚ * - sintaxis para tipos específicos.                               -
    ‚ * -                                                                -
    ‚ * - Se puede usar para:                                            -
    ‚ * -   # Comprobar la sistaxis del mandato antes de ejecutarlo.     -
    ‚ * -   # Realizar una solicitud del mandato y recuperarlo con los   -
    ‚ * -     valores cambiados.                                         -
    ‚ * -   # Ejecutar el mandato desde un lenguaje de alto nivel.       -
    ‚ * -                                                                -
    ‚ * - Parámetros                                                     -
    ‚ * -                                                                -
    ‚ * - Entrada    Cadena con el mandato original                      -
    ‚ * - Entrada    Longitud de la cadena con el mandato original       -
    ‚ * - Entrada    Bloque de opciones de control                       -
    ‚ * -            Según el formato CPOP0100                           -
    ‚ * - Entrada    Longitud del bloque de opciones de control          -
    ‚ * -            Mínimo de 20 para el formato CPOP0100               -
    ‚ * - Entrada    Formato del bloque de opciones de control           -
    ‚ * -            De momento sólo es válido CPOP0100                  -
    ‚ * - Salida     Cadena con el mandato cambiado                      -
    ‚ * - Entrada    Tamaño disponible para la cadena con el mandato     -
    ‚ * -            cambiado                                            -
    ‚ * - Salida     Longitud del mandato cambiado                       -
    ‚ * - Salida     Código de error                                     -
    ‚ * ------------------------------------------------------------------

     D PrcCmds         PR                  ExtPgm( 'QCAPCMD' )
     D   srcCmd                            Const Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   srcCmdLen                         Const Like( TypeInt )
     D   optCtlBlk                   20A   Const
     D   optCtlBlkLn                       Const Like( TypeInt )
     D   optCtlBlkFm                       Const Like( TypeApiFormat )
     D   chgCmd                                  Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   chgCmdLen                         Const Like( TypeInt )
     D   chgCmdLenAv                             Like( TypeInt )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )

    ‚ * ------------------------------------------------------------------
    ‚ * - System - Ejecutar mandato                                      -
    ‚ * -          Execute Command (system()) ANSI C                     -
    ‚ * -                                                                -
    ‚ * - Es necesario enlacar con el directorio (BNDDIR) QC2LE          -
    ‚ * ------------------------------------------------------------------

     D System          PR            10I 0 ExtProc( 'system' )
     D   command                       *   Value Options( *STRING )

    ‚ * ------------------------------------------------------------------
    ‚ * - RtvPgmInf - Recuperar información de programa                  -
    ‚ * -                                                                -
    ‚ * - Retrieve Program Information (QCLRPGMI)                        -
    ‚ * ------------------------------------------------------------------

     D RtvPgmInf       PR                  ExtPgm( 'QCLRPGMI' )
     D   rcvVar                                  Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   rcvVarLen                         Const Like( TypeInt )
     D   format                            Const Like( TypeApiFormat )
     D   pgmNamQ                           Const Like( TypeQualName )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )

