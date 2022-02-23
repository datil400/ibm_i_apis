      /If Defined( OPNLST_H )
      /Eof
      /Endif
      /Define OPNLST_H

    � *
    � *  NOMBRE.......: OPNLST_H
    � *  DESCRIPCION..: Declaraci�n de prototipos de las APIs para el
    � *                 manejo de los datos devueltos por listas abiertas
    � *                 (Open List APIs)
    � *
    � *  Programador..: Javier Mora
    � *  Fecha........: 22.08.2007
    � *
    � *  Historia:
    � *
    � *   Fecha   Programador        Observaciones
    � *  -------- ------------------ -------------
    � *  21.09.09 Javier Mora        Revisi�n de estilo.
    � *
    � *  Usar como:
    � *
    � *    /Copy API,OpnLst_H
    � *
    � *  Notas:
    � *

    � * ==================================================================
    � * = OTROS FICHEROS DE CABECERA                                     =
    � * ==================================================================

      /Copy Api,StdTyp_H

    � * ==================================================================
    � * = DEFINICI�N DE TIPOS                                            =
    � * ==================================================================

     D OpnLstHdl_T     S              4A   Based( apiTyp_ )

    � * ------------------------------------------------------------------
    � * - Informaci�n de la lista abierta                                -
    � * ------------------------------------------------------------------
    � * - totRcds        N�mero total de registros disponibles en la     -
    � * -                lista.                                          -
    � * - rcdNbrRtn      N�mero de registros devueltos en la variable    -
    � * -                receptora. Es el menor de los siguientes        -
    � * -                valores:                                        -
    � * -                   - N�mero de registros que caben en la        -
    � * -                     variable receptora                         -
    � * -                   - N�mero de registros en la lista            -
    � * -                   - N�mero de registros que fueron solicitados -
    � * - handle         Descriptor de la petici�n que puede utilizarse  -
    � * -                para las siguientes solicitudes de informaci�n  -
    � * -                de la lista.                                    -
    � * -                El descriptor es v�lido hasta que se cierra la  -
    � * -                lista o cuando termine el trabajo.              -
    � * - rcdLen         La longitud de cada registro de informaci�n     -
    � * -                devuelto. Para registros de longitud variable   -
    � * -                se pone a 0, esta informaci�n deber� obtenerse  -
    � * -                desde los mismos registros.                     -
    � * - infCompInd     Indicador de informaci�n completa:              -
    � * -                   I = Informaci�n incompleta.                  -
    � * -                   P = Informaci�n parcial y precisa.           -
    � * -                   C = Informaci�n completa y precisa.          -
    � * - dts            Fecha y hora de cuando se cre� la lista.        -
    � * - lstSts         Estado de la lista construida:                  -
    � * -                   0 = Est� pendiente la construccion de la     -
    � * -                       lista.                                   -
    � * -                   1 = La lista est� en fase de construcci�n.   -
    � * -                   2 = La lista se ha construido completamente. -
    � * -                   3 = Ocurri� un error cuando el sistema       -
    � * -                       intent� construir la lista.              -
    � * - infLen         Tama�o en bytes la informaci�n devuelta en la   -
    � * -                variable receptora.                             -
    � * - firstRcd       N�mero del primer registro en la variable       -
    � * -                receptora.                                      -
    � * - autCode        C�digo de raz�n de autorizaci�n:                -
    � * -                   0000 = La lista est� completa.               -
    � * -                   0001 = La lista est� incompleta debido a     -
    � * -                          problemas de autorizaciones.          -
    � * ------------------------------------------------------------------

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
    �D*
     D   autCode                     10I 0 Overlay( OpnLstInf_T: 41 )
     D                               36A

    �D*  �OBSOLETOS! Se mantienen por compatibilidad (2009-09-21)
     D TypeOpnLstHdl   S                   Based( apiTyp_ )
     D                                     Like( OpnLstHdl_T )
     D TypeOpnLstInf   DS                  Based( apiTyp_ )
     D                                     LikeDs( OpnLstInf_T )

    � * ==================================================================
    � * = DECLARACI�N DE FUNCIONES Y PROCEDIMIENTOS PUBLICOS             =
    � * ==================================================================

    � * ------------------------------------------------------------------
    � * - GetLstEnt - Obtener entradas de una lista                      -
    � * -                                                                -
    � * - Get List Entries (QGYGTLE)                                     -
    � * ------------------------------------------------------------------

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

    � * ------------------------------------------------------------------
    � * - CloLst - Cerrar lista                                          -
    � * -                                                                -
    � * - Close List (QGYCLST)                                           -
    � * ------------------------------------------------------------------

     D CloLst          PR                  ExtPgm( 'QGYCLST' )
     D  handle                             Const Like( OpnLstHdl_T )
     D  error                                    Like( TypeApiError )
     D                                           Options( *VARSIZE )
