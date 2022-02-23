      /If Defined( FILE_H )
      /Eof
      /Endif
      /Define FILE_H

    ‚ *
    ‚ *  NOMBRE.......: FILE_H
    ‚ *  DESCRIPCION..: Declaración de los tipos y prototipos para las
    ‚ *                 APIs relacionadas con archivos.
    ‚ *
    ‚ *  Programador..: Javier Mora
    ‚ *  Fecha........: 19.08.2008
    ‚ *
    ‚ *  Historia:
    ‚ *
    ‚ *   Fecha   Programador        Observaciones
    ‚ *  -------- ------------------ -------------
    ‚ *  30.12.09 Javier Mora        Incluir estructuras de datos para
    ‚ *                              punto de salida QIBM_QDB_OPEN.
    ‚ *  08.06.11 Javier Mora        Incluir prototipo para QUSRMBRD y
    ‚ *                              estructura de datos MBRD0100.
    ‚ *
    ‚ *  Usar como:
    ‚ *
    ‚ *    /Copy API,File_H
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

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato DBRL0100 con información sobre los archivos            -
    ‚ * - dependientes de otro.                                          -
    ‚ * -                                                                -
    ‚ * - API List Database Relations (QDBLDBR)                          -
    ‚ * ------------------------------------------------------------------
    ‚ * - fileNam        Nombre del archivo.                             -
    ‚ * - fileLib        Biblioteca del archivo.                         -
    ‚ * - depFilNam      Nombre del archivo dependiente.                 -
    ‚ * - depFilLib      Biblioteca del archivo dependiente.             -
    ‚ * - depType        Tipo de dependencia.                            -
    ‚ * - joinRefNbr     Número de referencia de la unión.               -
    ‚ * - cstLibNam      Nombre de la biblioteca de la restricción.      -
    ‚ * - cstNamLen      Longitud del nombre de la restricción.          -
    ‚ * - cstNam         Nombre de la restricción.                       -
    ‚ * ------------------------------------------------------------------

     D DBRL0100_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   fileNam                     10A   Overlay( DBRL0100_T:  1 )
     D   fileLib                     10A   Overlay( DBRL0100_T: 11 )
     D   depFilNam                   10A   Overlay( DBRL0100_T: 21 )
     D   depFilLib                   10A   Overlay( DBRL0100_T: 31 )
     D   depType                      1A   Overlay( DBRL0100_T: 41 )
     D                                3A
     D   joinRefNbr                  10I 0 Overlay( DBRL0100_T: 45 )
     D   cstLibNam                   10A   Overlay( DBRL0100_T: 49 )
     D   cstNamLen                   10I 0 Overlay( DBRL0100_T: 59 )
     D   cstNam                     258A   Overlay( DBRL0100_T: 63 )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato FLDL0100 con información sobre los campos de un        -
    ‚ * - archivo.                                                       -
    ‚ * -                                                                -
    ‚ * - API List Fields (QUSLFLD)                                      -
    ‚ * ------------------------------------------------------------------
    ‚ * - fldNam         Nombre del campo.                               -
    ‚ * - dtaTyp         Tipo de dato.                                   -
    ‚ * - use            Uso.                                            -
    ‚ * - outBufPos      Posición inicial en el buffer de salida.        -
    ‚ * - inpBufPos      Posición inicial en el buffer de entrada.       -
    ‚ * - fldLen         Tamaño en bytes.                                -
    ‚ * - digits         Número de dígitos.                              -
    ‚ * - decPos         Número de posiciones decimales.                 -
    ‚ * - text           Texto descriptivo.                              -
    ‚ * - editc          Código de edición.                              -
    ‚ * - editwLen       Longitud de la palabra de edición.              -
    ‚ * - editw          Palabra de edición.                             -
    ‚ * - colHdg1        Cabecera de columna 1.                          -
    ‚ * - colHdg2        Cabecera de columna 2.                          -
    ‚ * - colHdg3        Cabecera de columna 3.                          -
    ‚ * - intFldNam      Nombre interno del campo.                       -
    ‚ * - altFldNam      Nombre alternativo del campo.                   -
    ‚ * - altFldNamLen   Longitud del nombre alternativo del campo.      -
    ‚ * - nbrDBCSchr     Número de caracteres DBCS.                      -
    ‚ * - alwNull        Permitir valores nulos.                         -
    ‚ * - hstVarInd      Indicador de variable "host".                   -
    ‚ * - datTimFmt      Formato de fecha y hora.                        -
    ‚ * - datTimSep      Separador de fecha y hora.                      -
    ‚ * - varLenFldInd   Indicador de campo de longitud variable.        -
    ‚ * - txtDscCCSID    CCSID del texto descriptivo.                    -
    ‚ * - dtaCCSID       CCSID de los datos del campo.                   -
    ‚ * - colHdgCCSID    CCSID de las columnas del campo.                -
    ‚ * - editwCCSID     CCSID de la palabra de edición.                 -
    ‚ * - ucs2DspFldL    Longitud del campo visualizado en UCS-2.        -
    ‚ * - dtaEncSch      Esquema de codificación de los datos.           -
    ‚ * - maxLobjFldL    Longitud máxima de un campo que contiene un     -
    ‚ * -                objeto grande.                                  -
    ‚ * - padLenLobj     Longitud de relleno para el objeto grande.      -
    ‚ * - usrDfnTypeL    Longitud del nombre de tipo definido por el     -
    ‚ * -                usuario.                                        -
    ‚ * - usrDfnType     Nombre del tipo definido por el usuario.        -
    ‚ * - usrDfnTypLib   Biblioteca del tipo definido por el usuario.    -
    ‚ * - dtaLnkLnkCtl   Control de enlace de "Datalink".                -
    ‚ * - dtaLnkIntegr   Integridad del "Datalink".                      -
    ‚ * - dtaLnkReadPrm  Permiso de lectura para el "Datalink".          -
    ‚ * - dtaLnkWtrPrm   Permiso de escritura para el "Datalink".        -
    ‚ * - dtaLnkRcvry    Recuperar "Datalink".                           -
    ‚ * - dtaLnkUnlnkCtl Control de desenlace del "Datalink".            -
    ‚ * - dspPrtRowNbr   Número de fila de pantalla o impresora.         -
    ‚ * - dspPrtColNbr   Número de columna de pantalla o impresora.      -
    ‚ * - ROWIDcol       Columna ROWID.                                  -
    ‚ * - identityCol    Columna de identidad.                           -
    ‚ * - genBy          Generado por.                                   -
    ‚ * - icCycle        Columna identidad - Ciclo.                      -
    ‚ * - icOrigStrWth   Columna identidad - Iniciar con original.       -
    ‚ * - icCurStrWith   Columna identidad - Iniciar con actual.         -
    ‚ * - icIncBy        Columna identidad - Incremento.                 -
    ‚ * - icMinVal       Columna identidad - Valor mínimo.               -
    ‚ * - icMaxVal       Columna identidad - Valor máximo.               -
    ‚ * - icCache        Columna identidad - Cache.                      -
    ‚ * - icOrder        Columna identidad - Orden.                      -
    ‚ * ------------------------------------------------------------------

     D FLDL0100_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   fldNam                      10A   Overlay( FLDL0100_T:   1 )
     D   dtaTyp                       1A   Overlay( FLDL0100_T:  11 )
     D   use                          1A   Overlay( FLDL0100_T:  12 )
     D   outBufPos                   10I 0 Overlay( FLDL0100_T:  13 )
     D   inpBufPos                   10I 0 Overlay( FLDL0100_T:  17 )
     D   fldLen                      10I 0 Overlay( FLDL0100_T:  21 )
     D   digits                      10I 0 Overlay( FLDL0100_T:  25 )
     D   decPos                      10I 0 Overlay( FLDL0100_T:  29 )
     D   text                        50A   Overlay( FLDL0100_T:  33 )
     D   editc                        2A   Overlay( FLDL0100_T:  83 )
     D   editwLen                    10I 0 Overlay( FLDL0100_T:  85 )
     D   editw                       64A   Overlay( FLDL0100_T:  89 )
     D   colHdg1                     20A   Overlay( FLDL0100_T: 153 )
     D   colHdg2                     20A   Overlay( FLDL0100_T: 173 )
     D   colHdg3                     20A   Overlay( FLDL0100_T: 193 )
     D   intFldNam                   10A   Overlay( FLDL0100_T: 213 )
     D   altFldNam                   30A   Overlay( FLDL0100_T: 223 )
     D   altFldNamLen                10I 0 Overlay( FLDL0100_T: 253 )
     D   nbrDBCSchr                  10I 0 Overlay( FLDL0100_T: 257 )
     D   alwNull                      1A   Overlay( FLDL0100_T: 261 )
     D   hstVarInd                    1A   Overlay( FLDL0100_T: 262 )
     D   datTimFmt                    4A   Overlay( FLDL0100_T: 263 )
     D   datTimSep                    1A   Overlay( FLDL0100_T: 267 )
     D   varLenFldInd                 1A   Overlay( FLDL0100_T: 268 )
     D   txtDscCCSID                 10I 0 Overlay( FLDL0100_T: 269 )
     D   dtaCCSID                    10I 0 Overlay( FLDL0100_T: 273 )
     D   colHdgCCSID                 10I 0 Overlay( FLDL0100_T: 277 )
     D   editwCCSID                  10I 0 Overlay( FLDL0100_T: 281 )
     D   ucs2DspFldL                 10I 0 Overlay( FLDL0100_T: 285 )
     D   dtaEncSch                   10I 0 Overlay( FLDL0100_T: 289 )
     D   maxLobjFldL                 10I 0 Overlay( FLDL0100_T: 293 )
     D   padLenLobj                  10I 0 Overlay( FLDL0100_T: 297 )
     D   usrDfnTypeL                 10I 0 Overlay( FLDL0100_T: 301 )
     D   usrDfnType                 128A   Overlay( FLDL0100_T: 305 )
     D   usrDfnTypLib                10A   Overlay( FLDL0100_T: 433 )
     D   dtaLnkLnkCtl                 1A   Overlay( FLDL0100_T: 443 )
     D   dtaLnkIntegr                 1A   Overlay( FLDL0100_T: 444 )
     D   dtaLnkReadPrm...
     D                                1A   Overlay( FLDL0100_T: 445 )
     D   dtaLnkWtrPrm                 1A   Overlay( FLDL0100_T: 446 )
     D   dtaLnkRcvry                  1A   Overlay( FLDL0100_T: 447 )
     D   dtaLnkUnlnkCtl...
     D                                1A   Overlay( FLDL0100_T: 448 )
     D   dspPrtRowNbr                10I 0 Overlay( FLDL0100_T: 449 )
     D   dspPrtColNbr                10I 0 Overlay( FLDL0100_T: 453 )
     D   ROWIDcol                     1A   Overlay( FLDL0100_T: 457 )
     D   identityCol                  1A   Overlay( FLDL0100_T: 458 )
     D   genBy                        1A   Overlay( FLDL0100_T: 459 )
     D   icCycle                      1A   Overlay( FLDL0100_T: 460 )
     D   icOrigStrWth                31P 0 Overlay( FLDL0100_T: 461 )
     D   icCurStrWith                31P 0 Overlay( FLDL0100_T: 477 )
     D   icIncBy                     10I 0 Overlay( FLDL0100_T: 493 )
     D   icMinVal                    31P 0 Overlay( FLDL0100_T: 497 )
     D   icMaxVal                    31P 0 Overlay( FLDL0100_T: 513 )
     D   icCache                     10I 0 Overlay( FLDL0100_T: 529 )
     D   icOrder                      1A   Overlay( FLDL0100_T: 533 )
     D                               11A

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato DBOP0100 con información de entrada para el punto de   -
    ‚ * - salida (exit point) QIBM_QDB_OPEN.                             -
    ‚ * ------------------------------------------------------------------
    ‚ * - hdrSize        Tamaño, en bytes, de la cabecera de DBOP0100.   -
    ‚ * - format         Nombre del formato de usado.                    -
    ‚ * - offsFilLst     Desplazamiento a un array con la lista de       -
    ‚ * -                archivos abiertos.                              -
    ‚ * - nbrFilLstE     Número de entradas en la lista de archivos.     -
    ‚ * - lenFilLstE     Tamaño de cada entrada en la lista de archivos. -
    ‚ * - jobName        Nombre del trabajo emisor de la petición de     -
    ‚ * -                apertura.                                       -
    ‚ * - usrName        Nombre del usuario del trabajo emisor de la     -
    ‚ * -                petición de apertura.                           -
    ‚ * - jobNbr         Número del trabajo emisor de la petición de     -
    ‚ * -                apertura.                                       -
    ‚ * - curUsrNam      Nombre del usuario actual que está abriendo el  -
    ‚ * -                archivo.                                        -
    ‚ * - dbQryOpn       Indica si el archivo está abriéndose para una   -
    ‚ * -                operación de consulta de la base de datos.      -
    ‚ * ------------------------------------------------------------------
    ‚ * - Formato de cada entrada de la lista de archivos.               -
    ‚ * ------------------------------------------------------------------
    ‚ * - file           Nombre del archivo.                             -
    ‚ * - library        Biblioteca del archivo.                         -
    ‚ * - member         Miembro del archivo.                            -
    ‚ * - fileType       Tipo de archivo:                                -
    ‚ * -                0 = Físico                                      -
    ‚ * -                1 = Lógico                                      -
    ‚ * - underlyingPF   Archivo físico subyacente si se abre un archivo -
    ‚ * -                lógico o un vista.                              -
    ‚ * -                0 = Referenciado directamente o a través de un  -
    ‚ * -                    álias.                                      -
    ‚ * -                1 = No está referenciado directamente en la     -
    ‚ * -                    petición de apertura.                       -
    ‚ * - inputOpt       Petición de apertura para entrada:              -
    ‚ * -                0 = No abierto para operaciones de entrada.     -
    ‚ * -                1 = Abierto para operaciones de entrada.        -
    ‚ * - outputOpt      Petición de apertura para operaciones de salida -
    ‚ * -                (valores similares a los del campo anterior).   -
    ‚ * - updateOpt      Petición de apertura para operaciones de        -
    ‚ * -                actualización.                                  -
    ‚ * -                (valores similares a los del campo anterior).   -
    ‚ * - deleteOpt      Petición de apertura para operaciones de borrado-
    ‚ * -                (valores similares a los del campo anterior).   -
    ‚ * ------------------------------------------------------------------

     D DBOP0100_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   hdrSize                     10I 0 Overlay( DBOP0100_T:   1 )
     D   format                       8A   Overlay( DBOP0100_T:   5 )
     D   offsFilLst                  10I 0 Overlay( DBOP0100_T:  13 )
     D   nbrFilLstE                  10I 0 Overlay( DBOP0100_T:  17 )
     D   lenFilLstE                  10I 0 Overlay( DBOP0100_T:  21 )
     D   jobName                     10A   Overlay( DBOP0100_T:  25 )
     D   usrName                     10A   Overlay( DBOP0100_T:  35 )
     D   jobNbr                       6A   Overlay( DBOP0100_T:  45 )
     D   curUsrNam                   10A   Overlay( DBOP0100_T:  51 )
     D   dbQryOpn                     1A   Overlay( DBOP0100_T:  61 )

     D DBOP0100_file_T...
     D                 DS                  Based( apityp_ )
     D                                     Qualified
     D   file                        10A
     D   library                     10A
     D   member                      10A
     D                                2A
     D   fileType                    10I 0
     D   underlyingPF                10I 0
     D   inputOpt                     1A
     D   outputOpt                    1A
     D   updateOpt                    1A
     D   deleteOpt                    1A

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato MBRD0100 con información básica sobre un miembro de    -
    ‚ * - un archivo de base de datos.                                   -
    ‚ * -                                                                -
    ‚ * - API Retrieve Member Description (QUSRMBRD)                     -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytesRtn       Bytes devueltos.                                -
    ‚ * - bytesAvl       Bytes disponibles.                              -
    ‚ * - dbfName        Nombre del archivo de base de datos.            -
    ‚ * - dbfLibNam      Biblioteca del archivo de base de datos.        -
    ‚ * - mbrName        Nombre del miembro.                             -
    ‚ * - fileAttr       Atributo del archivo.                           -
    ‚ * - srcType        Tipo del miembro fuente si está en un archivo   -
    ‚ * -                fuente.                                         -
    ‚ * - crtDatTim      Fecha y hora de creación del miembro.           -
    ‚ * - lastSrcChg     Para archivos fuente, la fecha y hora del       -
    ‚ * -                último cambio realizado en el miembro.          -
    ‚ * - tblRefrDatTim  Para tablas de consulta materializada, la fecha -
    ‚ * -                y hora del último refresco.                     -
    ‚ * - mbrText        Texto descriptivo del miembro.                  -
    ‚ * - srcFile        0=Archivo de datos; 1=Archivo fuente.           -
    ‚ * ------------------------------------------------------------------

     D MBRD0100_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   bytesRtn                    10I 0 Overlay( MBRD0100_T:   1 )
     D   bytesAvl                    10I 0 Overlay( MBRD0100_T:   5 )
     D   dbfName                     10A   Overlay( MBRD0100_T:   9 )
     D   dbfLibNam                   10A   Overlay( MBRD0100_T:  19 )
     D   mbrName                     10A   Overlay( MBRD0100_T:  29 )
     D   fileAttr                    10A   Overlay( MBRD0100_T:  39 )
     D   srcType                     10A   Overlay( MBRD0100_T:  49 )
     D   crtDatTim                   13A   Overlay( MBRD0100_T:  59 )
     D   lastSrcChg                  13A   Overlay( MBRD0100_T:  72 )
     D   tblRefrDatTim...
     D                               13A   Overlay( MBRD0100_T:  72 )
     D   mbrText                     50A   Overlay( MBRD0100_T:  85 )
     D   srcFile                      1A   Overlay( MBRD0100_T: 135 )

    ‚ * ==================================================================
    ‚ * = DECLARACIÓN DE FUNCIONES Y PROCEDIMIENTOS PUBLICOS             =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - LstDbr - Listar relaciones de la base de datos                 -
    ‚ * -                                                                -
    ‚ * - List Database Relations (QDBLDBR)                              -
    ‚ * ------------------------------------------------------------------

     D LstDbr          PR                  ExtPgm( 'QDBLDBR' )
     D   usrspc                            Const Like( TypeQualName )
     D   format                            Const Like( TypeApiFormat )
     D   fileNam                           Const Like( TypeQualName )
     D   member                            Const Like( TypeName )
     D   rcdFmt                            Const Like( TypeName )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )

    ‚ * ------------------------------------------------------------------
    ‚ * - LstFld - Listar campos de archivo                              -
    ‚ * -                                                                -
    ‚ * - List Fields (QUSLFLD)                                          -
    ‚ * ------------------------------------------------------------------

     D LstFld          PR                  ExtPgm( 'QUSLFLD' )
     D  usrSpcQ                            Const Like( TypeQualName )
     D  format                             Const Like( TypeApiFormat )
     D  fileNameQ                          Const Like( TypeQualName )
     D  rcdFmtNam                          Const Like( TypeName )
     D  ovrPrc                             Const Like( TypeChar )
     D  error                                    Like( TypeApiError )
     D                                           Options( *VARSIZE
     D                                                  : *NOPASS )

    ‚ * ------------------------------------------------------------------
    ‚ * - RtvMbrD - Recuperar descripción de miembro                     -
    ‚ * -                                                                -
    ‚ * - Retrieve Member Description (QUSRMBRD)                         -
    ‚ * ------------------------------------------------------------------

     D RtvMbrD         PR                  ExtPgm( 'QUSRMBRD' )
     D   rcvVar                                  Like( TypeBuffer2 )
     D                                           Options( *VARSIZE )
     D   rcvVarLen                         Const Like( TypeInt )
     D   format                            Const Like( TypeApiFormat )
     D   fileNameQ                         Const Like( TypeQualName )
     D   member                            Const Like( TypeName )
     D   ovrProc                           Const Like( TypeChar )
    ‚D* Grupo opcional 1:
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE
     D                                                  : *NOPASS )
    ‚D* Grupo opcional 2:
     D   FindMbrProc                       Const Like( TypeChar )
     D                                           Options( *NOPASS )
