      /If Defined( DSM_H )
      /Eof
      /Endif
      /Define DSM_H

    ‚ *
    ‚ *  NOMBRE.......: DSM_H
    ‚ *  DESCRIPCION..: Declaración de los prototipos para las APIs
    ‚ *                 relacionadas con la "Dynamic Screen Manager" (DSM)
    ‚ *
    ‚ *  Programador..: Javier Mora
    ‚ *  Fecha........: 19.08.2008
    ‚ *
    ‚ *  Historia:
    ‚ *  ---------
    ‚ *   Fecha   Programador        Observaciones
    ‚ *  -------- ------------------ -------------
    ‚ *  18.09.09 Javier Mora        Revisión de estilo.
    ‚ *
    ‚ *  Usar como:
    ‚ *
    ‚ *    /Copy API,DSM_H
    ‚ *
    ‚ *  Notas:
    ‚ *

    ‚ * ==================================================================
    ‚ * = OTROS FICHEROS DE CABECERA                                     =
    ‚ * ==================================================================

      /Copy API,StdTyp_H

    ‚ * ==================================================================
    ‚ * = DEFINICIÓN DE TIPOS                                            =
    ‚ * ==================================================================

     D DSM_lowLvlEnvHdl_T...
     D                 S                   Like( TypeInt )
     D                                     Based( apityp_ )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato de la descripción del entorno de bajo nivel            -
    ‚ * ------------------------------------------------------------------

     D DSM_lowLvlEnv_T...
     D                 DS                  Based( DsmTyp_ )
     D                                     Qualified
     D  colorSup                      1A
     D  charCvs                       1A
     D  CDRAcvs                       1A
     D  DBCSsup                       1A
     D  coexist                       1A
     D  altHlpKeySup                  1A
     D  tgtDev                       10A
     D  dspFile                      20A
     D  inviteAct                     1A
     D  preventOvr                    1A

    ‚D*  ¡Se mantiene por compatibilidad!
     D DSM_lowLvlEnv   DS                  Based( apityp_ )
     D                                     LikeDs( DSM_lowLvlEnv_T )

    ‚ * ==================================================================
    ‚ * = DECLARACIÓN DE FUNCIONES Y PROCEDIMIENTOS PUBLICOS             =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - APIs DE CONSULTA Y MANIPULACIÓN DE LA PANTALLA                 -
    ‚ * -                                                                -
    ‚ * - Screen Manipulation and Query APIs                             -
    ‚ * ------------------------------------------------------------------

    ‚ * ------------------------------------------------------------------
    ‚ * - DSM_chgEnv - Cambiar el entorno de bajo nivel                  -
    ‚ * -                                                                -
    ‚ * - Change Low-Level Environment (QsnChgEnv)                       -
    ‚ * ------------------------------------------------------------------

     D DSM_chgEnv      PR            10I 0 ExtProc( 'QsnChgEnv' )
     D   llvEnvDsc                         Const Like( DSM_lowLvlEnv_T )
     D                                           Options( *VARSIZE )
     D   llvEnvDscLen                      Const Like( TypeInt )
    ‚D* Grupo Opcional 1:
     D   llvEnvHdl                         Const Like( DSM_lowLvlEnvHdl_T )
     D                                           Options( *OMIT )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE
     D                                                  : *OMIT )

    ‚ * ------------------------------------------------------------------
    ‚ * - DSM_rtvScrDim - Obtener las dimensiones de pantalla            -
    ‚ * -                                                                -
    ‚ * - Retrieve Screen Dimensions (QsnRtvScrDim)                      -
    ‚ * ------------------------------------------------------------------

     D DSM_rtvScrDim   PR            10I 0 Extproc( 'QsnRtvScrDim' )
     D   nbrRows                                 Like( TypeInt )
     D                                           Options( *OMIT )
     D   nbrCols                                 Like( TypeInt )
     D                                           Options( *OMIT )
     D   handle                                  Like( TypeInt )
     D                                           Options( *OMIT )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE
     D                                                  : *OMIT )

    ‚ * ------------------------------------------------------------------
    ‚ * - APIs DE CONSULTA Y MANIPULACIÓN DE BUFFERS                     -
    ‚ * -                                                                -
    ‚ * - Buffer Manipulation and Query APIs                             -
    ‚ * ------------------------------------------------------------------

    ‚ * ------------------------------------------------------------------
    ‚ * - DSM_crtInpBuf - Crear buffer de entrada                        -
    ‚ * -                                                                -
    ‚ * - Create Input Buffer (QsnCrtInpBuf)                             -
    ‚ * ------------------------------------------------------------------

     D DSM_crtInpBuf   PR            10I 0 ExtProc( 'QsnCrtInpBuf' )
     D   bufSize                           Const Like( TypeInt )
     D   incrAmount                        Const Like( TypeInt )
     D                                           Options( *OMIT )
     D   maxSize                           Const Like( TypeInt )
     D                                           Options( *OMIT )
     D   inpHandle                               Like( TypeInt )
     D                                           Options( *OMIT )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE
     D                                                  : *OMIT )

    ‚ * ------------------------------------------------------------------
    ‚ * - DSM_rtvDta - Recuperar el puntero al buffer de datos           -
    ‚ * -                                                                -
    ‚ * - Retrieve Pointer to Data in Input Buffer (QsnRtvDta)           -
    ‚ * ------------------------------------------------------------------

     D DSM_rtvDta      PR              *   ExtProc( 'QsnRtvDta' )
     D   inpHandle                         Const Like( TypeInt )
     D   inpDataPtr                              Like( TypePtr )
     D                                           Options( *OMIT )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE
     D                                                  : *OMIT )

    ‚ * ------------------------------------------------------------------
    ‚ * - DSM_dltBuf - Eliminar el buffer
    ‚ * -                                                                -
    ‚ * - Delete Buffer (QsnDltBuf)                                      -
    ‚ * ------------------------------------------------------------------

     D DSM_dltBuf      Pr            10I 0 ExtProc( 'QsnDltBuf' )
     D   bufHandle                         Const Like( TypeInt )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE
     D                                                  : *OMIT )

    ‚ * ------------------------------------------------------------------
    ‚ * - APIs PARA LA ENTRADA DE DATOS DESDE PANTALLA                   -
    ‚ * -                                                                -
    ‚ * - Screen Input APIs                                              -
    ‚ * ------------------------------------------------------------------

    ‚ * ------------------------------------------------------------------
    ‚ * - DSM_readScr - Leer pantalla                                    -
    ‚ * -                                                                -
    ‚ * - Read Screen (QsnReadScr)                                       -
    ‚ * ------------------------------------------------------------------

     D DSM_readScr     PR            10I 0 ExtProc( 'QsnReadScr' )
     D   bytesRead                               Like( TypeInt )
     D                                           Options( *OMIT )
     D   inpHandle                         Const Like( TypeInt )
     D                                           Options( *OMIT )
     D   cmdHandle                         Const Like( TypeInt )
     D                                           Options( *OMIT )
     D   envHandle                               Like( TypeInt )
     D                                           Options( *OMIT )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE
     D                                                  : *OMIT )

    ‚ * ------------------------------------------------------------------
    ‚ * - APIs PARA LA SALIDA DE DATOS DESDE PANTALLA                    -
    ‚ * -                                                                -
    ‚ * - Screen Output APIs                                             -
    ‚ * ------------------------------------------------------------------

    ‚ * ------------------------------------------------------------------
    ‚ * - DSM_beep - Emitir un pitido en pantalla                        -
    ‚ * -                                                                -
    ‚ * - Generate a Beep (QsnBeep)                                      -
    ‚ * ------------------------------------------------------------------

     D DSM_beep        PR            10I 0 ExtProc( 'QsnBeep' )
     D   cmdBufHdl                         Const Like( TypeInt )
     D                                           Options( *OMIT )
     D   llvEnvHdl                         Const Like( TypeInt )
     D                                           Options( *OMIT )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE
     D                                                  : *OMIT )
