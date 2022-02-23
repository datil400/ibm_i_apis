      /If Defined( RECIO_H )
      /Eof
      /Endif
      /Define RECIO_H

    ‚ *
    ‚ *  NOMBRE.......: RECIO_H
    ‚ *  DESCRIPCION..: Declaraciones de constantes, tipos y prototipos
    ‚ *                 de funciones para todas las operaciones de E/S
    ‚ *                 con registros de archivos de base de datos.
    ‚ *
    ‚ *    Biblioteca de funciones en tiempo de ejecución de ILE C/C++.
    ‚ *
    ‚ *  Programador..: Javier Mora
    ‚ *  Fecha........: 22.09.2006
    ‚ *
    ‚ *  Historia:
    ‚ *
    ‚ *   Fecha   Programador        Observaciones
    ‚ *  -------- ------------------ -------------
    ‚ *  14.07.08 Javier Mora        Corregir errores en comentarios.
    ‚ *  24.07.09 Javier Mora        Revisadas DS para 'Align'.
    ‚ *
    ‚ *  Usar como:
    ‚ *
    ‚ *    /Copy API,RecIO_H
    ‚ *
    ‚ *  Notas:
    ‚ *
    ‚ *  1. Obtenido a partir de QSYSINC/H,RECIO
    ‚ *
    ‚ *  2. Para utilizar estas funciones es necesario utilizar el
    ‚ *     directorio de enlace QC2LE.
    ‚ *

    ‚ * ==================================================================
    ‚ * = OTROS FICHEROS DE CABECERA                                     =
    ‚ * ==================================================================


    ‚ * ==================================================================
    ‚ * = DEFINICIÓN DE CONSTANTES                                       =
    ‚ * ==================================================================

     D RECIO_EOF       C                   Const( -1 )
     D RECIO_FILENAME_MAX...
     D                 C                   Const( 39 )

    ‚D* Limitado por la cantidad de almacenamiento disponible
     D RECIO_ROPEN_MAX...
     D                 C                   Const( 32767 )

     D RECIO_RRN_EQ    C                   Const( X'08000300' )

     D RECIO_KEY_EQ    C                   Const( X'0B000100' )
     D RECIO_KEY_GT    C                   Const( X'0D000100' )
     D RECIO_KEY_LT    C                   Const( X'09000100' )
     D RECIO_KEY_LE    C                   Const( X'0A000100' )
     D RECIO_KEY_GE    C                   Const( X'0C000100' )
     D RECIO_KEY_NEXTUNQ...
     D                 C                   Const( X'05000100' )
     D RECIO_KEY_PREVUNQ...
     D                 C                   Const( X'06000100' )
     D RECIO_KEY_NEXTEQ...
     D                 C                   Const( X'0E000100' )
     D RECIO_KEY_PREVEQ...
     D                 C                   Const( X'0F000100' )

     D RECIO_FIRST     C                   Const( X'01000300' )
     D RECIO_LAST      C                   Const( X'02000300' )
     D RECIO_NEXT      C                   Const( X'03000300' )
     D RECIO_PREVIOUS  C                   Const( X'04000300' )

     D RECIO_START_FRC...
     D                 C                   Const( X'03000004' )
     D RECIO_START     C                   Const( X'01000004' )
     D RECIO_END_FRC   C                   Const( X'04000004' )
     D RECIO_END       C                   Const( X'02000004' )

     D RECIO_NO_LOCK   C                   Const( X'00000001' )
     D RECIO_DFT       C                   Const( X'0B000100' )
     D RECIO_NO_POSITION...
     D                 C                   Const( X'00100000' )
     D RECIO_PRIOR     C                   Const( X'00001000' )
     D RECIO_DATA_ONLY...
     D                 C                   Const( X'00000002' )
     D RECIO_NULL_KEY_MAP...
     D                 C                   Const( X'00000008' )

     D RECIO_READ_NEXT...
     D                 C                   Const( 3 )
     D RECIO_READ_PREV...
     D                 C                   Const( 4 )

     D RECIO_NOT_NULL_VALUE...
     D                 C                   Const( '0' )
     D RECIO_NULL_VALUE...
     D                 C                   Const( '1' )
     D RECIO_MAPPING_ERROR...
     D                 C                   Const( '2' )

     D RECIO_DK_YES    C                   Const( 1 )
     D RECIO_DK_NO     C                   Const( 0 )

    ‚ * ==================================================================
    ‚ * = DEFINICIÓN DE TIPOS                                            =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * Major Minor return code struct
    ‚ *  typedef struct {
    ‚ *    char                         major_rc[2];
    ‚ *    char                         minor_rc[2];
    ‚ *  } _Maj_Min_rc_T;
    ‚ * ------------------------------------------------------------------

    ‚ * ------------------------------------------------------------------
    ‚ * System specific information
    ‚ *  typedef struct {
    ‚ *    void                        *sysparm_ext;
    ‚ *    _Maj_Min_rc_T                _Maj_Min;
    ‚ *    char                         reserved1[12];
    ‚ *  } _Sys_Struct_T;
    ‚ * ------------------------------------------------------------------

    ‚ * ------------------------------------------------------------------
    ‚ *  typedef struct {
    ‚ *    unsigned char               *key;
    ‚ *    _Sys_Struct_T               *sysparm;
    ‚ *    unsigned long                rrn;
    ‚ *    long                         num_bytes;
    ‚ *    short                        blk_count;
    ‚ *    char                         blk_filled_by;
    ‚ *    int                          dup_key   : 1;
    ‚ *    int                          icf_locate: 1;
    ‚ *    int                          reserved1 : 6;
    ‚ *    char                         reserved2[20];
    ‚ *  } _RIOFB_T;
    ‚ * ------------------------------------------------------------------

    ‚D*  Realimentación de E/S
     D RIOFB_T         DS                  Based( C_Typ_ )
     D                                     Qualified
     D                                     Align
     D  key                            *
     D  sysParm                        *
     D  rrn                          10U 0
     D  num_bytes                    10I 0
     D  blk_count                     5I 0
     D  blk_filled_by                 1A
     D  bitFld                        1A
     D                               20A

    ‚ * ------------------------------------------------------------------
    ‚ *  typedef _Packed struct {
    ‚ *    char                         reserved1[16];
    ‚ *    volatile void  *const *const in_buf;
    ‚ *    volatile void  *const *const out_buf;
    ‚ *    char                         reserved2[48];
    ‚ *    _RIOFB_T                     riofb;
    ‚ *    char                         reserved3[32];
    ‚ *    const unsigned int           buf_length;
    ‚ *    char                         reserved4[28];
    ‚ *    volatile char  *const        in_null_map;
    ‚ *    volatile char  *const        out_null_map;
    ‚ *    volatile char  *const        null_key_map;
    ‚ *    char                         reserved5[48];
    ‚ *    const int                    min_length;
    ‚ *    short                        null_map_len;
    ‚ *    short                        null_key_map_len;
    ‚ *    char                         reserved6[8];
    ‚ *  } _RFILE;
    ‚ * ------------------------------------------------------------------

     D RFILE_T         DS                  Based( C_Typ_ )
     D                                     Qualified
     D                               16A
     D   in_buf                        *
     D   out_buf                       *
     D                               48A
     D   riofb                             LikeDs( RIOFB_T )
     D                               32A
     D   buf_length                  10U 0
     D                               28A
     D   in_null_map                   *
     D   out_null_map                  *
     D   null_key_map                  *
     D                               48A
     D   min_length                  10I 0
     D   null_map_len                 5I 0
     D   null_key_map_len...
     D                                5I 0
     D                                8A

    ‚ * ==================================================================
    ‚ * = DECLARACIÓN DE FUNCIONES Y PROCEDIMIENTOS PUBLICOS             =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - Ropen - Abrir un archivo de registros para operaciones de E/S  -
    ‚ * -         Open a Record File for I/O Operations                  -
    ‚ * -                                                                -
    ‚ * -  _RFILE       *_Ropen     (const  char *, const  char *, ...); -
    ‚ * ------------------------------------------------------------------

     D Ropen           PR              *   ExtProc( '_Ropen' )
     D   rfile                         *   Value  Options( *STRING )
     D   mode                          *   Value  Options( *STRING )
     D   optParm                       *   Value  Options( *STRING
     D                                                   : *NOPASS )

    ‚ * ------------------------------------------------------------------
    ‚ * - Rclose - Cerrar un archivo                                     -
    ‚ * -          Close a File                                          -
    ‚ * -                                                                -
    ‚ * -  int          _Rclose    (_RFILE *);                           -
    ‚ * ------------------------------------------------------------------

     D Rclose          PR            10I 0 ExtProc( '_Rclose' )
     D   rfile                         *   Value

    ‚ * ------------------------------------------------------------------
    ‚ * - Rwrite - Añadir un registro al archivo                         -
    ‚ * -          Write the Next Record                                 -
    ‚ * -                                                                -
    ‚ * _  _RIOFB_T     *_Rwrite    (_RFILE *, void *, size_t);          -
    ‚ * ------------------------------------------------------------------

     D Rwrite          PR              *   ExtProc( '_Rwrite' )
     D   rfile                         *   Value
     D   buffer                        *   Value
     D   bufLen                      10U 0 Value

    ‚ * ------------------------------------------------------------------
    ‚ * - Rreadk - Leer un registro por clave                            -
    ‚ * -          Read a Record by Key                                  -
    ‚ * -                                                                -
    ‚ * -   _RIOFB_T     *_Rreadk    (_RFILE *, void *, size_t, int,     -
    ‚ * -                                       void *, unsigned int);   -
    ‚ * ------------------------------------------------------------------

     D Rreadk          PR              *   ExtProc( '_Rreadk' )
     D   rfile                         *   Value
     D   buffer                        *   Value
     D   bufLen                      10U 0 Value
     D   options                     10I 0 Value
     D   key                           *   Value
     D   keyLen                      10U 0 Value

    ‚ * ------------------------------------------------------------------
    ‚ * - Rreadd - Leer un registro por número relativo de registro      -
    ‚ * -          Read a Record by Relative Record Number               -
    ‚ * -                                                                -
    ‚ * -  _RIOFB_T     *_Rreadd    (_RFILE *, void *, size_t, int, long);
    ‚ * ------------------------------------------------------------------

     D Rreadd          PR              *   ExtProc( '_Rreadd' )
     D   rfile                         *   Value
     D   buffer                        *   Value
     D   bufLen                      10U 0 Value
     D   options                     10I 0 Value
     D   rrn                         20I 0 Value

    ‚ * ------------------------------------------------------------------
    ‚ * - Rwrited - Añadir un registro por número relativo de registro   -
    ‚ * -          (sólo para registros suprimidos)                      -
    ‚ * -          Write a Record Directly                               -
    ‚ * -                                                                -
    ‚ * - _RIOFB_T     *_Rwrited   (_RFILE *, void *, size_t, unsigned long);
    ‚ * ------------------------------------------------------------------

     D Rwrited         PR              *   ExtProc( '_Rwrited' )
     D   rfile                         *   Value
     D   buffer                        *   Value
     D   bufLen                      10U 0 Value
     D   nrr                         20U 0 Value

    ‚ * ------------------------------------------------------------------
    ‚ * - Rupdate - Actualizar un registro                               -
    ‚ * -           Update a Record                                      -
    ‚ * -                                                                -
    ‚ * -   _RIOFB_T     *_Rupdate   (_RFILE *, void *, size_t);         -
    ‚ * ------------------------------------------------------------------

     D Rupdate         PR              *   ExtProc( '_Rupdate' )
     D   rfile                         *   Value
     D   buffer                        *   Value
     D   bufLen                      10U 0 Value

    ‚ * ------------------------------------------------------------------
    ‚ * - Rdelete - Suprimir un registro del archivo                     -
    ‚ * -           Delete a Record                                      -
    ‚ * -                                                                -
    ‚ * _  _RIOFB_T     *_Rdelete   (_RFILE *);                          -
    ‚ * ------------------------------------------------------------------

     D Rdelete         PR              *   ExtProc( '_Rdelete' )
     D   rfile                         *   Value

    ‚ * ------------------------------------------------------------------
    ‚ * - Rrlslck - Liberar un bloque de registro                        -
    ‚ * -           Release a Record Lock                                -
    ‚ * -                                                                -
    ‚ * -  int           _Rrlslck   (_RFILE *);                          -
    ‚ * ------------------------------------------------------------------

     D Rrlslck         PR            10I 0 ExtProc( '_Rrlslck' )
     D   rfile                         *   Value

    ‚ * ------------------------------------------------------------------
    ‚ * - Rlocate - Situarse en un registro                              -
    ‚ * -           Position a Record                                    -
    ‚ * -                                                                -
    ‚ * -  _RIOFB_T     *_Rlocate   (_RFILE *, void *, int, int);        -
    ‚ * ------------------------------------------------------------------

     D Rlocate         PR              *   ExtProc( '_Rlocate' )
     D   rfile                         *   Value
     D   key                           *   Value
     D   klen_rrn                    10I 0 Value
     D   options                     10I 0 Value

    ‚ * ------------------------------------------------------------------
    ‚ * - Rwrread - Escribe y lee un registro (buffers separados)        -
    ‚ * -           Write and Read a Record (separate buffers)           -
    ‚ * -                                                                -
    ‚ * - _RIOFB_T     *_Rwrread   (_RFILE *, void *, size_t, void *, size_t);
    ‚ * ------------------------------------------------------------------

     D Rwrread         PR              *   ExtProc( '_Rwrread' )
     D   rfile                         *   Value
     D   in_buf                        *   Value
     D   inBufLen                    10U 0 Value
     D   out_buf                       *   Value
     D   outBufLen                   10U 0 Value

    ‚ * ------------------------------------------------------------------
    ‚ * - Rreadnc - Leer el siguiente registro cambiado en un subarchivo -
    ‚ * -           Read the Next Change Record in a Subfile             -
    ‚ * -                                                                -
    ‚ * -  _RIOFB_T     *_Rreadnc   (_RFILE *, void *, size_t);          -
    ‚ * ------------------------------------------------------------------

     D Rreadnc         PR              *   ExtProc( '_Rreadnc' )
     D   rfile                         *   Value
     D   buffer                        *   Value
     D   bufLen                      10U 0 Value

    ‚ * ------------------------------------------------------------------
    ‚ * - Rfeod - Forzar el "Fin-de-datos"                               -
    ‚ * -         Force then End-of-Data                                 -
    ‚ * -                                                                -
    ‚ * -  int           _Rfeod     (_RFILE *);                          -
    ‚ * ------------------------------------------------------------------

     D Rfeod           PR            10I 0 ExtProc( '_Rfeod' )
     D   rfile                         *   Value

    ‚ * ------------------------------------------------------------------
    ‚ * - Rfeov - Forzar el "Fin-de-Fichero"                             -
    ‚ * -         Force then End-of-File                                 -
    ‚ * -                                                                -
    ‚ * -  int           _Rfeov     (_RFILE *);                          -
    ‚ * ------------------------------------------------------------------

     D Rfeov           PR            10I 0 ExtProc( '_Rfeov' )
     D   rfile                         *   Value

    ‚ * ------------------------------------------------------------------
    ‚ * - Rupfb - Obtener información de la última operación de E/S      -
    ‚ * -         Provide Information on Last I/O Operation              -
    ‚ * -                                                                -
    ‚ * -  _RIOFB_T     *_Rupfb     (_RFILE *);
    ‚ * ------------------------------------------------------------------

     D Rupfd           PR              *   ExtProc( '_Rupfb' )
     D   rfile                         *   Value

    ‚ * ------------------------------------------------------------------
    ‚ *  void          _Rformat   (_RFILE *, char *);
    ‚ *  int           _Rcommit   (char *);
    ‚ *  int           _Rrollbck  (void);
    ‚ *  int           _Racquire  (_RFILE *, char *);
    ‚ *  int           _Rrelease  (_RFILE *, char *);
    ‚ *  int           _Rpgmdev   (_RFILE *, char *);
    ‚ *  void          _Rindara   (_RFILE *, char *);
    ‚ *  _RIOFB_T     *_Rreadindv (_RFILE *, void *, size_t, int);
    ‚ *  _XXIOFB_T    *_Riofbk    (_RFILE *);
    ‚ *  _XXOPFB_T    *_Ropnfbk   (_RFILE *);
    ‚ *  _XXDEV_ATR_T *_Rdevatr   (_RFILE *, char *);
    ‚ *  _RIOFB_T     *__reads    (_RFILE *, void *, size_t, int, char);
    ‚ *  int           _C_Qry_Null_Map(_RFILE *, int);
    ‚ *  int           _C_Qry_Null_Key_Map(_RFILE *, int, int);
    ‚ * ------------------------------------------------------------------

    ‚ * ------------------------------------------------------------------
    ‚ * - Rreadn - Leer el siguiente registro                            -
    ‚ * -          Read the Next Record                                  -
    ‚ * -                                                                -
    ‚ * -  _RIOFB_T     *_Rreadn    (_RFILE *, void *, size_t, int);     -
    ‚ * ------------------------------------------------------------------

     D Rreadn          PR              *   ExtProc( '_Rreadn' )
     D   rfile                         *   Value
     D   buffer                        *   Value
     D   bufLen                      10U 0 Value
     D   options                     10I 0 Value

    ‚ * ------------------------------------------------------------------
    ‚ *  _RIOFB_T     *_Rreadp    (_RFILE *, void *, size_t, int);
    ‚ * ------------------------------------------------------------------

    ‚ * ------------------------------------------------------------------
    ‚ * - Rreadf - Leer el primer registro                               -
    ‚ * -          Read the First Record                                 -
    ‚ * -                                                                -
    ‚ * -  _RIOFB_T     *_Rreadf    (_RFILE *, void *, size_t, int);     -
    ‚ * ------------------------------------------------------------------

     D Rreadf          PR              *   ExtProc( '_Rreadf' )
     D   rfile                         *   Value
     D   buffer                        *   Value
     D   bufLen                      10U 0 Value
     D   options                     10I 0 Value

    ‚ * ------------------------------------------------------------------
    ‚ * - Rreadl - Leer el último registro                               -
    ‚ * -          Read the Last Record                                  -
    ‚ * -                                                                -
    ‚ * _   _RIOFB_T     *_Rreadl    (_RFILE *, void *, size_t, int);    -
    ‚ * ------------------------------------------------------------------

     D Rreadl          PR              *   ExtProc( '_Rreadl' )
     D   rfile                         *   Value
     D   buffer                        *   Value
     D   bufLen                      10U 0 Value
     D   options                     10I 0 Value

    ‚ * ------------------------------------------------------------------
    ‚ * - Rreads - Leer el mismo registro                                -
    ‚ * -          Read the Same Record                                  -
    ‚ * -                                                                -
    ‚ * -  _RIOFB_T     *_Rreads    (_RFILE *, void *, size_t, int);     -
    ‚ * ------------------------------------------------------------------

     D Rreads          PR              *   ExtProc( '_Rreads' )
     D   rfile                         *   Value
     D   buffer                        *   Value
     D   bufLen                      10U 0 Value
     D   options                     10I 0 Value

    ‚ * ------------------------------------------------------------------
    ‚ * - Rwriterd - Escribir y leer un registro                         -
    ‚ * -            Write and Read a Record                             -
    ‚ * -                                                                -
    ‚ * -  _RIOFB_T     *_Rwriterd  (_RFILE *, void *, size_t);          -
    ‚ * ------------------------------------------------------------------

     D Rwriterd        PR              *   ExtProc( '_Rwriterd' )
     D   rfile                         *   Value
     D   buffer                        *   Value
     D   bufLen                      10U 0 Value


    ‚ *  extern int       _C2M_MSG;
