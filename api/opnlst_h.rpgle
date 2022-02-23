      /If Defined( OPNLST_H )
      /Eof
      /Endif
      /Define OPNLST_H

    ‚ *
    ‚ *  NOMBRE.......: OPNLST_H
    ‚ *  DESCRIPCION..: Declaración de prototipos de las APIs para el
    ‚ *                 manejo de los datos devueltos por listas abiertas
    ‚ *                 (Open List APIs)
    ‚ *
    ‚ *  Programador..: Javier Mora
    ‚ *  Fecha........: 22.08.2007
    ‚ *
    ‚ *  Historia:
    ‚ *
    ‚ *   Fecha   Programador        Observaciones
    ‚ *  -------- ------------------ -------------
    ‚ *  21.09.09 Javier Mora        Revisión de estilo.
    ‚ *
    ‚ *  Usar como:
    ‚ *
    ‚ *    /Copy API,OpnLst_H
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

     D OpnLstHdl_T     S              4A   Based( apiTyp_ )

    ‚ * ------------------------------------------------------------------
    ‚ * - Información de la lista abierta                                -
    ‚ * ------------------------------------------------------------------
    ‚ * - totRcds        Número total de registros disponibles en la     -
    ‚ * -                lista.                                          -
    ‚ * - rcdNbrRtn      Número de registros devueltos en la variable    -
    ‚ * -                receptora. Es el menor de los siguientes        -
    ‚ * -                valores:                                        -
    ‚ * -                   - Número de registros que caben en la        -
    ‚ * -                     variable receptora                         -
    ‚ * -                   - Número de registros en la lista            -
    ‚ * -                   - Número de registros que fueron solicitados -
    ‚ * - handle         Descriptor de la petición que puede utilizarse  -
    ‚ * -                para las siguientes solicitudes de información  -
    ‚ * -                de la lista.                                    -
    ‚ * -                El descriptor es válido hasta que se cierra la  -
    ‚ * -                lista o cuando termine el trabajo.              -
    ‚ * - rcdLen         La longitud de cada registro de información     -
    ‚ * -                devuelto. Para registros de longitud variable   -
    ‚ * -                se pone a 0, esta información deberá obtenerse  -
    ‚ * -                desde los mismos registros.                     -
    ‚ * - infCompInd     Indicador de información completa:              -
    ‚ * -                   I = Información incompleta.                  -
    ‚ * -                   P = Información parcial y precisa.           -
    ‚ * -                   C = Información completa y precisa.          -
    ‚ * - dts            Fecha y hora de cuando se creó la lista.        -
    ‚ * - lstSts         Estado de la lista construida:                  -
    ‚ * -                   0 = Está pendiente la construccion de la     -
    ‚ * -                       lista.                                   -
    ‚ * -                   1 = La lista está en fase de construcción.   -
    ‚ * -                   2 = La lista se ha construido completamente. -
    ‚ * -                   3 = Ocurrió un error cuando el sistema       -
    ‚ * -                       intentó construir la lista.              -
    ‚ * - infLen         Tamaño en bytes la información devuelta en la   -
    ‚ * -                variable receptora.                             -
    ‚ * - firstRcd       Número del primer registro en la variable       -
    ‚ * -                receptora.                                      -
    ‚ * - autCode        Código de razón de autorización:                -
    ‚ * -                   0000 = La lista está completa.               -
    ‚ * -                   0001 = La lista está incompleta debido a     -
    ‚ * -                          problemas de autorizaciones.          -
    ‚ * ------------------------------------------------------------------

     D OpnLstInf_T     DS                  Based( apiTyp_ )
     D                                     Qualified
     D   totRcds                     10I 0 Overlay( OpnLstInf_T:  1 )
     D   rcdNbrRtn                   10I 0 Overlay( OpnLstInf_T:  5 )
     D   handle                       4A   Overlay( OpnLstInf_T:  9 )
     D   rcdLen                      10I 0 Overlay( OpnLstInf_T: 13 )
     D   infCompInd                   1A   Overlay( OpnLstInf_T: 17 )
     D   dts                         13A   Overlay( OpnLstInf_T: 18 )
     D   lstSts                       1A   Overlay( OpnLstInf_T: 31 )
     D                                1A
     D   infLen                      10I 0 Overlay( OpnLstInf_T: 33 )
     D   firstRcd                    10I 0 Overlay( OpnLstInf_T: 37 )
    ‚D*
     D   autCode                     10I 0 Overlay( OpnLstInf_T: 41 )
     D                               36A

    ‚D*  ¡OBSOLETOS! Se mantienen por compatibilidad (2009-09-21)
     D TypeOpnLstHdl   S                   Based( apiTyp_ )
     D                                     Like( OpnLstHdl_T )
     D TypeOpnLstInf   DS                  Based( apiTyp_ )
     D                                     LikeDs( OpnLstInf_T )

    ‚ * ==================================================================
    ‚ * = DECLARACIÓN DE FUNCIONES Y PROCEDIMIENTOS PUBLICOS             =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - GetLstEnt - Obtener entradas de una lista                      -
    ‚ * -                                                                -
    ‚ * - Get List Entries (QGYGTLE)                                     -
    ‚ * ------------------------------------------------------------------

     D GetLstEnt       PR                  ExtPgm( 'QGYGTLE' )
     D  rcvVar                                    Like( TypeBuffer )
     D                                            Options( *VARSIZE )
     D  rcvVarLen                          Const Like( TypeInt )
     D  handle                             Const Like( OpnLstHdl_T )
     D  lstInf                                   Like( OpnLstInf_T )
     D  nbrRcdRtn                          Const Like( TypeInt )
     D  strRcdNbr                          Const Like( TypeInt )
     D  error                                    Like( TypeApiError )
     D                                           Options( *VARSIZE )

    ‚ * ------------------------------------------------------------------
    ‚ * - CloLst - Cerrar lista                                          -
    ‚ * -                                                                -
    ‚ * - Close List (QGYCLST)                                           -
    ‚ * ------------------------------------------------------------------

     D CloLst          PR                  ExtPgm( 'QGYCLST' )
     D  handle                             Const Like( OpnLstHdl_T )
     D  error                                    Like( TypeApiError )
     D                                           Options( *VARSIZE )
