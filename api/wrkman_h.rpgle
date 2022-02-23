      /IF DEFINED( WRKMAN_H )
      /EOF
      /ENDIF
      /DEFINE WRKMAN_H

    ‚ *
    ‚ *  NOMBRE.......: WRKMAN_H
    ‚ *  DESCRIPCION..: Declaración de los tipos y prototipos para las
    ‚ *                 APIs de gestión de trabajos (Work Management).
    ‚ *
    ‚ *  Programador..: Javier Mora
    ‚ *  Fecha........: 27.07.2007
    ‚ *
    ‚ *  Historia:
    ‚ *
    ‚ *   Fecha   Programador        Observaciones
    ‚ *  -------- ------------------ -------------
    ‚ *  30.07.07 Javier Mora        Incluir API QUSRJOBI y estructuras de
    ‚ *                              de datos.
    ‚ *  27.11.07 Javier Mora        Incluir APIs QWTSETPX y QWTRTVPX.
    ‚ *  10.12.07 Javier Mora        Incluir API QWCLOBJL - List Object Locks
    ‚ *  21.02.08 Javier Mora        Incluir API QWCRNETA - Retrieve Net Attrib
    ‚ *  03.03.08 Javier Mora        Corregir prototipo SetPrfExitPgm.
    ‚ *  18.06.08 Javier Mora        Incluir API QWCRJBLK - Retrieve Job Locks
    ‚ *                              y las estructuras relacionadas.
    ‚ *  05.11.08 Javier Mora        Incluir API QWCCCJOB - Change Current Job
    ‚ *  11.09.09 Javier Mora        Revisión de estilo.
    ‚ *  08.03.12 Javier Mora        Incluir API QWDRSBSD.
    ‚ *  03.09.12 Javier Mora        Incluir formato JOBI0100.
    ‚ *  Ago 2013 Javier Mora        Pila de llamadas.
    ‚ *  Oct 2014 Javier Mora        Estado del sistema (QWCRSSTS).
    ‚ *  13.12.16 Javier Mora        Recuperar Valor del Sistema (QWCRSVAL).
    ‚ *
    ‚ *  Usar como:
    ‚ *
    ‚ *    /Copy API,WrkMan_H
    ‚ *
    ‚ *  Notas :
    ‚ *  -------
    ‚ *

    ‚ * ==================================================================
    ‚ * = OTROS FICHEROS DE CABECERA                                     =
    ‚ * ==================================================================

      /COPY API,StdTyp_H

    ‚ * ==================================================================
    ‚ * = DEFINICIÓN DE TIPOS                                            =
    ‚ * ==================================================================

    ‚D*  Continuation Handle.
     D WRKMAN_contHdl_T...
     D                 S             16A   Based( apityp_ )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato JIDF0100 con la información de identificación del      -
    ‚ * - trabajo o hebra. Se utiliza en varias APIs:                    -
    ‚ * -   - "Retrieve Job Locks" (QWCRJBLK)                            -
    ‚ * -   - "Retrieve Call Stack" (QWVRCSTK)                           -
    ‚ * ------------------------------------------------------------------
    ‚ * - jobNam         Nombre del trabajo.                             -
    ‚ * - jobUsr         Usuario del trabajo.                            -
    ‚ * - jobNbr         Número del trabajo.                             -
    ‚ * - intJobId       Identificador interno del trabajo.              -
    ‚ * - thrInd         Indicador de la hebra.                          -
    ‚ * - thrId          Identificador de la hebra.                      -
    ‚ * ------------------------------------------------------------------

     D JIDF0100_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   jobNam                      10A   Overlay( JIDF0100_T:  1 )
     D   jobUsr                      10A   Overlay( JIDF0100_T: 11 )
     D   jobNbr                       6A   Overlay( JIDF0100_T: 21 )
     D   intJobId                    16A   Overlay( JIDF0100_T: 27 )
     D                                2A
     D   thrInd                      10I 0 Overlay( JIDF0100_T: 45 )
     D   thrId                        8A   Overlay( JIDF0100_T: 49 )

    ‚ * ------------------------------------------------------------------
    ‚ * - ESTRUCTURAS DE DATOS RELACIONADAS CON TRABAJOS PLANIFICADOS    -
    ‚ * ------------------------------------------------------------------

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato SCDL0100 para la información devuelta por el API       -
    ‚ * - "List Job Schedule Entries" (QWCLSCDE)                         -
    ‚ * ------------------------------------------------------------------
    ‚ * - infSts         Información de estado.                          -
    ‚ * - jobName        Nombre del trabajo.                             -
    ‚ * - entNbr         Número de la entrada.                           -
    ‚ * - scdDate        Fecha planificada.                              -
    ‚ * - scdDays        Dias planificados.                              -
    ‚ * - scdTime        Hora planificada.                               -
    ‚ * - frequency      Frecuencia.                                     -
    ‚ * - relDayMonth    Dia relativo del mes.                           -
    ‚ * - rcyAction      Acción de recuperación.                         -
    ‚ * - nxtSbmDate     Próxima fecha de sometimiento.                  -
    ‚ * - status         Estado.                                         -
    ‚ * - jobqName       Nombre de la cola de trabajos.                  -
    ‚ * - jobqLibNam     Nombre de la biblioteca de la cola de trabajos. -
    ‚ * - scdUser        Usuario que ha planificado el trabajo.          -
    ‚ * - lastSbmDate    Última fecha de sometimiento.                   -
    ‚ * - lastSbmTime    Última hora de sometimiento.                    -
    ‚ * - text           Texto descrpitivo.                              -
    ‚ * - reserved       Espacio reservado.                              -
    ‚ * ------------------------------------------------------------------

     D SCDL0100_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   infSts                       1A   Overlay( SCDL0100_T:   1 )
     D   jobName                     10A   Overlay( SCDL0100_T:   2 )
     D   entNbr                      10A   Overlay( SCDL0100_T:  12 )
     D   scdDate                     10A   Overlay( SCDL0100_T:  22 )
     D   scdDays                     70A   Overlay( SCDL0100_T:  32 )
     D   scdTime                      6A   Overlay( SCDL0100_T: 102 )
     D   frequency                   10A   Overlay( SCDL0100_T: 108 )
     D   relDayMonth                 50A   Overlay( SCDL0100_T: 118 )
     D   rcyAction                   10A   Overlay( SCDL0100_T: 168 )
     D   nxtSbmDate                  10A   Overlay( SCDL0100_T: 178 )
     D   status                      10A   Overlay( SCDL0100_T: 188 )
     D   jobqName                    10A   Overlay( SCDL0100_T: 198 )
     D   jobqLibNam                  10A   Overlay( SCDL0100_T: 208 )
     D   scdUser                     10A   Overlay( SCDL0100_T: 218 )
     D   lastSbmDate                 10A   Overlay( SCDL0100_T: 228 )
     D   lastSbmTime                  6A   Overlay( SCDL0100_T: 238 )
     D   text                        50A   Overlay( SCDL0100_T: 244 )
     D   reserved                    23A   Overlay( SCDL0100_T: 294 )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato SCDL0200 para la información devuelta por el API       -
    ‚ * - "List Job Schedule Entries" (QWCLSCDE)                         -
    ‚ * ------------------------------------------------------------------
    ‚ * - buffer         Los primeros 316 bytes corresponden a la DS     -
    ‚ * -                SCDL0100.                                       -
    ‚ * - jobqSts        Estado de la cola de trabajos.                  -
    ‚ * - datesOmited    Fechas omitidas.                                -
    ‚ * - jobdName       Nombre de la descripción del trabajo.           -
    ‚ * - jobdLibNam     Biblioteca de la descripción del trabajo.       -
    ‚ * - usrPrf         Perfil de usuario para el trabajo sometido.     -
    ‚ * - msgqName       Nombre de la cola de mensajes.                  -
    ‚ * - msgqLibNam     Biblioteca de la cola de mensajes.              -
    ‚ * - save           Entrada salvada.                                -
    ‚ * - lstSbmJobNam   Nombre del último trabajo sometido.             -
    ‚ * - lstSbmUsrNam   Nombre de usuario del último trabajo sometido.  -
    ‚ * - lstSbmJobNbr   Número del último trabajo sometido.             -
    ‚ * - lstAttSbmDat   Fecha del último sometimiento intentado.        -
    ‚ * - lstAttSbmDat   Hora del último sometimiento intentado.         -
    ‚ * - stsLstAttSbm   Estado del último sometimiento intentado.       -
    ‚ * - reserved       Espacio reservado.                              -
    ‚ * - lenCmdStr      Longitud de la cadena del mandato.              -
    ‚ * - cmdStr         Mandato.                                        -
    ‚ * ------------------------------------------------------------------

     D SCDL0200_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   jobqSts                     10A   Overlay( SCDL0200_T: 317 )
     D   datesOmited                200A   Overlay( SCDL0200_T: 327 )
     D     datOmit                   10A   Dim( 20 )
     D                                     Overlay( datesOmited )
     D   jobdName                    10A   Overlay( SCDL0200_T: 527 )
     D   jobdLibNam                  10A   Overlay( SCDL0200_T: 537 )
     D   usrPrf                      10A   Overlay( SCDL0200_T: 547 )
     D   msgqName                    10A   Overlay( SCDL0200_T: 557 )
     D   msgqLibNam                  10A   Overlay( SCDL0200_T: 567 )
     D   save                        10A   Overlay( SCDL0200_T: 577 )
     D   lstSbmJobNam                10A   Overlay( SCDL0200_T: 587 )
     D   lstSbmUsrNam                10A   Overlay( SCDL0200_T: 597 )
     D   lstSbmJobNbr                 6A   Overlay( SCDL0200_T: 607 )
     D   lstAttSbmDat                10A   Overlay( SCDL0200_T: 613 )
     D   lstAttSbmTim                 6A   Overlay( SCDL0200_T: 623 )
     D   stsLstAttSbm                10A   Overlay( SCDL0200_T: 629 )
     D   reserved                     2A   Overlay( SCDL0200_T: 639 )
     D   lenCmdStr                   10I 0 Overlay( SCDL0200_T: 641 )
     D   cmdStr                     512A   Overlay( SCDL0200_T: 645 )

    ‚ * ------------------------------------------------------------------
    ‚ * - ESTRUCTURAS DE DATOS RELACIONADAS CON TRABAJOS                 -
    ‚ * ------------------------------------------------------------------

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato JOBI0100 para la información devuelta por el API       -
    ‚ * - "Retrieve Job Information" (QUSRJOBI)                          -
    ‚ * -                                                                -
    ‚ * - Devuelve información básica de rendimiento del trabajo.        -
    ‚ * - Es más rápido que los formatos JOBI0150 y JOBI0200 ya que no   -
    ‚ * - necesita acceder a muchos objetos y requiere menos paginación. -
    ‚ * - Este formato es válido para los trabajos activos y los que     -
    ‚ * - están en espera en las colas de trabajo. En este último caso   -
    ‚ * - se devuelven los datos en blanco o a ceros.                    -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytesRtn       Bytes devueltos.                                -
    ‚ * - bytesAvl       Bytes disponibles.                              -
    ‚ * - jobName        Nombre del trabajo.                             -
    ‚ * - usrName        Usuario del trabajo.                            -
    ‚ * - jobNbr         Número del trabajo.                             -
    ‚ * - intJobId       Identificador interno del trabajo.              -
    ‚ * - jobStatus      Estado del trabajo.                             -
    ‚ * - jobType        Tipo del trabajo.                               -
    ‚ * - jobSubtype     Subtipo del trabajo.                            -
    ‚ * - runPty         Prioridad de ejecución.                         -
    ‚ * - timeSlice      Porción de tiempo.                              -
    ‚ * - dftWait        Tiempo de espera por omisión.                   -
    ‚ * - purge          Elegible para eliminación.                      -
    ‚ * ------------------------------------------------------------------

     D JOBI0100_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   bytesRtn                    10I 0 Overlay( JOBI0100_T:   1 )
     D   bytesAvl                    10I 0 Overlay( JOBI0100_T:   5 )
     D   jobName                     10A   Overlay( JOBI0100_T:   9 )
     D   usrName                     10A   Overlay( JOBI0100_T:  19 )
     D   jobNbr                       6A   Overlay( JOBI0100_T:  29 )
     D   intJobId                    16A   Overlay( JOBI0100_T:  35 )
     D   jobStatus                   10A   Overlay( JOBI0100_T:  51 )
     D   jobType                      1A   Overlay( JOBI0100_T:  61 )
     D   jobSubtype                   1A   Overlay( JOBI0100_T:  62 )
     D                                2A   Overlay( JOBI0100_T:  63 )
     D   runPty                      10I 0 Overlay( JOBI0100_T:  65 )
     D   timeSlice                   10I 0 Overlay( JOBI0100_T:  69 )
     D   dftWait                     10I 0 Overlay( JOBI0100_T:  73 )
     D   purge                       10A   Overlay( JOBI0100_T:  77 )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato JOBI0600 para la información devuelta por el API       -
    ‚ * - "Retrieve Job Information" (QUSRJOBI)                          -
    ‚ * -                                                                -
    ‚ * - Devuelve información sobre el trabajo activo. Complementa la   -
    ‚ * - información del formtato JOBI0400. Recupera datos de varios    -
    ‚ * - objetos adicionales asociados con el trabajo, por lo tanto     -
    ‚ * - causa paginación adicional.                                    -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytesRtn       Bytes devueltos.                                -
    ‚ * - bytesAvl       Bytes disponibles.                              -
    ‚ * - jobName        Nombre del trabajo.                             -
    ‚ * - usrName        Usuario del trabajo.                            -
    ‚ * - jobNbr         Número del trabajo.                             -
    ‚ * - intJobId       Identificador interno del trabajo.              -
    ‚ * - jobStatus      Estado del trabajo.                             -
    ‚ * - jobType        Tipo del trabajo.                               -
    ‚ * - jobSubtype     Subtipo del trabajo.                            -
    ‚ * - jobSwitches    Conmutadores de trabajo.                        -
    ‚ * - endStatus      Estado final.                                   -
    ‚ * - sbsdName       Nombre de la descripción del subsistema.        -
    ‚ * - sbsdLib        Biblioteca del subsistema.                      -
    ‚ * - curUsrPrf      Pefil de usuario actual.                        -
    ‚ * - DBCScapable    ?                                               -
    ‚ * - exitKey        Tecla de salida.                                -
    ‚ * - cancelKey      Tecla de cancelación.                           -
    ‚ * - prodRtnCode    Código de retorno de producto.                  -
    ‚ * - usrRtnCode     Código de retorno de usuario.                   -
    ‚ * - pgmRtnCode     Código de retorno de programa.                  -
    ‚ * - specialEnv     Entorno especial.                               -
    ‚ * - deviceName     Nombre de dispositivo.                          -
    ‚ * - grpUsrName     Nombre del perfil de grupo.                     -
    ‚ * - supGrpPrfNam   Nombres de los perfiles de grupo adicionales.   -
    ‚ * - jobUsrIdent    ?                                               -
    ‚ * - jobUsrIdnSet   ?                                               -
    ‚ * - clientIpAddr   Dirección IP.                                   -
    ‚ * - offsTimZonInf  Desplazamiento a la información sobre la zona   -
    ‚ * -                horaria.                                        -
    ‚ * - lenTimZonInf   Longitud de la información sobre la zona        -
    ‚ * -                horaria.                                        -
    ‚ * - Char(*)        Información sobre la zona horaria.              -
    ‚ * ------------------------------------------------------------------

     D JOBI0600_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   bytesRtn                    10I 0 Overlay( JOBI0600_T:   1 )
     D   bytesAvl                    10I 0 Overlay( JOBI0600_T:   5 )
     D   jobName                     10A   Overlay( JOBI0600_T:   9 )
     D   usrName                     10A   Overlay( JOBI0600_T:  19 )
     D   jobNbr                       6A   Overlay( JOBI0600_T:  29 )
     D   intJobId                    16A   Overlay( JOBI0600_T:  35 )
     D   jobStatus                   10A   Overlay( JOBI0600_T:  51 )
     D   jobType                      1A   Overlay( JOBI0600_T:  61 )
     D   jobSubtype                   1A   Overlay( JOBI0600_T:  62 )
     D   jobSwitches                  8A   Overlay( JOBI0600_T:  63 )
     D   endStatus                    1A   Overlay( JOBI0600_T:  71 )
     D   sbsdName                    10A   Overlay( JOBI0600_T:  72 )
     D   sbsdLib                     10A   Overlay( JOBI0600_T:  82 )
     D   curUsrPrf                   10A   Overlay( JOBI0600_T:  92 )
     D   DBCScapable                  1A   Overlay( JOBI0600_T: 102 )
     D   exitKey                      1A   Overlay( JOBI0600_T: 103 )
     D   cancelKey                    1A   Overlay( JOBI0600_T: 104 )
     D   prodRtnCode                 10I 0 Overlay( JOBI0600_T: 105 )
     D   usrRtnCode                  10I 0 Overlay( JOBI0600_T: 109 )
     D   pgmRtnCode                  10I 0 Overlay( JOBI0600_T: 113 )
     D   specialEnv                  10A   Overlay( JOBI0600_T: 117 )
     D   deviceName                  10A   Overlay( JOBI0600_T: 127 )
     D   grpUsrName                  10A   Overlay( JOBI0600_T: 137 )
     D   supGrpPrfNam                10A   Dim( 15 )
     D                                     Overlay( JOBI0600_T: 147 )
     D   jobUsrIdent                 10A   Overlay( JOBI0600_T: 297 )
     D   jobUsrIdnSet                 1A   Overlay( JOBI0600_T: 307 )
     D   clientIpAddr                15A   Overlay( JOBI0600_T: 308 )
     D                                2A   Overlay( JOBI0600_T: 323 )
     D   offsTimZonInf...
     D                               10I 0 Overlay( JOBI0600_T: 325 )
     D   lenTimZonInf...
     D                               10I 0 Overlay( JOBI0600_T: 329 )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato para la información de zona horario incluida en la     -
    ‚ * - estructura JOBI0600 (ver anterior)                             -
    ‚ * ------------------------------------------------------------------
    ‚ * - descName       Nombre descriptivo.                             -
    ‚ * - daylightInd    Indicador de horaja de invierno/verano.         -
    ‚ * - curOffset      Franja horaria actual.                          -
    ‚ * - curFullName    Nombre completo de la zona horaria.             -
    ‚ * - curAbbvName    Nombre abreviado de la zona horaria.            -
    ‚ * - curMsgId       Identificador de mensaje de la zona horaria     -
    ‚ * -                actual.                                         -
    ‚ * - msgf           Nombre del fichero de mensajes.                 -
    ‚ * - msgfLib        Biblioteca del fichero de mensajes.             -
    ‚ * ------------------------------------------------------------------

     D JOBI0600_timZonInf_T...
     D                 DS                  Based( apityp_ )
     D                                     Qualified
     D   descName                    10A
     D                                1A
     D   daylightInd                  1A
     D   curOffset                   10I 0
     D   curFullName                 50A
     D   curAbbvName                 10A
     D   curMsgId                     7A
     D   msgf                        10A
     D   msgfLib                     10A

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato SBSI0100 para la información devuelta por el API       -
    ‚ * - "Retrieve Subsystem Information" (QWDRSBSD)                    -
    ‚ * -                                                                -
    ‚ * - Devuelve información básica sobre el subsistema.               -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytesRtn       Bytes devueltos.                                -
    ‚ * - bytesAvl       Bytes disponibles.                              -
    ‚ * - sbsName        Nombre de la descripción del subsistema.        -
    ‚ * - sbsLib         Nombre de la biblioteca del subsistema.         -
    ‚ * - sbsStatus      Estado del subsistema.                          -
    ‚ * - signOnDevFilNam                                                -
    ‚ * -                Nombre del archivo de pantalla de inicio de     -
    ‚ * -                sesión.                                         -
    ‚ * - signOnDevFilLib                                                -
    ‚ * -                Nombre de la biblioteca del archivo de pantalla -
    ‚ * -                de inicio de sesión.                            -
    ‚ * - secLangLibNam  Nombre de la biblioteca de idioma secundario.   -
    ‚ * - maxActJobs     Máximo de trabajos activos.                     -
    ‚ * - currActJobs    Número de trabajos activos actualmente.         -
    ‚ * - nbrStgPools    Número de agrupaciones de almacenamiento        -
    ‚ * -                definidos.                                      -
    ‚ * - Char(*)        Información sobre las agrupaciones de           -
    ‚ * -                almacenamiento.                                 -
    ‚ * ------------------------------------------------------------------

     D SBSI0100_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   bytesRtn                    10I 0 Overlay( SBSI0100_T:   1 )
     D   bytesAvl                    10I 0 Overlay( SBSI0100_T:   5 )
     D   sbsName                     10A   Overlay( SBSI0100_T:   9 )
     D   sbsLib                      10A   Overlay( SBSI0100_T:  19 )
     D   sbsStatus                   10A   Overlay( SBSI0100_T:  29 )
     D   signOnDevFilNam...
     D                               10A   Overlay( SBSI0100_T:  39 )
     D   signOnDevFilLib...
     D                               10A   Overlay( SBSI0100_T:  49 )
     D   secLangLibNam...
     D                               10A   Overlay( SBSI0100_T:  59 )
     D   maxActJobs                  10I 0 Overlay( SBSI0100_T:  69 )
     D   currActJobs                 10I 0 Overlay( SBSI0100_T:  73 )
     D   nbrStgPools                 10I 0 Overlay( SBSI0100_T:  77 )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato SBSI0100, información sobre las agrupaciones de        -
    ‚ * - almacenamiento definidos en un subsistema.                     -
    ‚ * ------------------------------------------------------------------
    ‚ * - poolId         Identificador de la agrupación.                 -
    ‚ * - poolName       Nombre de la agrupación.                        -
    ‚ * - poolSize       Tamaño de la agrupación.                        -
    ‚ * - poolActLvl     Nivel de actividad de la agrupación.            -
    ‚ * ------------------------------------------------------------------

     D SBSI0100_poolEnt_T...
     D                 DS                  Based( apityp_ )
     D                                     Qualified
     D   poolId                      10I 0
     D   poolName                    10A
     D                                6A
     D   poolSize                    10I 0
     D   poolActLvl                  10I 0

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato CSTK0100, información relacionada con la pila de       -
    ‚ * - llamadas de un trabajo o hilo.                                 -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytesRtn       Bytes devueltos.                                -
    ‚ * - bytesAvl       Bytes disponibles.                              -
    ‚ * - nbrStkEnt      Número de entradas en la pila de llamadas del   -
    ‚ * -                hilo.                                           -
    ‚ * - offsEntInf     Desplazamiento a la lista de entradas de la     -
    ‚ * -                pila de llamadas.                               -
    ‚ * - nbrEntRtn      Número de entradas de la pila devueltas.        -
    ‚ * - rtnThreadId    Identificador del hilo.                         -
    ‚ * - infSts         Estado de la información.                       -
    ‚ * -                                                                -
    ‚ * - PARTE VARIABLE DE LA ESTRUCTURA DE DATOS                       -
    ‚ * -                                                                -
    ‚ * - Char(*)        Espacio reservado.                              -
    ‚ * - Char(*)        Entradas de la pila de llamadas. Aparecen en    -
    ‚ * -                orden LIFO, la última llamada es la primera de  -
    ‚ * -                la lista.                                       -
    ‚ * -                Ver CSTK0100_stackEnt_T.                        -
    ‚ * ------------------------------------------------------------------

     D CSTK0100_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   bytesRtn                    10I 0 Overlay( CSTK0100_T:   1 )
     D   bytesAvl                    10I 0 Overlay( CSTK0100_T:   5 )
     D   nbrStkEnt                   10I 0 Overlay( CSTK0100_T:   9 )
     D   offsEntInf                  10I 0 Overlay( CSTK0100_T:  13 )
     D   nbrEntRtn                   10I 0 Overlay( CSTK0100_T:  17 )
     D   rtnThreadId                  8A   Overlay( CSTK0100_T:  21 )
     D   infSts                       1A   Overlay( CSTK0100_T:  29 )
    ‚D*
    ‚D* Desde aquí la parte variable...

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato CSTK0100 con la información de una entrada de la pila  -
    ‚ * - de llamadas.                                                   -
    ‚ * ------------------------------------------------------------------
    ‚ * - len            Longitud (en bytes) de esta entrada de la pila  -
    ‚ * -                de llamadas.                                    -
    ‚ * - stmtDisp       Desplazamiento en bytes a los números de        -
    ‚ * -                sentencia, contando desde el inicio de la       -
    ‚ * -                entrada de la pila.                             -
    ‚ * - stmtNbr        Número de indentificadores de sentencia.        -
    ‚ * - procDisp       Desplazamiento en bytes al nombre de procedi-   -
    ‚ * -                miento, contando desde el inicio de la entrada  -
    ‚ * -                de la pila.                                     -
    ‚ * - procLen        Longitud del nombre de procedimiento.           -
    ‚ * - rqsLvl         Nivel de petición.                              -
    ‚ * - pgmName        Nombre del programa.                            -
    ‚ * - pgmLib         Biblioteca del programa.                        -
    ‚ * - MIinst         Número de instrucción MI.                       -
    ‚ * - module         Nombre del módulo.                              -
    ‚ * - moduleLib      Biblioteca del módulo.                          -
    ‚ * - ctlBdy         Límite de control.                              -
    ‚ * - actGrpNbr      Número del grupo de activación.                 -
    ‚ * - actGrpNam      Nombre del grupo de activación.                 -
    ‚ * - pgmAspNam      Nombre del ASP del programa.                    -
    ‚ * - pgmAspLib      Nombre del ASP de la biblioteca del programa.   -
    ‚ * - pgmAspNbr      Número del ASP del programa.                    -
    ‚ * - pgmAspLibNbr   Número del ASP de la biblioteca del programa.   -
    ‚ * - actGrpNbrLong  Número largo del grupo de activación.           -
    ‚ * -                                                                -
    ‚ * - PARTE VARIABLE DE LA ESTRUCTURA DE DATOS                       -
    ‚ * -                                                                -
    ‚ * - Char(*)        Espacio reservado.                              -
    ‚ * - Char(*)        Identificadores de sentencia, CHAR(10) por cada -
    ‚ * -                uno.                                            -
    ‚ * - Char(*)        Nombre del procedimiento.                       -
    ‚ * ------------------------------------------------------------------

     D CSTK0100_stackEnt_T...
     D                 DS                  Based( apityp_ )
     D                                     Qualified
     D   len                         10I 0
     D   stmtDisp                    10I 0
     D   stmtNbr                     10I 0
     D   procDisp                    10I 0
     D   procLen                     10I 0
     D   rqsLvl                      10I 0
     D   pgmName                     10A
     D   pgmLib                      10A
     D   MIinst                      10I 0
     D   module                      10A
     D   moduleLib                   10A
     D   ctlBdy                       1A
     D                                3A
     D   actGrpNbr                   10U 0
     D   actGrpNam                   10A
     D                                2A
     D   pgmAspNam                   10A
     D   pgmAspLib                   10A
     D   pgmAspNbr                   10I 0
     D   pgmAspLibNbr                10I 0
     D   actGrpNbrLong...
     D                               20U 0
    ‚D* Desde aquí la parte variable...
    ‚D* Char(*)

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato CSTK0100 para el identificador de sentencia.           -
    ‚ * ------------------------------------------------------------------

     D CSTK0100_stackEnt_stmtId_T...
     D                 S             10A   Based( apityp_ )

    ‚ * ------------------------------------------------------------------
    ‚ * - ESTRUCTURAS DE DATOS RELACIONADAS CON BLOQUEOS DE OBJETOS      -
    ‚ * ------------------------------------------------------------------

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato OBJL0100 para la información devuelta por el API       -
    ‚ * - "List Object Locks" (QWCLOBJL)                                 -
    ‚ * ------------------------------------------------------------------
    ‚ * - jobName        Nombre del trabajo.                             -
    ‚ * - jobUsrNam      Nombre del usuario del trabajo.                 -
    ‚ * - jobNbr         Número del trabajo.                             -
    ‚ * - lckState       Estado del bloqueo.                             -
    ‚ * - lckSts         Situación del bloqueo.                          -
    ‚ * - lckType        Tipo del bloqueo.                               -
    ‚ * - share          1=Archivo compartido.                           -
    ‚ * -                0=No compartido o no aplicable.                 -
    ‚ * - lckScope       Ámbito del bloqueo.                             -
    ‚ * - threadId       Identificador de la hebra.                      -
    ‚ * ------------------------------------------------------------------

     D OBJL0100_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   jobName                     10A   Overlay( OBJL0100_T:   1 )
     D   jobUsrNam                   10A   Overlay( OBJL0100_T:  11 )
     D   jobNbr                       6A   Overlay( OBJL0100_T:  21 )
     D   lckState                    10A   Overlay( OBJL0100_T:  27 )
     D   lckSts                      10I 0 Overlay( OBJL0100_T:  37 )
     D   lckType                     10I 0 Overlay( OBJL0100_T:  41 )
     D   member                      10A   Overlay( OBJL0100_T:  45 )
     D   share                        1A   Overlay( OBJL0100_T:  55 )
     D   lckScope                     1A   Overlay( OBJL0100_T:  56 )
     D   threadID                     8A   Overlay( OBJL0100_T:  57 )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato JBLK0100 para la información devuelta por el API       -
    ‚ * - "Retrieve Job Locks" (QWCRJBLK)                                -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytRtn         Bytes devueltos.                                -
    ‚ * - bytAvl         Bytes disponibles.                              -
    ‚ * - nbrObjLckE     Número de entradas disponibles en la lista de   -
    ‚ * -                objetos bloqueados.                             -
    ‚ * - offsObjLck     Desplazamiento al espacio de memoria que ocupa  -
    ‚ * -                la lista de objetos bloqueados.                 -
    ‚ * - nbrLckObjEntRtn                                                -
    ‚ * -                Número de entradas de objetos bloqueados        -
    ‚ * -                devueltos en la lista.                          -
    ‚ * - lenLckObjEnt   Tamaño de la entrada de objetos bloqueados.     -
    ‚ * - Char(*)        Buffer para las entradas con información de     -
    ‚ * -                bloqueo.                                        -
    ‚ * ------------------------------------------------------------------

     D JBLK0100_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   bytRtn                      10I 0 Overlay( JBLK0100_T:  1 )
     D   bytAvl                      10I 0 Overlay( JBLK0100_T:  5 )
     D   nbrObjLckE                  10I 0 Overlay( JBLK0100_T:  9 )
     D   offsObjLck                  10i 0 Overlay( JBLK0100_T: 13 )
     D   nbrLckObjEntRtn...
     D                               10I 0 Overlay( JBLK0100_T: 17 )
     D   lenLckObjEnt                10I 0 Overlay( JBLK0100_T: 21 )
    ‚D* Char(*)

    ‚ * ------------------------------------------------------------------
    ‚ * - Estructura con la información de una entrada de la lista de    -
    ‚ * - objetos bloqueados para el formato JBLK0100.                   -
    ‚ * ------------------------------------------------------------------
    ‚ * - objNam         Nombre del objeto.                              -
    ‚ * - objLib         Biblioteca del objeto.                          -
    ‚ * - objTyp         Tipo del objeto.                                -
    ‚ * - extObjAtr      Atributos extendidos del objeto.                -
    ‚ * - lckStt         Condición del bloqueo:                          -
    ‚ * -                  *SHRRD  = compartido para lectura             -
    ‚ * -                  *SHRUPD = compartido para actualización       -
    ‚ * -                  *SHRNUP = compartido, no actualización        -
    ‚ * -                  *EXCLRD = exclusivo, se permite lectura       -
    ‚ * -                  *EXCL   = exclusivo, no se permite lectura    -
    ‚ * - lckSts         Estado del bloqueo.                             -
    ‚ * - mbrSts         Número de miembros bloqueados para un fichero   -
    ‚ * -                de base de datos.                               -
    ‚ * - lckCnt         Número de bloqueos idénticos en esta entidad.   -
    ‚ * - lckScp         Ámbito del bloqueo.                             -
    ‚ * - thrId          Identificador de la hebra.                      -
    ‚ * - thrHdl         Descriptor de la hebra.                         -
    ‚ * -                                                                -
    ‚ * - A PARTIR DE VERSIÓN V5R2                                       -
    ‚ * -                                                                -
    ‚ * - lckSpcId       Identificador del espacio de bloqueo ¿?         -
    ‚ * - objAspNam      Nombre de la ASP que contiene el objeto.        -
    ‚ * - objLibAspNam   Nombre de la ASP que contiene la biblioteca del -
    ‚ * -                objeto bloqueado.                               -
    ‚ * - objAspNbr      Identificador numérico de la ASP que contiene   -
    ‚ * -                el objeto.                                      -
    ‚ * - objLibAspNbr   Identificador numérico de la ASP que contiene   -
    ‚ * -                la biblioteca del objeto bloqueado.             -
    ‚ * ------------------------------------------------------------------

     D JBLK0100E_T     DS                  Based( apityp_ )
     D                                     Qualified
     D   objNam                      10A
     D   objLib                      10A
     D   objTyp                      10A
     D   extObjAtr                   10A
     D   lckStt                      10A
     D                                2A
     D   lckSts                      10I 0
     D   mbrLcks                     10I 0
     D   lckCnt                      10I 0
     D   lckScp                       1A
     D                                3A
     D   thrId                        8A
     D   thrHdl                      10U 0
      /If Defined( *V5R2M0 )
     D   lckSpcId                    20A
     D   objAspNam                   10A
     D   objLibAspNam                10A
     D   objAspNbr                   10I 0
     D   objLibAspNbr                10I 0
      /Endif

    ‚ * ------------------------------------------------------------------
    ‚ * - ESTRUCTURAS DE DATOS RELACIONADAS CON EL ESTADO DEL SISTEMA    -
    ‚ * ------------------------------------------------------------------

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato SSTS0100 con información básica sobre el estado del    -
    ‚ * - sistema (QWCRSSTS)                                             -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytAvl         Bytes disponibles.                              -
    ‚ * - bytRtn         Bytes devueltos.                                -
    ‚ * - curDatTim      Fecha y hora actual.                            -
    ‚ * - sysName        Nombre del sistema.                             -
    ‚ * - usrCurSignOn   Usuarios conectados actualmente.                -
    ‚ * - usrTmpSignOff  Usuarios desconectados temporalmente.           -
    ‚ * - usrSuspBySysReq                                                -
    ‚ * -                Usuarios suspendidos por una petición de sistema-
    ‚ * - usrSuspByGrpJob                                                -
    ‚ * -                Usuarios suspendidos por trabajos de grupo.     -
    ‚ * - usrSignOffOutWait                                              -
    ‚ * -                Usuarios que han finalizado sesión pero esperan -
    ‚ * -                salida impresa.                                 -
    ‚ * - bchWaitMsg     Trabajos por lotes que esperan respuesta a un   -
    ‚ * -                mensaje.                                        -
    ‚ * - bchRun         Trabajos por lotes que se están ejecutando.     -
    ‚ * - bchHldRun      Trabajos por lotes que se han retenido mientras -
    ‚ * -                se ejecutaban.                                  -
    ‚ * - bchEnd         Trabajos por lotes que están finalizando.       -
    ‚ * - bchWaitRunOrScd                                                -
    ‚ * -                Trabajos por lotes que están esperando a        -
    ‚ * -                ejecutarse o que están planificados.            -
    ‚ * - bchHldOnJobQ   Trabajos por lotes retenidos en una cola de     -
    ‚ * -                trabajos.                                       -
    ‚ * - bchHldJobq     Trabajos por lotes esperando en una cola de     -
    ‚ * -                trabajos retenida.                              -
    ‚ * - bchUnassignJobQ                                                -
    ‚ * -                Trabajos por lotes esperando en una cola de     -
    ‚ * -                trabajos que no está asignada.                  -
    ‚ * - bchEndOutWait  Trabajos por lotes que han finalizado pero      -
    ‚ * -                esperan salida impresa.                         -
    ‚ * ------------------------------------------------------------------

     D SSTS0100_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   bytAvl                      10I 0 Overlay( SSTS0100_T:  1 )
     D   bytRtn                      10I 0 Overlay( SSTS0100_T:  5 )
     D   curDatTim                    8A   Overlay( SSTS0100_T:  9 )
     D   sysName                      8A   Overlay( SSTS0100_T: 17 )
     D   usrCurSignOn                10I 0 Overlay( SSTS0100_T: 25 )
     D   usrTmpSignOff...
     D                               10I 0 Overlay( SSTS0100_T: 29 )
     D   usrSuspBySysReq...
     D                               10i 0 Overlay( SSTS0100_T: 33 )
     D   usrSuspByGrpJob...
     D                               10I 0 Overlay( SSTS0100_T: 37 )
     D   usrSignOffOutWait...
     D                               10I 0 Overlay( SSTS0100_T: 41 )
     D   bchWaitMsg                  10I 0 Overlay( SSTS0100_T: 45 )
     D   bchRun                      10I 0 Overlay( SSTS0100_T: 49 )
     D   bchHldRun                   10I 0 Overlay( SSTS0100_T: 53 )
     D   bchEnd                      10I 0 Overlay( SSTS0100_T: 57 )
     D   bchWaitRunOrScd...
     D                               10I 0 Overlay( SSTS0100_T: 61 )
     D   bchHldOnJobQ                10I 0 Overlay( SSTS0100_T: 65 )
     D   bchHldJobq                  10I 0 Overlay( SSTS0100_T: 69 )
     D   bchUnassignJobQ...
     D                               10I 0 Overlay( SSTS0100_T: 73 )
     D   bchEndOutWait...
     D                               10I 0 Overlay( SSTS0100_T: 77 )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato SSTS0200 con información sobre el estado de sistema    -
    ‚ * - relacionada con los discos (almacenamiento auxiliar)           -
    ‚ * - (QWCRSSTS)                                                     -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytAvl         Bytes disponibles.                              -
    ‚ * - bytRtn         Bytes devueltos.                                -
    ‚ * - curDatTim      Fecha y hora actual.                            -
    ‚ * - sysName        Nombre del sistema.                             -
    ‚ * - elapsedTime    Tiempo transcurrido.                            -
    ‚ * - restrictedStateFlag                                            -
    ‚ * -                Indica si el sistema está en estado restringido:-
    ‚ * -                0 = No, 1 = Si                                  -
    ‚ * - pctCpuUsed     Porcentaje utilizado de la unidad de proceso.   -
    ‚ * - jobsInSystem   Número total de trabajos en el sistema. Incluye -
    ‚ * -                trabajos de usuario y de sistema actualmente    -
    ‚ * -                activos, trabajos esperando en las colas para   -
    ‚ * -                ser procesados y los trabajos que han finalizado-
    ‚ * -                pero tienen pendientes anotaciones de trabajo o -
    ‚ * -                tienen archivos en spool pendientes de imprimir.-
    ‚ * - pctPermAddrs   El porcentaje del máximo de direcciones         -
    ‚ * -                posibles para objetos permanentes que se han    -
    ‚ * -                utlizado.                                       -
    ‚ * - pctTempAddrs   El porcentaje del máximo de direcciones         -
    ‚ * -                posibles para objetos temporales que se han     -
    ‚ * -                utlizado.                                       -
    ‚ * - sysAsp         El tamaño (Mb) de la ASP del sistema.           -
    ‚ * - pctSysAspUsed  El porcentaje utilizado de la ASP del sistema.  -
    ‚ * - totAuxStg      El tamaño (Mb) total del almacenamiento auxiliar-
    ‚ * -                del sistema.                                    -
    ‚ * - curUnprotStgUsed                                               -
    ‚ * -                El tamaño (Mb) actual del almacenamiento        -
    ‚ * -                auxiliar utilizado para objetos temporales.     -
    ‚ * - maxUnprotStgUsed                                               -
    ‚ * -                El tamaño (Mb) más grande de almacenamiento     -
    ‚ * -                auxiliar utilizado para objetos temporales desde-
    ‚ * -                la última IPL.                                  -
    ‚ * - pctDbCap       El porcentaje de capacidad de la base de datos  -
    ‚ * -                del procesador que se utilizó durante el tiempo -
    ‚ * -                transcurrido.                                   -
    ‚ * - mainStgSize    Tamaño (Kb) de la memoria principal.            -
    ‚ * - nbrOfPartitions                                                -
    ‚ * -                Número de particiones en el sistema.            -
    ‚ * - partitionId    Identificador de la partición donde se está     -
    ‚ * -                ejecutando la API.                              -
    ‚ * - curProcessingCapacity                                          -
    ‚ * -                !!                                              -
    ‚ * - processorSharingAttribute                                      -
    ‚ * - nbrOfCpus      Número de procesadores.                         -
    ‚ * - activeJobs     Trabajos activos en el sistema.                 -
    ‚ * - activeThreads  Hebras activas en el sistema.                   -
    ‚ * - maxJobs        Número máximo de trabajos que están permitidos  -
    ‚ * -                en el sistema. Se incluyen los activos, los que -
    ‚ * -                esperan en una cola de trabajos y los que han   -
    ‚ * -                finalizado con anotaciones pendientes y salida  -
    ‚ * -                en spool.                                       -
    ‚ * - pctTemp256MbSegmentsUsed                                       -
    ‚ * -                !!                                              -
    ‚ * - pctTemp4GbSegmentsUsed                                         -
    ‚ * -                !!                                              -
    ‚ * - pctPerm256MbSegmentsUsed                                       -
    ‚ * -                !!                                              -
    ‚ * - pctPerm4GbSegmentsUsed                                         -
    ‚ * -                !!                                              -
    ‚ * - pctCurInteractivePerformance                                   -
    ‚ * -                El porcentaje de rendimiento interactivo        -
    ‚ * -                asignado a esta partición lógica.               -
    ‚ * - pctUncappedCpuCapcityUsed                                      -
    ‚ * -                !!                                              -
    ‚ * - pctSharedProcessorPoolUsed                                     -
    ‚ * -                !!                                              -
    ‚ * - mainStgSize_long                                               -
    ‚ * -                Tamaño (Kb) de la memoria principal.            -
    ‚ * ------------------------------------------------------------------

     D SSTS0200_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   bytAvl                      10I 0 Overlay( SSTS0200_T:  1 )
     D   bytRtn                      10I 0 Overlay( SSTS0200_T:  5 )
     D   curDatTim                    8A   Overlay( SSTS0200_T:  9 )
     D   sysName                      8A   Overlay( SSTS0200_T: 17 )
     D   elapsedTime                  6A   Overlay( SSTS0200_T: 25 )
     D   restrictedStateFlag...
     D                                1A   Overlay( SSTS0200_T: 31 )
     D                                1A   Overlay( SSTS0200_T: 32 )
     D   pctCpuUsed                  10I 0 Overlay( SSTS0200_T: 33 )
     D   jobsInSystem                10I 0 Overlay( SSTS0200_T: 37 )
     D   pctPermAddrs                10I 0 Overlay( SSTS0200_T: 41 )
     D   pctTempAddrs                10I 0 Overlay( SSTS0200_T: 45 )
     D   sysAsp                      10I 0 Overlay( SSTS0200_T: 49 )
     D   pctSysAspUsed...
     D                               10I 0 Overlay( SSTS0200_T: 53 )
     D   totAuxStg                   10I 0 Overlay( SSTS0200_T: 57 )
     D   curUnprotStgUsed...
     D                               10I 0 Overlay( SSTS0200_T: 61 )
     D   maxUnprotStgUsed...
     D                               10I 0 Overlay( SSTS0200_T: 65 )
     D   pctDbCap                    10I 0 Overlay( SSTS0200_T: 69 )
     D   mainStgSize                 10I 0 Overlay( SSTS0200_T: 73 )
     D   nbrOfPartitions...
     D                               10I 0 Overlay( SSTS0200_T: 77 )
     D   partitionId                 10I 0 Overlay( SSTS0200_T: 81 )
     D                               10I 0 Overlay( SSTS0200_T: 85 )
     D   curProcessingCapacity...
     D                               10I 0 Overlay( SSTS0200_T: 89 )
     D   processorSharingAttribute...
     D                                1A   Overlay( SSTS0200_T: 93 )
     D                                3A   Overlay( SSTS0200_T: 94 )
     D   nbrOfCpus                   10I 0 Overlay( SSTS0200_T: 97 )
     D   activeJobs                  10I 0 Overlay( SSTS0200_T: 101 )
     D   activeThreads...
     D                               10I 0 Overlay( SSTS0200_T: 105 )
     D   maxJobs                     10I 0 Overlay( SSTS0200_T: 109 )
     D   pctTemp256MbSegmentsUsed...
     D                               10I 0 Overlay( SSTS0200_T: 113 )
     D   pctTemp4GbSegmentsUsed...
     D                               10I 0 Overlay( SSTS0200_T: 117 )
     D   pctPerm256MbSegmentsUsed...
     D                               10I 0 Overlay( SSTS0200_T: 121 )
     D   pctPerm4GbSegmentsUsed...
     D                               10I 0 Overlay( SSTS0200_T: 125 )
     D   pctCurInteractivePerformance...
     D                               10I 0 Overlay( SSTS0200_T: 129 )
     D   pctUncappedCpuCapcityUsed...
     D                               10I 0 Overlay( SSTS0200_T: 133 )
     D   pctSharedProcessorPoolUsed...
     D                               10I 0 Overlay( SSTS0200_T: 137 )
      /IF DEFINED(*V5R4)
     D   mainStgSize_long...
     D                               20U 0 Overlay( SSTS0200_T: 141 )
      /ENDIF

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato SSTS0300 con información sobre el estado de sistema    -
    ‚ * - relacionada con las agrupaciones de almacenamiento principal   -
    ‚ * - (QWCRSSTS)                                                     -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytAvl         Bytes disponibles.                              -
    ‚ * - bytRtn         Bytes devueltos.                                -
    ‚ * - curDatTim      Fecha y hora actual.                            -
    ‚ * - sysName        Nombre del sistema.                             -
    ‚ * - elapsedTime    Tiempo transcurrido.                            -
    ‚ * - nbrOfPools     Número de agrupaciones.                         -
    ‚ * - offsPoolInf    Desplazamiento al espacio de memoria que ocupa  -
    ‚ * -                la lista de agrupaciones.                       -
    ‚ * - poolEntLen     Longitud de la entrada con información de la    -
    ‚ * -                agrupacion.                                     -
    ‚ * -                                                                -
    ‚ * - PARTE VARIABLE DE LA ESTRUCTURA DE DATOS                       -
    ‚ * -                                                                -
    ‚ * - Char(*)        Espacio reservado.                              -
    ‚ * - Char(*)        Lista de las agrupaciones de memoria asignadas  -
    ‚ * -                por el sistema.                                 -
    ‚ * ------------------------------------------------------------------

     D SSTS0300_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   bytAvl                      10I 0 Overlay( SSTS0300_T:  1 )
     D   bytRtn                      10I 0 Overlay( SSTS0300_T:  5 )
     D   curDatTim                    8A   Overlay( SSTS0300_T:  9 )
     D   sysName                      8A   Overlay( SSTS0300_T: 17 )
     D   elapsedTime                  6A   Overlay( SSTS0300_T: 25 )
     D                                2A   Overlay( SSTS0300_T: 31 )
     D   nbrOfPools                  10I 0 Overlay( SSTS0300_T: 33 )
     D   offsPoolInf                 10I 0 Overlay( SSTS0300_T: 37 )
     D   poolEntLen                  10I 0 Overlay( SSTS0300_T: 41 )
    ‚D* Desde aquí la parte variable...
    ‚D* Char(*)

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato SSTS0300 con la información de una entrada de la lista -
    ‚ * - de agrupaciones de almacenamiento principal (QWCRSSTS)         -
    ‚ * ------------------------------------------------------------------
    ‚ * - sysPool        Identificador que le asigna el sistema a la     -
    ‚ * -                agrupación.                                     -
    ‚ * - size           Tamaño (en Kb) de la agrupación.                -
    ‚ * - reservedSize   Tamaño (en Kb) reservados para uso del sistema. -
    ‚ * - maxActive      Número máximo de hebras que pueden estar activas-
    ‚ * -                al mismo tiempo (nivel de actividad).           -
    ‚ * - dbFaults       La media de las faltas de página por segundo de -
    ‚ * -                la base de datos.                               -
    ‚ * - dbPages        La media de páginas por segundo de la base de   -
    ‚ * -                datos que se cargan en la agrupación.           -
    ‚ * - ndbFaults      La media de las faltas de página por segundo    -
    ‚ * -                que no son de base de datos.                    -
    ‚ * - ndbPages       La media de páginas por segundo que no son de   -
    ‚ * -                la base de datos que se cargan en la agrupación.-
    ‚ * - activeToWait   La media de transacciones por minuto de las     -
    ‚ * -                hebras que pasan de un estado 'activo' a otro   -
    ‚ * -                en 'espera'.                                    -
    ‚ * - waitToInel     La media de transacciones por minuto de las     -
    ‚ * -                hebras que pasan de un estado 'en espera' a     -
    ‚ * -                otro 'inelegible'.                              -
    ‚ * - activeToInel   La media de transacciones por minuto de las     -
    ‚ * -                hebras que pasan de un estado 'activo' a otro   -
    ‚ * -                'inelegible'.                                   -
    ‚ * - name           Nombre de la agrupación.                        -
    ‚ * - sbsName        Nombre del subsistema si es una agrupación      -
    ‚ * -                privada del subsistema.                         -
    ‚ * - sbsLib         Biblioteca del subsistema.                      -
    ‚ * - pagOption      Opción de paginación.                           -
    ‚ * ------------------------------------------------------------------

     D SSTS0300_poolEnt_T...
     D                 DS                  Based( apityp_ )
     D                                     Qualified
     D   sysPool                     10I 0
     D   size                        10I 0
     D   reservedSize                10I 0
     D   maxActive                   10I 0
     D   dbFaults                    10I 0
     D   dbPages                     10I 0
     D   ndbFaults                   10I 0
     D   ndbPages                    10I 0
     D   activeToWait                10I 0
     D   waitToInel                  10I 0
     D   activeToInel                10I 0
     D   name                        10A
     D   sbsName                     10A
     D   sbsLib                      10A
     D   pagOption                   10A

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato SSTS0400 con información más detallada sobre las       -
    ‚ * - agrupaciones de almacenamiento principal (QWCRSSTS)            -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytAvl         Bytes disponibles.                              -
    ‚ * - bytRtn         Bytes devueltos.                                -
    ‚ * - curDatTim      Fecha y hora actual.                            -
    ‚ * - sysName        Nombre del sistema.                             -
    ‚ * - elapsedTime    Tiempo transcurrido.                            -
    ‚ * - mainStgSize    Tamaño (Kb) del almacenamiento principal.       -
    ‚ * - minMchPoolSize Tamaño mínimo (Kb) de la agrupación de máquina. -
    ‚ * - minBasePoolSize                                                -
    ‚ * -                Tamaño mínimo (Kb) de la agrupación base        -
    ‚ * -                (valor del sistema QBASPOLL).                   -
    ‚ * - nbrOfPools     Número de agrupaciones.                         -
    ‚ * - offsPoolInf    Desplazamiento al espacio de memoria que ocupa  -
    ‚ * -                la lista de agrupaciones.                       -
    ‚ * - poolEntLen     Longitud de la entrada con información de la    -
    ‚ * -                agrupacion.                                     -
    ‚ * - mainStgSize_long                                               -
    ‚ * -                Tamaño mínimo (Kb) de la agrupación base        -
    ‚ * -                                                                -
    ‚ * - PARTE VARIABLE DE LA ESTRUCTURA DE DATOS                       -
    ‚ * -                                                                -
    ‚ * - Char(*)        Espacio reservado.                              -
    ‚ * - Char(*)        Lista de las agrupaciones de memoria asignadas  -
    ‚ * -                por el sistema.                                 -
    ‚ * ------------------------------------------------------------------

     D SSTS0400_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   bytAvl                      10I 0 Overlay( SSTS0400_T:  1 )
     D   bytRtn                      10I 0 Overlay( SSTS0400_T:  5 )
     D   curDatTim                    8A   Overlay( SSTS0400_T:  9 )
     D   sysName                      8A   Overlay( SSTS0400_T: 17 )
     D   elapsedTime                  6A   Overlay( SSTS0400_T: 25 )
     D                                2A   Overlay( SSTS0400_T: 31 )
     D   mainStgSize                 10I 0 Overlay( SSTS0400_T: 33 )
     D   minMchPoolSize...
     D                               10I 0 Overlay( SSTS0400_T: 37 )
     D   minBasePoolSize...
     D                               10I 0 Overlay( SSTS0400_T: 41 )
     D   nbrOfPools                  10I 0 Overlay( SSTS0400_T: 45 )
     D   offsPoolInf                 10I 0 Overlay( SSTS0400_T: 49 )
     D   poolEntLen                  10I 0 Overlay( SSTS0400_T: 53 )
      /IF DEFINED(*V5R4)
     D   mainStgSize_long...
     D                               10I 0 Overlay( SSTS0400_T: 57 )
      /ENDIF
    ‚D* Desde aquí la parte variable...
    ‚D* Char(*)

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato SSTS0400 con la información de una entrada de la lista -
    ‚ * - de agrupaciones de almacenamiento principal (QWCRSSTS)         -
    ‚ * ------------------------------------------------------------------
    ‚ * - sysPool        Identificador que le asigna el sistema a la     -
    ‚ * -                agrupación.                                     -
    ‚ * - size           Tamaño (en Kb) de la agrupación.                -
    ‚ * - reservedSize   Tamaño (en Kb) reservados para uso del sistema. -
    ‚ * - maxActive      Número máximo de hebras que pueden estar activas-
    ‚ * -                al mismo tiempo (nivel de actividad).           -
    ‚ * - dbFaults       La media de las faltas de página por segundo de -
    ‚ * -                la base de datos.                               -
    ‚ * - dbPages        La media de páginas por segundo de la base de   -
    ‚ * -                datos que se cargan en la agrupación.           -
    ‚ * - ndbFaults      La media de las faltas de página por segundo    -
    ‚ * -                que no son de base de datos.                    -
    ‚ * - ndbPages       La media de páginas por segundo que no son de   -
    ‚ * -                la base de datos que se cargan en la agrupación.-
    ‚ * - activeToWait   La media de transacciones por minuto de las     -
    ‚ * -                hebras que pasan de un estado 'activo' a otro   -
    ‚ * -                en 'espera'.                                    -
    ‚ * - waitToInel     La media de transacciones por minuto de las     -
    ‚ * -                hebras que pasan de un estado 'en espera' a     -
    ‚ * -                otro 'inelegible'.                              -
    ‚ * - activeToInel   La media de transacciones por minuto de las     -
    ‚ * -                hebras que pasan de un estado 'activo' a otro   -
    ‚ * -                'inelegible'.                                   -
    ‚ * - name           Nombre de la agrupación.                        -
    ‚ * - sbsName        Nombre del subsistema si es una agrupación      -
    ‚ * -                privada del subsistema.                         -
    ‚ * - sbsLib         Biblioteca del subsistema.                      -
    ‚ * - pagOption      Opción de paginación.                           -
    ‚ * - definedSize    Tamaño de la agrupación (Kb) como se ha         -
    ‚ * -                definido en las agrupaciones compartidas, en el -
    ‚ * -                subsistema o en el valor del sistema QMCHPOOL.  -
    ‚ * - curThreads     El número de hebras que usan actualmente el     -
    ‚ * -                nivel de actividad de la agrupación.            -
    ‚ * - curInelThreads El número de hebras inelegibles en el nivel de  -
    ‚ * -                actividad de la agrupación.                     -
    ‚ * - tuningPriority La prioridad de la agrupación utilizada por el  -
    ‚ * -                sistema cuando se realiza un ajuste automático  -
    ‚ * -                del rendimiento.                                -
    ‚ * - tuningMinPoolSizePct                                           -
    ‚ * -                Cantidad mínima (en porcentaje) del             -
    ‚ * -                almacenamiento principal que se asigna a la     -
    ‚ * -                agrupación. El valor se expresa en centésimas.  -
    ‚ * -                Un valor de 1234 se corresponde con un 12,34%.  -
    ‚ * - tuningMaxPoolSizePct                                           -
    ‚ * -                Cantidad máxima (en porcentaje) del             -
    ‚ * -                almacenamiento principal que se asigna a la     -
    ‚ * -                agrupación. El valor se expresa en centésimas.  -
    ‚ * -                Un valor de 1234 se corresponde con un 12,34%.  -
    ‚ * - tuningMinFaults                                                -
    ‚ * -                El número mínimo de faltas de página por        -
    ‚ * -                segundo (expresado en centésimas) que se usa    -
    ‚ * -                como directriz.                                 -
    ‚ * - tuningPerThreadFaults                                          -
    ‚ * -                El número de faltas de página por segundo (en   -
    ‚ * -                centésimas) correspondiente a cada hebra        -
    ‚ * -                activa que se ha de utilizar como directriz.    -
    ‚ * - tuningMaxFaults                                                -
    ‚ * -                El número máximo de faltas de página por        -
    ‚ * -                segundo (expresado en centésimas) que se usa    -
    ‚ * -                como directriz.                                 -
    ‚ * - description    Texto descriptivo de la agrupación.             -
    ‚ * - status         Estado de la agrupación: 0=Activo; 1=Inactivo.  -
    ‚ * - tuningMinActivityLevel                                         -
    ‚ * -                Es el valor mínimo del nivel de activad de la   -
    ‚ * -                agrupación que puede asignar el ajuste de       -
    ‚ * -                rendimeiento cuando el valor del sistema        -
    ‚ * -                QPFRADJ tiene un valor de 2 o 3.                -
    ‚ * ------------------------------------------------------------------

     D SSTS0400_poolEnt_T...
     D                 DS                  Based( apityp_ )
     D                                     Qualified
     D   sysPool                     10I 0
     D   size                        10I 0
     D   reservedSize                10I 0
     D   maxActive                   10I 0
     D   dbFaults                    10I 0
     D   dbPages                     10I 0
     D   ndbFaults                   10I 0
     D   ndbPages                    10I 0
     D   activeToWait                10I 0
     D   waitToInel                  10I 0
     D   activeToInel                10I 0
     D   name                        10A
     D   sbsName                     10A
     D   sbsLib                      10A
     D   pagOption                   10A
     D   definedSize                 10I 0
     D   curThreads                  10I 0
     D   curInelThreads...
     D                               10I 0
     D   tuningPriority...
     D                               10I 0
     D   tuningMinPoolSizePct...
     D                               10I 0
     D   tuningMaxPoolSizePct...
     D                               10I 0
     D   tuningMinFaults...
     D                               10I 0
     D   tuningPerThreadFaults...
     D                               10I 0
     D   tuningMaxFaults...
     D                               10I 0
     D   description                 50A
     D   status                       1A
     D                                1A
     D   tuningMinActivityLevel...
     D                               10I 0
    ‚D* Char(*) - Reservado

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato SSTS0500 con información sobre una lista de subsistemas-
    ‚ * - activos que están utilizando una agrupación de almacenamiento  -
    ‚ * - (QWCRSSTS)                                                     -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytAvl         Bytes disponibles.                              -
    ‚ * - bytRtn         Bytes devueltos.                                -
    ‚ * - curDatTim      Fecha y hora actual.                            -
    ‚ * - sysName        Nombre del sistema.                             -
    ‚ * - sysPool        Identificador que le asigna el sistema a la     -
    ‚ * -                agrupación.                                     -
    ‚ * - nbrOfSbsAvl    Número de subsistemas disponibles en la lista.  -
    ‚ * - nbrOfSbsRtn    Número de subsistemas devueltos en la lista.    -
    ‚ * - offsSbsInf     Desplazamiento al espacio de memoria que ocupa  -
    ‚ * -                la lista de subsistemas.                        -
    ‚ * - sbsEntLen      Longitud de cada entrada de la lista de         -
    ‚ * -                subsistemas.                                    -
    ‚ * - name           Nombre de la agrupación de almacenamiento.      -
    ‚ * -                                                                -
    ‚ * - PARTE VARIABLE DE LA ESTRUCTURA DE DATOS                       -
    ‚ * -                                                                -
    ‚ * - Char(*)        Espacio reservado.                              -
    ‚ * - Char(*)        Lista de los subsistema que están utilizando la -
    ‚ * -                agrupación de almacenamiento.                   -
    ‚ * ------------------------------------------------------------------

     D SSTS0500_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   bytAvl                      10I 0 Overlay( SSTS0500_T:  1 )
     D   bytRtn                      10I 0 Overlay( SSTS0500_T:  5 )
     D   curDatTim                    8A   Overlay( SSTS0500_T:  9 )
     D   sysName                      8A   Overlay( SSTS0500_T: 17 )
     D   sysPool                     10I 0 Overlay( SSTS0500_T: 25 )
     D   nbrOfSbsAvl                 10I 0 Overlay( SSTS0500_T: 29 )
     D   nbrOfSbsRtn                 10I 0 Overlay( SSTS0500_T: 33 )
     D   offsSbsInf                  10I 0 Overlay( SSTS0500_T: 37 )
     D   sbsEntLen                   10I 0 Overlay( SSTS0500_T: 41 )
     D   name                        10A   Overlay( SSTS0500_T: 45 )
    ‚D* Desde aquí la parte variable...
    ‚D* Char(*) - Reservado
    ‚D* Char(*) - Lista de subsistemas

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato SSTS0500 con la información de una entrada de la lista -
    ‚ * - de subsistema que utilizan una agrupación (QWCRSSTS)           -
    ‚ * ------------------------------------------------------------------
    ‚ * - name           Nombre del subsistema.                          -
    ‚ * - lib            Biblioteca del subsistema.                      -
    ‚ * ------------------------------------------------------------------

     D SSTS0500_sbsEnt_T...
     D                 DS                  Based( apityp_ )
     D                                     Qualified
     D   name                        10A
     D   lib                         10A
    ‚D* Char(*) - Reservado

      /IF DEFINED(*V6R1M0)
    ‚ * ------------------------------------------------------------------
    ‚ * - Formato SSTS0600 con información sobre la utilización de las   -
    ‚ * - agrupaciones de almacenamiento compartidas (QWCRSSTS)          -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytAvl         Bytes disponibles.                              -
    ‚ * - bytRtn         Bytes devueltos.                                -
    ‚ * - curDatTim      Fecha y hora actual.                            -
    ‚ * - sysName        Nombre del sistema.                             -
    ‚ * - sysPool        Identificador que le asigna el sistema a la     -
    ‚ * -                agrupación.                                     -
    ‚ * - nbrOfAlcAvl    Número de asignaciones de agrupación disponibles-
    ‚ * -                en la lista.                                    -
    ‚ * - nbrOfAlcRtn    Número de asignaciones de agrupación devueltas  -
    ‚ * -                en la lista.                                    -
    ‚ * - offsAlcInf     Desplazamiento al espacio de memoria que ocupa  -
    ‚ * -                la lista de asignaciones de agrupación.         -
    ‚ * - alcEntLen      Longitud de cada entrada de la lista de         -
    ‚ * -                asignaciones.                                   -
    ‚ * - name           Nombre de la agrupación de almacenamiento.      -
    ‚ * -                                                                -
    ‚ * - PARTE VARIABLE DE LA ESTRUCTURA DE DATOS                       -
    ‚ * -                                                                -
    ‚ * - Char(*)        Espacio reservado.                              -
    ‚ * - Char(*)        Lista de las asignaciones de la agrupación.     -
    ‚ * ------------------------------------------------------------------

     D SSTS0600_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   bytAvl                      10I 0 Overlay( SSTS0600_T:  1 )
     D   bytRtn                      10I 0 Overlay( SSTS0600_T:  5 )
     D   curDatTim                    8A   Overlay( SSTS0600_T:  9 )
     D   sysName                      8A   Overlay( SSTS0600_T: 17 )
     D   sysPool                     10I 0 Overlay( SSTS0600_T: 25 )
     D   nbrOfAlcAvl                 10I 0 Overlay( SSTS0600_T: 29 )
     D   nbrOfAlcRtn                 10I 0 Overlay( SSTS0600_T: 33 )
     D   offsAlcInf                  10I 0 Overlay( SSTS0600_T: 37 )
     D   alcEntLen                   10I 0 Overlay( SSTS0600_T: 41 )
     D   name                        10A   Overlay( SSTS0600_T: 45 )
    ‚D* Desde aquí la parte variable...
    ‚D* Char(*) - Reservado
    ‚D* Char(*) - Lista con las asignaciones de la agrupación

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato SSTS0600 con la información de una entrada de la lista -
    ‚ * - de asignaciones de agrupación (QWCRSSTS)                       -
    ‚ * ------------------------------------------------------------------
    ‚ * - id             Identificador de la asignación de agrupación.   -
    ‚ * ------------------------------------------------------------------

     D SSTS0600_alcEnt_T...
     D                 DS                  Based( apityp_ )
     D                                     Qualified
     D   id                          30A
    ‚D* Char(*) - Reservado
      /ENDIF

    ‚ * ------------------------------------------------------------------
    ‚ * - Información de selección de la agrupación de memeria en la     -
    ‚ * - llamada a la API QWCRSSTS                                      -
    ‚ * ------------------------------------------------------------------
    ‚ * - type           Es el tipo de las agrupaciones a incluir en la  -
    ‚ * -                lista:                                          -
    ‚ * -                *SHARED = Agrupaciones compartidas identificadas-
    ‚ * -                por el nombre de la agrupación.                 -
    ‚ * -                *SYSTEM = Agrupaciones compartidas identificadas-
    ‚ * -                por el número asignado por el sistema.          -
    ‚ * - shrPoolName    Utilizado cuando 'type' tenga el valor '*SHARED'-
    ‚ * -                Valores posibles son:                           -
    ‚ * -                *ALL, *MACHINE, *BASE, *INTERACT, *SPOOL y      -
    ‚ * -                *SHRPOOL1-60.                                   -
    ‚ * - sysPoolId      Utilizado cuando 'type' tenga el valor '*SYSTEM'-
    ‚ * -                Valores posibles son:                           -
    ‚ * -                -1 = Todas las agrupaciones activas.            -
    ‚ * -                1 a 64 = una agrupación concreta.               -
    ‚ * ------------------------------------------------------------------

     D PoolSltInf_T    DS                  Based( apityp_ )
     D                                     Qualified
     D   type                        10A
     D   shrPoolName                 10A
     D   sysPoolId                   10I 0

    ‚ * ------------------------------------------------------------------
    ‚ * - Información devuelta por la API QWCRSVAL con información de    -
    ‚ * - los valores del sistema                                        -
    ‚ * ------------------------------------------------------------------
    ‚ * - nbrOfSysValRtn Número de los valores del sistema devueltos.    -
    ‚ * -                                                                -
    ‚ * - PARTE VARIABLE DE LA ESTRUCTURA DE DATOS                       -
    ‚ * -                                                                -
    ‚ * - Array(*) de Binary(4)                                          -
    ‚ * -                Tabla con los desplazamientos a la información  -
    ‚ * -                de cada valor del sistema.                      -
    ‚ * - Char(*)        Tabla con la información de cada valor del      -
    ‚ * -                sistema.                                        -
    ‚ * ------------------------------------------------------------------

     D QWCRSVAL_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   nbrOfSysValRtn...
     D                               10I 0
    ‚D*  Array(*) de Binary(4)
    ‚D*    Serie con los desplazamientos a la información de cada
    ‚D*    valor del sistema.
    ‚D*  Char(*)
    ‚D*    Tabla con la información de cada valor del sistama.

    ‚ * ------------------------------------------------------------------
    ‚ * - Información devuelta por la API QWCRSVAL con información de    -
    ‚ * - los valores del sistema                                        -
    ‚ * ------------------------------------------------------------------
    ‚ * - sysVal         Valor del sistema.                              -
    ‚ * - type           Tipo del dato.                                  -
    ‚ * -                C = Char; B = Binario; *BLANK = no disponible   -
    ‚ * - status         Estado de la información.                       -
    ‚ * -                L = no disponible por bloqueo.                  -
    ‚ * -                *BLANK = información disponible.                -
    ‚ * - length         Longitud de los datos.                          -
    ‚ * -                                                                -
    ‚ * - PARTE VARIABLE DE LA ESTRUCTURA DE DATOS                       -
    ‚ * -                                                                -
    ‚ * - Char(*)        Información del valor del sistema.              -
    ‚ * ------------------------------------------------------------------

     D QWCRSVAL_info_T...
     D                 DS                  Based( apityp_ )
     D                                     Qualified
     D   sysVal                      10A
     D   type                         1A
     D   status                       1A
     D   length                      10I 0
    ‚D*  Char(*) - Los datos del valor de sistema

    ‚ * ==================================================================
    ‚ * = DECLARACIÓN DE FUNCIONES Y PROCEDIMIENTOS PUBLICOS             =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - APIs RELACIONADAS CON TRABAJOS PLANIFICADOS                    -
    ‚ * ------------------------------------------------------------------

    ‚ * ------------------------------------------------------------------
    ‚ * - LstJobScdE - Listar las entradas de los trabajos planificados  -
    ‚ * -                                                                -
    ‚ * - List Job Schedule Entries (QWCLSCDE)                           -
    ‚ * ------------------------------------------------------------------

     D LstJobScdE      Pr                  ExtPgm( 'QWCLSCDE' )
     D   usrSpc                            Const Like( TypeQualName )
     D   format                            Const Like( TypeApiFormat )
     D   entName                           Const Like( TypeName )
     D   contHdl                           Const Like( WRKMAN_contHdl_T )
     D   error                                   LikeDS( TypeAPIError )
     D                                           Options( *VARSIZE )

    ‚ * ------------------------------------------------------------------
    ‚ * - APIs RELACIONADAS CON TRABAJOS                                 -
    ‚ * ------------------------------------------------------------------

    ‚ * ------------------------------------------------------------------
    ‚ * - ChgCurJob - Cambiar trabajo actual                             -
    ‚ * -                                                                -
    ‚ * - Change Current Job (QWCCCJOB)                                  -
    ‚ * ------------------------------------------------------------------

     D ChgCurJob       Pr                  ExtPgm( 'QWCCCJOB' )
     D   jobinf                            Const Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )

    ‚ * ------------------------------------------------------------------
    ‚ * - RtvJobInf - Recuperar información del trabajo                  -
    ‚ * -                                                                -
    ‚ * - Retrieve Job Information (QUSRJOBI)                            -
    ‚ * ------------------------------------------------------------------

     D RtvJobInf       Pr                  ExtPgm( 'QUSRJOBI' )
     D   rcvVar                                  Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   rcvVarLen                         Const Like( TypeInt )
     D   fmtNam                            Const Like( TypeApiFormat )
     D   jobNamQ                           Const Like( TypeQualJobName )
     D   intJobId                          Const Like( TypeIntJobId )
    ‚D* Grupo opcional 1:
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE
     D                                                  : *NOPASS )
    ‚D* Grupo opcional 2:
     D   rstStc                            Const Like( TypeChar )
     D                                           Options( *NOPASS )

    ‚ * ------------------------------------------------------------------
    ‚ * - RtvJobLck - Recuperar los bloqueos de un trabajo.              -
    ‚ * -                                                                -
    ‚ * - Retrieve Job Locks (QWCRJBLK)                                  -
    ‚ * ------------------------------------------------------------------

     D RtvJobLck       PR                  ExtPgm( 'QWCRJBLK' )
     D  rcvVar                                   Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D  rcvVarLen                          Const Like( TypeInt )
     D  format                             Const Like( TypeApiFormat )
     D  jobId                              Const Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D  fmtJobId                           Const Like( TypeApiFormat )
     D  error                                    Like( TypeApiError )
     D                                           Options( *VARSIZE )
    ‚D* Grupo opcional 1:
     D  lckFilter                          Const Like( TypeBuffer )
     D                                           Options( *VARSIZE
     D                                                  : *NOPASS )
     D  fmtFilter                          Const Like( TypeApiFormat )
     D                                           Options( *NOPASS )

    ‚ * ------------------------------------------------------------------
    ‚ * - RtvSbsInf - Recuperar información de subsistema                -
    ‚ * -                                                                -
    ‚ * - Retrieve Subsystem Information (QWDRSBSD)                      -
    ‚ * ------------------------------------------------------------------

     D RtvSbsInf       Pr                  ExtPgm( 'QWDRSBSD' )
     D   rcvVar                                  Like( TypeBuffer2 )
     D                                           Options( *VARSIZE )
     D   rcvVarLen                         Const Like( TypeInt )
     D   fmtNam                            Const Like( TypeApiFormat )
     D   sbsNamQ                           Const Like( TypeBuffer2 )
     D                                           Options( *VARSIZE )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE
     D                                                  : *NOPASS )
    ‚D* Grupo opcional 1:
     D   nbrSbsNames                       Const Like( TypeInt )
     D                                           Options( *NOPASS )

    ‚ * ------------------------------------------------------------------
    ‚ * - RtvCallStk - Recuperar la pila de llamads                      -
    ‚ * -                                                                -
    ‚ * - Retrieve Call Stack (QWVRCSTK)                                 -
    ‚ * ------------------------------------------------------------------

     D RtvCallStk      PR                  Extpgm( 'QWVRCSTK' )
     D   rcvVar                                  Like( TypeBuffer2 )
     D                                           Options( *VARSIZE )
     D   rcvVarLen                         Const Like( TypeInt )
     D   format                            Const Like( TypeApiFormat )
     D   jobid                             Const Like( JIDF0100_T )
     D                                           Options( *VARSIZE )
     D   jobIdFmt                          Const Like( TypeApiFormat )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )

    ‚ * ------------------------------------------------------------------
    ‚ * - APIs RELACIONADAS CON BLOQUEOS DE OBJETOS                      -
    ‚ * ------------------------------------------------------------------

    ‚ * ------------------------------------------------------------------
    ‚ * - LstObjLck - Genera una lista con información de bloqueo sobre  -
    ‚ * -             un objeto específico o fichero de base de datos.   -
    ‚ * -                                                                -
    ‚ * - List Object Lock (QWCLOBJL)                                    -
    ‚ * ------------------------------------------------------------------

     D LstObjLck       PR                  ExtPgm( 'QWCLOBJL' )
     D   usrSpc                            Const Like( TypeQualName )
     D   format                            Const Like( TypeApiFormat )
     D   object                            Const Like( TypeQualName )
     D   objType                           Const Like( TypeName )
     D   member                            Const Like( TypeName )
     D   error                                   LikeDS( TypeAPIError )
     D                                           Options( *VARSIZE )
    ‚D* Grupo opcional 1:
     D   pathName                          Const Like( TypeBuffer )
     D                                           Options( *VARSIZE
     D                                                  : *NOPASS  )
     D   pathNamLen                        Const Like( TypeInt )
     D                                           Options( *NOPASS  )
    ‚D* Grupo opcional 2:
     D   ASPname                           Const Like( TypeName )
     D                                           Options( *NOPASS  )

    ‚ * ------------------------------------------------------------------
    ‚ * - APIs VARIAS                                                    -
    ‚ * ------------------------------------------------------------------

    ‚ * ------------------------------------------------------------------
    ‚ * - RtvNetAtr - Recuperar atributos de red                         -
    ‚ * -                                                                -
    ‚ * - Retrieve Network Attributes (QWCRNETA)                         -
    ‚ * ------------------------------------------------------------------

     D RtvNetAtr       PR                  ExtPgm( 'QWCRNETA' )
     D  rcvVar                                   Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D  rcvVarLen                          Const Like( TypeInt )
     D  nbrNetAtr                          Const Like( TypeInt )
     D  netAtr                             Const Like( TypeName )
     D                                           Dim( 256 )
     D                                           Options( *VARSIZE )
     D  error                                    Like( TypeApiError )
     D                                           Options( *VARSIZE )

    ‚ * ------------------------------------------------------------------
    ‚ * - RtvSysVal - Recuperar Valores del Sistema                      -
    ‚ * -                                                                -
    ‚ * - Retrieve System Values (QWCRSVAL)                              -
    ‚ * ------------------------------------------------------------------

     D RtvSysVal       PR                  ExtPgm( 'QWCRSVAL' )
     D   rcvVar                                  Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   rcvVarLen                         Const Like( TypeInt )
     D   nbrOfSysVals                      Const Like( TypeInt )
    ‚D*   Array de elementos de Char(10)
     D   sysValNames                       Const Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   error                                   LikeDs( ERRC0100_T )
     D                                           Options( *VARSIZE )

    ‚ * ------------------------------------------------------------------
    ‚ * - SetPrfExitPgm - Establece un perfil de programas de salida     -
    ‚ * -                 para un usuario                                -
    ‚ * -                                                                -
    ‚ * - Set Profile Exit Program (QWTSETPX)                            -
    ‚ * -                                                                -
    ‚ * -   Revisar los siguientes puntos de salida:                     -
    ‚ * -     QIBM_QWT_PREATTNPGMS                                       -
    ‚ * -     QIBM_QWT_SYSREQPGMS                                        -
    ‚ * ------------------------------------------------------------------

     D SetPrfExitPgm   PR                  ExtPgm( 'QWTSETPX' )
     D   nbrEnt                            Const Like( TypeInt )
    ‚D*   Array de elementos de enteros (Int)
     D   exitPgmFlags                      Const Like( TypeInt )
     D                                           Dim( 8 )
     D                                           Options( *VARSIZE )
     D   format                            Const Like( TypeApiFormat )
     D   userid                            Const Like( TypeName )
     D   error                                   LikeDS( TypeAPIError )
     D                                           Options( *VARSIZE )

    ‚ * ------------------------------------------------------------------
    ‚ * - RtvPrfExitPgm - Recupera un perfil de programas de salida      -
    ‚ * -                 designados para ser llamados para un usuario   -
    ‚ * -                 especificado                                   -
    ‚ * -                                                                -
    ‚ * - Retrieve Profile Exit Programs (QWTRTVPX)                      -
    ‚ * ------------------------------------------------------------------

     D RtvPrfExitPgm   PR                  ExtPgm( 'QWTRTVPX' )
     D   rcvVar                                  Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   rcvVarLen                         Const Like( TypeInt )
     D   nbrEnt                            Const Like( TypeInt )
     D   format                            Const Like( TypeApiFormat )
     D   userid                            Const Like( TypeName )
     D   error                                   LikeDS( TypeAPIError )
     D                                           Options( *VARSIZE )

    ‚ * ------------------------------------------------------------------
    ‚ * - RtvSysSts - Recuperar información que refleja el estado        -
    ‚ * -             actual del sistema                                 -
    ‚ * -                                                                -
    ‚ * - Retrieve System Status (QWCRSSTS)                              -
    ‚ * ------------------------------------------------------------------

     D RtvSysSts       PR                  ExtPgm( 'QWCRSSTS' )
     D   rcvVar                                  Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   rcvVarLen                         Const Like( TypeInt )
     D   format                            Const Like( TypeApiFormat )
     D   resset                            Const Like( TypeName )
     D   error                                   LikeDS( ERRC0100_T )
     D                                           Options( *VARSIZE )
    ‚D* Grupo opcional 1:
     D   poolSltInf                        Const Like( TypeBuffer )
     D                                           Options( *VARSIZE: *NOPASS )
     D   poolSltSiz                        Const Like( TypeInt )
     D                                           Options( *NOPASS )

