      /If Defined( BACKUP_H )
      /Eof
      /Endif
      /Define BACKUP_H

    ‚ *
    ‚ *  NOMBRE.......: BACKUP_H
    ‚ *  DESCRIPCION..: Declaración de prototipos y tipos de las APIs
    ‚ *                 relacionadas con la salvaguardia y recuperación
    ‚ *                 del sistema (Backup and Recovery APIs).
    ‚ *
    ‚ *  Programador..: Javier Mora
    ‚ *  Fecha........: 04.05.2007
    ‚ *
    ‚ *  Historia:
    ‚ *
    ‚ *   Fecha   Programador        Observaciones
    ‚ *  -------- ------------------ -------------
    ‚ *  17.09.09 Javier Mora        Revisión de estilo.
    ‚ *                              Pierde compatibilidad con v.2
    ‚ *
    ‚ *  Usar como:
    ‚ *
    ‚ *    /Copy API,Backup_H
    ‚ *
    ‚ *  Notas:
    ‚ *

    ‚ * ==================================================================
    ‚ * = OTROS FICHEROS DE CABECERA                                     =
    ‚ * ==================================================================

      /Copy Api,StdTyp_H
      /Copy Api,OpnLst_H

    ‚ * ==================================================================
    ‚ * = DEFINICIÓN DE TIPOS                                            =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - Información de la lista abierta con QEZOLBKL                   -
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

     D BACKUP_listInf_T...
     D                 DS                  Based( ApiTyp_ )
     D                                     Qualified
     D   totRcds                     10I 0 Overlay( BACKUP_listInf_T:  1 )
     D   rcdNbrRtn                   10I 0 Overlay( BACKUP_listInf_T:  5 )
     D   handle                       4A   Overlay( BACKUP_listInf_T:  9 )
     D   rcdLen                      10I 0 Overlay( BACKUP_listInf_T: 13 )
     D   infCompInd                   1A   Overlay( BACKUP_listInf_T: 17 )
     D   dts                         13A   Overlay( BACKUP_listInf_T: 18 )
     D   lstSts                       1A   Overlay( BACKUP_listInf_T: 31 )
     D                                1A
     D   infLen                      10I 0 Overlay( BACKUP_listInf_T: 33 )
     D   firstRcd                    10I 0 Overlay( BACKUP_listInf_T: 37 )
    ‚D*
     D   autCode                     10I 0 Overlay( BACKUP_listInf_T: 41 )
     D                               36A

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato OBKL0100 con información básica sobre bibliotecas      -
    ‚ * ------------------------------------------------------------------
    ‚ * - bkpOpt         Opción para la copia de seguridad.              -
    ‚ * - libName        Nombre de la biblioteca.                        -
    ‚ * ------------------------------------------------------------------

     D OBKL0100_T      DS                  Based( StdTyp_ )
     D                                     Qualified
     D   bkpOpt                      10A
     D   libName                     10A
     D                                2A

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato OBKL0200 con información básica sobre carpetas         -
    ‚ * ------------------------------------------------------------------
    ‚ * - bkpOpt         Opción para la copia de seguridad.              -
    ‚ * - fldName        Nombre de la carpeta.                           -
    ‚ * ------------------------------------------------------------------

     D OBKL0200_T      DS                  Based( StdTyp_ )
     D                                     Qualified
     D   bkpOpt                      10A
     D   fldName                     12A

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato OBKL0600 con información completa                      -
    ‚ * ------------------------------------------------------------------
    ‚ * - buffer         Los primeros 22 bytes corresponden a los        -
    ‚ * -                formatos OBKL0100 o OBKL0200.                   -
    ‚ * - lastBkpDat     Última fecha de la copia de seguridad.          -
    ‚ * - lastBkpTim     Última hora de la copia de seguridad.           -
    ‚ * - objText        Texto descriptivo del objeto.                   -
    ‚ * - chgLastBkp     Si ha habido algún cambio sobre el objeto desde -
    ‚ * -                la última copia de seguridad.                   -
    ‚ * ------------------------------------------------------------------

     D OBKL0600_T      DS                  Based( StdTyp_ )
     D                                     Qualified
     D   lastBkpDat                   7A   Overlay( OBKL0600_T: 23 )
     D   lastBkpTim                   6A   Overlay( OBKL0600_T: 30 )
     D   objText                     50A   Overlay( OBKL0600_T: 36 )
     D   chgLastBkp                   1A   Overlay( OBKL0600_T: 86 )
     D                               21A


    ‚ * ==================================================================
    ‚ * = DECLARACIÓN DE FUNCIONES Y PROCEDIMIENTOS PUBLICOS             =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - OpnLstObjBkp - Abrir lista de objetos para salvar en la copia  -
    ‚ * -                de seguridad                                    -
    ‚ * -                                                                -
    ‚ * - Open List of Objects to be Backed Up (QEZOLBKL)                -
    ‚ * ------------------------------------------------------------------

     D OpnLstObjBkp    PR                  ExtPgm( 'QEZOLBKL' )
     D   rcvVar                                 Like( TypeBuffer )
     D                                          Options( *VARSIZE )
     D   rcvVarLen                         Const Like( TypeInt )
     D   lstInf                                  Like( TypeOpnLstInf )
     D   nbrRcdRtn                         Const Like( TypeInt )
     D   format                            Const Like( TypeApiFormat )
     D   objType                           Const Like( TypeName )
     D   typeBkp                           Const Like( TypeName )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )
