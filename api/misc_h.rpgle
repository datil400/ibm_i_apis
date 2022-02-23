      /If Defined( MISC_H )
      /Eof
      /Else
      /Define MISC_H
      /Endif

    ‚ *
    ‚ *  NOMBRE.......: MISC_H
    ‚ *  DESCRIPCION..: Declaración de prototipos para las APIs de
    ‚ *                 carácter general. Éstas realizan funciones varias
    ‚ *                 que no están incluidas en ninguna de las otras
    ‚ *                 categorías.
    ‚ *
    ‚ *  Programador..: Javier Mora
    ‚ *  Fecha........: 24.05.2007
    ‚ *
    ‚ *  Historia:
    ‚ *
    ‚ *   Fecha   Programador        Observaciones
    ‚ *  -------- ------------------ -------------
    ‚ *
    ‚ *  Usar como:
    ‚ *
    ‚ *    /Copy API,Misc_H
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
    ‚ * - Conversión de formato de fecha y hora (API QWCCVTDT)           -
    ‚ * ------------------------------------------------------------------

    ‚ * ------------------------------------------------------------------
    ‚ * - Formatos de fecha: *JOB, *SYSVAL, *YMD, *MDY, *DMY, *JUL       -
    ‚ * - en milisegundos                                                -
    ‚ * ------------------------------------------------------------------

     D DatTimFmt16byt_T...
     D                 DS                  Based( apityp_ )
     D                                     Qualified
     D   century                      1A
     D   date                         6A
     D   time                         6A
     D   milisec                      3A

    ‚ * ------------------------------------------------------------------
    ‚ * - Formatos de fecha: *YYMD, *MDYY, *DMYY, *LONGJUL               -
    ‚ * - en milisegundos                                                -
    ‚ * ------------------------------------------------------------------

     D DatTimFmt17byt_T...
     D                 DS                  Based( apityp_ )
     D                                     Qualified
     D   date                         8A
     D   time                         6A
     D   milisec                      3A

    ‚ * ------------------------------------------------------------------
    ‚ * - Formatos de fecha: *JOB, *SYSVAL, *YMD, *MDY, *DMY, *JUL       -
    ‚ * - en microsegundos                                               -
    ‚ * ------------------------------------------------------------------

     D DatTimFmt19byt_T...
     D                 DS                  Based( apityp_ )
     D                                     Qualified
     D   century                      1A
     D   date                         6A
     D   time                         6A
     D   microsec                     6A

    ‚ * ------------------------------------------------------------------
    ‚ * - Formatos de fecha: *YYMD, *MDYY, *DMYY, *LONGJUL               -
    ‚ * - en microsegundos                                               -
    ‚ * ------------------------------------------------------------------

     D DatTimFmt20byt_T...
     D                 DS                  Based( apityp_ )
     D                                     Qualified
     D   date                         8A
     D   time                         6A
     D   microsec                     6A

    ‚D*  ¡Se mantienen por compatibilidad!
     D TypeDatTimFmt16byt...
     D                 DS                  LikeDs( DatTimFmt16byt_T )
     D                                     Based( apityp_ )
     D TypeDatTimFmt17byt...
     D                 DS                  LikeDs( DatTimFmt17byt_T )
     D                                     Based( apityp_ )
     D TypeDatTimFmt19byt...
     D                 DS                  LikeDs( DatTimFmt19byt_T )
     D                                     Based( apityp_ )
     D TypeDatTimFmt20byt...
     D                 DS                  LikeDs( DatTimFmt20byt_T )
     D                                     Based( apityp_ )


    ‚ * ==================================================================
    ‚ * = DECLARACIÓN DE FUNCIONES Y PROCEDIMIENTOS PUBLICOS             =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - CvtDatTimFmt - Convertir formato de fecha y hora               -
    ‚ * -                Convert Date and Time Format (QWCCVTDT)         -
    ‚ * ------------------------------------------------------------------

     D CvtDatTimFmt    PR                  ExtPgm( 'QWCCVTDT' )
     D   InFmt                             Const Like( TypeName )
     D   InDate                            Const Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   OutFmt                            Const Like( TypeName )
     D   OutDate                                 Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   ApiError                                LikeDs( TypeApiError )
    ‚D* Grupo Opcional 1:
     D   InTimZon                          Const Like( TypeName )
     D                                           Options( *NOPASS )
     D   OutTimZon                         Const Like( TypeName )
     D                                           Options( *NOPASS )
     D   TimZonInf                               Like( TypeBuffer )
     D                                           Options( *VARSIZE
     D                                                  : *NOPASS  )
     D   LenTimZonInf                      Const Like( TypeInt )
     D                                           Options( *NOPASS )
     D   PrecisionInd                      Const Like( TypeLgl )
     D                                           Options( *NOPASS )
    ‚D* Grupo Opcional 2:
     D   InTimInd                          Const Like( TypeLgl )
     D                                           Options( *NOPASS )
