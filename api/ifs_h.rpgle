      /If Defined( IFS_H )
      /Eof
      /Endif
      /Define IFS_H

    ‚ *
    ‚ *  NOMBRE.......: IFS_H
    ‚ *  DESCRIPCION..: Declaración de los tipos y prototipos para el
    ‚ *                 manejo de archivos en el IFS.
    ‚ *                 APIs estilo UNIX.
    ‚ *
    ‚ *  Basado en el trabajo de Julian Monipeny.
    ‚ *
    ‚ *
    ‚ *  Programador..: Javier Mora
    ‚ *  Fecha........: 23.07.2004
    ‚ *
    ‚ *  Historia:
    ‚ *
    ‚ *   Fecha   Programador        Observaciones
    ‚ *  -------- ------------------ -------------
    ‚ *
    ‚ *  Usar como:
    ‚ *
    ‚ *    /Copy API,Ifs_H
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

     D STRM_ERROR      C                   -1

    ‚ * ------------------------------------------------------------------
    ‚ * - Opciones de apertura requeridas                                -
    ‚ * ------------------------------------------------------------------
     D STRM_READ       C                   1
     D STRM_WRITE      C                   2
     D STRM_READWRTIE...
     D                 C                   4

    ‚ * ------------------------------------------------------------------
    ‚ * - Opciones de apertura opcionales                                -
    ‚ * ------------------------------------------------------------------
     D STRM_CREATE     C                   8
     D STRM_EXCLUSIVE...
     D                 C                   16
     D STRM_TRUNCATE   C                   64
     D STRM_NONBLANK   C                   128
     D STRM_APPEND     C                   256
     D STRM_SHARENONE...
     D                 C                   2000000
     D STRM_SHAREREAD...
     D                 C                   0200000
     D STRM_SHAREREADWTRIE...
     D                 C                   1000000
     D STRM_SHAREWRITE...
     D                 C                   0400000
     D STRM_TEXTDATA   C                   16777216
     D STRM_CODEPAGE   C                   8388608

    ‚ * ------------------------------------------------------------------
    ‚ * - Modo control de acceso                                         -
    ‚ * ------------------------------------------------------------------
     D STRM_USERREAD   C                   256
     D STRM_USERWRITE...
     D                 C                   128
     D STRM_USEREXEC   C                   64
     D STRM_USERDOALL...
     D                 C                   448
     D STRM_GROUPREAD...
     D                 C                   32
     D STRM_GROUPWRITE...
     D                 C                   16
     D STRM_GROUPEXEC...
     D                 C                   8
     D STRM_GROUPDOALL...
     D                 C                   56
     D STRM_OTHERSREAD...
     D                 C                   4
     D STRM_OTHERSWRITE...
     D                 C                   2
     D STRM_OTHERSEXEC...
     D                 C                   1
     D STRM_OTHERSDOALL...
     D                 C                   7

    ‚ * ------------------------------------------------------------------
    ‚ * - Id de página de códigos                                        -
    ‚ * ------------------------------------------------------------------
     D STRM_ASCIICODEPAGE...
     D                 C                   819
     D STRM_JOBCODEPAGE...
     D                 C                   65535

    ‚ * ------------------------------------------------------------------
    ‚ * - Caractéres de control fin de línea                             -
    ‚ * ------------------------------------------------------------------
     D STRM_CREOL      C                   x'0D'
     D STRM_CRLFEOL    C                   x'0D25'
     D STRM_LFEOL      C                   x'25'
     D STRM_LFCREOL    C                   x'250D'

    ‚ * ==================================================================
    ‚ * = DEFINICIÓN DE TIPOS                                            =
    ‚ * ==================================================================

     d streamErrorId   s                   like( TypeInt )
     d                                     based( streamErrorIdPtr )

     D TypeStreamDirHandle...
     D                 S                   Like( TypePtr ) Based( StdType_ )
     D TypeStreamDirPtr...
     D                 S                   Like( TypePtr ) Based( StdType_ )
     D TypeStreamDirEntryPtr...
     D                 S                   Like( TypePtr ) Based( StdType_ )
     D TypeStreamFileHandle...
     D                 S                   Like( TypeInt ) Based( StdType_ )
     D TypeStreamReturn...
     D                 S                   Like( TypeInt ) Based( StdType_ )

    ‚ * ------------------------------------------------------------------
    ‚ * - Estructura de la entrada de directorio                         -
    ‚ * ------------------------------------------------------------------
     D TypeStreamDirEntry...
     D                 DS                  Qualified Based( StdType_ )
       // Null on error
     D                               52
     D  len                                Like( TypeInt )
     D  path                        641
        // C string

    ‚ * ------------------------------------------------------------------
    ‚ * - Información del archivo continuo                               -
    ‚ * ------------------------------------------------------------------
     D TypeStreamInfo  DS                  Qualified
     D  mode                               Like( TypeUnsignedInt )
     D  fileNbr                            Like( TypeUnsignedInt )
     D  links                              Like( TypeUnsignedSmallInt )
     D                                2
     D  userNbr                            Like( TypeUnsignedInt )
     D  groupNbr                           Like( TypeUnsignedInt )
     D  size                               Like( TypeUnsignedInt )
     D  timeUsed                           Like( TypeUnsignedInt )
     D  timeChanged                        Like( TypeUnsignedInt )
     D  timeStatusChanged...
     D                                     Like( TypeUnsignedInt )
     D  systemNbr                          Like( TypeUnsignedInt )
     D  blockSize                          Like( TypeUnsignedInt )
     D  allocation                         Like( TypeUnsignedInt )
     D  type                               Like( TypeName )
        // *DIR, *STMF, object type
     D  codePage                           Like( TypeUnsignedSmallInt )
     D  ccsid                              Like( TypeUnsignedSmallInt )
     D                               60
     D  generationNbr                      Like( TypeUnsignedInt )


    ‚ * ==================================================================
    ‚ * = DECLARACIÓN DE FUNCIONES Y PROCEDIMIENTOS PUBLICOS             =
    ‚ * ==================================================================

    ‚ * ==================================================================
    ‚ * = GetStreamErrorId                                               =
    ‚ * ==================================================================

     D GetStreamErrorId...
     D                 PR                  Extproc( '__errno' )
     D                                     Like( streamErrorIdPtr )

    ‚ * ==================================================================
    ‚ * = Operaciones de E/S con ficheros contínuos                      =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - GetStreamInfo                                                  -
    ‚ * ------------------------------------------------------------------

     D GetStreamInfo   PR                  Extproc( 'lstat' )
     D                                     Like( TypeStreamReturn )
     D  path                               Value Like( TypePtr )
     D                                     Options( *STRING )
     D  streamInfo_                        Like( TypeStreamInfo )

    ‚ * ------------------------------------------------------------------
    ‚ * - OpenStreamFile                                                 -
    ‚ * ------------------------------------------------------------------

     D OpenStreamFile  PR                  Extproc( 'open' )
     D                                     Like( TypeStreamFileHandle )
     D  file                               Value Like( TypePtr )
     D                                     Options( *STRING )
     D  option                             Value Like( TypeInt )
     D  mode                               Value Like( TypeUnsignedInt )
     D                                     Options( *NOPASS )
     D  codePage                           Value Like( TypeUnsignedInt )
     D                                     Options( *NOPASS )

    ‚ * ------------------------------------------------------------------
    ‚ * - CloseStreamFile                                                -
    ‚ * ------------------------------------------------------------------

     D CloseStreamFile...
     D                 PR                  Extproc( 'close' )
     D                                     Like( TypeStreamReturn )
     D  fileHandle                         Value Like( TypeStreamFileHandle )

    ‚ * ------------------------------------------------------------------
    ‚ * - ReadStreamFile                                                 -
    ‚ * ------------------------------------------------------------------

     D ReadStreamFile  PR                  Extproc( 'read' )
     D                                     Like( TypeStreamReturn )
     D  fileHandle                         Value Like( TypeStreamFileHandle )
     D  bufferPtr                          Value Like( TypePtr )
     D  bufferLen                          Value Like( TypeUnsignedInt )

    ‚ * ------------------------------------------------------------------
    ‚ * - WriteStreamFile                                                -
    ‚ * ------------------------------------------------------------------

     D WriteStreamFile...
     D                 PR                  Extproc( 'write' )
     D                                     Like( TypeStreamReturn )
     D  fileHandle                         Value Like( TypeStreamFileHandle )
     D  bufferPtr                          Value Like( TypePtr )
     D  bufferLen                          Value Like( TypeUnsignedInt )


    ‚ * ==================================================================
    ‚ * = Operaciones de E/S con carpetas/directorios del IFS            =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - GetCurrStreamDir                                               -
    ‚ * ------------------------------------------------------------------

     D GetCurrStreamDir...
     D                 PR                  Extproc( 'getcwd' )
        // Cadena en formato C
     D  path                               Like( TypeString )
     D  size                               Value Like( TypeInt )

    ‚ * ------------------------------------------------------------------
    ‚ * - SetCurrStreamDir                                               -
    ‚ * ------------------------------------------------------------------

     D SetCurrStreamDir...
     D                 PR                  Extproc( 'chdir' )
     D                                     Like( TypeStreamReturn )
     D  path                               Value Like( TypePtr )
     D                                     Options( *STRING )

    ‚ * ------------------------------------------------------------------
    ‚ * - OpenStreamDir                                                  -
    ‚ * ------------------------------------------------------------------

     D OpenStreamDir   PR                  Extproc( 'opendir' )
     D                                     Like( TypeStreamDirHandle )
     D  path                               Value Like( TypePtr )
     D                                     Options( *STRING )

    ‚ * ------------------------------------------------------------------
    ‚ * - CloseStreamDir                                                 -
    ‚ * ------------------------------------------------------------------

     D CloseStreamDir  PR                  Extproc( 'closedir' )
     D                                     Like( TypeStreamReturn )
     D  dirHandle                          Value Like( TypeStreamDirHandle )

    ‚ * ------------------------------------------------------------------
    ‚ * - ResetStreamDir                                                 -
    ‚ * ------------------------------------------------------------------

     D ResetStreamDir  PR                  Extproc( 'rewinddir' )
     D  dirHandle                          Value Like( TypeStreamDirHandle )

    ‚ * ------------------------------------------------------------------
    ‚ * - NextStreamDirEntry                                             -
    ‚ * ------------------------------------------------------------------

     D NextStreamDirEntry...
     D                 PR                  Extproc( 'readdir' )
     D                                     Like( TypeStreamDirEntryPtr )
     D  dirHandle                          Value Like( TypeStreamDirHandle )
