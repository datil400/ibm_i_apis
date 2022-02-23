      /IF DEFINED( CONFIG_H )
      /EOF
      /ENDIF
      /DEFINE CONFIG_H

    ‚ *
    ‚ *  NOMBRE.......: CONFIG_H
    ‚ *  DESCRIPCION..: Declaración de los tipos y prototipos para las
    ‚ *                 APIs relacionadas con el estado de la configuración
    ‚ *                 del sistema.
    ‚ *
    ‚ *  Programador..: Javier Mora
    ‚ *  Fecha........: 27.01.2010
    ‚ *
    ‚ *  Historia:
    ‚ *
    ‚ *   Fecha   Programador        Observaciones
    ‚ *  -------- ------------------ -------------
    ‚ *  13.03.12 Javier Mora        Incluir Open List of ASPs (QYASPOL).
    ‚ *  27.09.12 Javier Mora        Ampliar YASP0200_T (V6R1).
    ‚ *  17.12.12 Javier Mora        Corregir OpnLstInf_T y TypeOpnLstInf
    ‚ *                              no definidos (v.3.2.1)
    ‚ *  Dic 2012 Javier Mora        Incluir YASP0100_T.
    ‚ *
    ‚ *  Usar como:
    ‚ *
    ‚ *    /Copy API,Config_H
    ‚ *
    ‚ *  Notas:
    ‚ *

    ‚ * ==================================================================
    ‚ * = OTROS FICHEROS DE CABECERA                                     =
    ‚ * ==================================================================

      /COPY Api,StdTyp_H
      /COPY Api,OpnLst_H

    ‚ * ==================================================================
    ‚ * = DEFINICIÓN DE CONSTANTES                                       =
    ‚ * ==================================================================

    ‚ * ==================================================================
    ‚ * = DEFINICIÓN DE TIPOS                                            =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato DEVD0100 con información básica sobre un dispositivo.  -
    ‚ * -                                                                -
    ‚ * - API Retrieve Device Description (QDCRDEVD)                     -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytesRtn       Bytes devueltos.                                -
    ‚ * - bytesAvl       Bytes disponibles.                              -
    ‚ * - datInfRtv      Fecha de cuando se recogió la información.      -
    ‚ * - timInfRtv      Hora de cuando se recogió la información.       -
    ‚ * - devName        Nombre del dispositivo.                         -
    ‚ * - devCategory    Categoría del dispositivo.                      -
    ‚ * - onlineIPL      En línea en IPL.                                -
    ‚ * - text           Texto descriptivo.                              -
    ‚ * ------------------------------------------------------------------

     D DEVD0100_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   bytesRtn                    10I 0 Overlay( DEVD0100_T:   1 )
     D   bytesAvl                    10I 0 Overlay( DEVD0100_T:   5 )
     D   datInfRtv                    7A   Overlay( DEVD0100_T:   9 )
     D   timInfRtv                    6A   Overlay( DEVD0100_T:  16 )
     D   devName                     10A   Overlay( DEVD0100_T:  22 )
     D   devCategory                 10A   Overlay( DEVD0100_T:  32 )
     D   onlineIPL                   10A   Overlay( DEVD0100_T:  42 )
     D   text                        50A   Overlay( DEVD0100_T:  52 )
     D                                3A

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato DEVD0600 con información sobre dispositivos de pantalla-
    ‚ * - (categoría *DSP)                                               -
    ‚ * -                                                                -
    ‚ * - API Retrieve Device Description (QDCRDEVD)                     -
    ‚ * ------------------------------------------------------------------
    ‚ * - DEVD0100       Las primeras 100 posiciones se corresponden con -
    ‚ * -                el formato DEVD0100.                            -
    ‚ * -                                                                -
    ‚ * - NOTA: en esta declaración no están incluidos todos los campos. -
    ‚ * -                                                                -
    ‚ * - devPort        Número de puerto del dispositivo.               -
    ‚ * - devClass       Clase del dispositivo.                          -
    ‚ * - devType        Tipo del dispositivo.                           -
    ‚ * - devModel       Modelo del dispositivo.                         -
    ‚ * - prtDev         Dispositivo de impresión.                       -
    ‚ * - rmtLocNam      Nombre de localización remota. ??               -
    ‚ * - lclLocNam      Nombre de localización local. ??                -
    ‚ * - rmtNetId       Indentificador de red remoto. ??                -
    ‚ * - outq           Cola de salida.                                 -
    ‚ * - outqLib        Biblioteca de la cola de salida.                -
    ‚ * - ipAddr         Dirección IP (xxx.xxx.xxx.xxx)                  -
    ‚ * - svrIpAddr      Dirección IP del servidor (xxx.xxx.xxx.xxx)     -
    ‚ * ------------------------------------------------------------------

     D DEVD0600_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   devPort                     10I 0 Overlay( DEVD0600_T: 133 )
     D   devClass                    10A   Overlay( DEVD0600_T: 165 )
     D   devType                     10A   Overlay( DEVD0600_T: 175 )
     D   devModel                    10A   Overlay( DEVD0600_T: 185 )
     D   prtDev                      10A   Overlay( DEVD0600_T: 245 )
     D   rmtLocNam                   10A   Overlay( DEVD0600_T: 255 )
     D   lclLocNam                   10A   Overlay( DEVD0600_T: 265 )
     D   rmtNetId                    10A   Overlay( DEVD0600_T: 275 )
     D   outq                        10A   Overlay( DEVD0600_T: 335 )
     D   outqLib                     10A   Overlay( DEVD0600_T: 345 )
     D   ipAddr                      15A   Overlay( DEVD0600_T: 878 )
     D   svrIpAddr                   15A   Overlay( DEVD0600_T: 958 )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato DEVD1100 con información sobre dispositivos de         -
    ‚ * - impresora (categoría *PRT).                                    -
    ‚ * -                                                                -
    ‚ * - API Retrieve Device Description (QDCRDEVD)                     -
    ‚ * ------------------------------------------------------------------
    ‚ * - DEVD0100       Las primeras 100 posiciones se corresponden con -
    ‚ * -                el formato DEVD0100.                            -
    ‚ * -                                                                -
    ‚ * - NOTA: en esta declaración no están incluidos todos los campos. -
    ‚ * -                                                                -
    ‚ * - devPort        Número de puerto del dispositivo.               -
    ‚ * - devClass       Clase del dispositivo.                          -
    ‚ * - devType        Tipo del dispositivo.                           -
    ‚ * - devModel       Modelo del dispositivo.                         -
    ‚ * - ipAddr         Dirección IP (xxx.xxx.xxx.xxx)                  -
    ‚ * - svrIpAddr      Dirección IP del servidor (xxx.xxx.xxx.xxx)     -
    ‚ * ------------------------------------------------------------------

     D DEVD1100_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   devPort                     10I 0 Overlay( DEVD1100_T: 149 )
     D   devClass                    10A   Overlay( DEVD1100_T: 153 )
     D   devType                     10A   Overlay( DEVD1100_T: 163 )
     D   devModel                    10A   Overlay( DEVD1100_T: 173 )
     D   ipAddr                      15A   Overlay( DEVD1100_T: 1405 )
     D   svrIpAddr                   15A   Overlay( DEVD1100_T: 1495 )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato DEVD1500 con información sobre dispositivos de cinta   -
    ‚ * - (categoría *TAP).                                              -
    ‚ * -                                                                -
    ‚ * - API Retrieve Device Description (QDCRDEVD)                     -
    ‚ * ------------------------------------------------------------------
    ‚ * - DEVD0100       Las primeras 100 posiciones se corresponden con -
    ‚ * -                el formato DEVD0100.                            -
    ‚ * -                                                                -
    ‚ * - NOTA: en esta declaración no están incluidos todos los campos. -
    ‚ * -                                                                -
    ‚ * - devType        Tipo del dispositivo.                           -
    ‚ * - devModel       Modelo del dispositivo.                         -
    ‚ * - rscName        Nombre de recurso.                              -
    ‚ * - msgq           Cola de mensajes.                               -
    ‚ * - msgqLib        Biblioteca de la cola de mensajes.              -
    ‚ * - assignVryOn    Asignar dispositivo al activar.                 -
    ‚ * - unloadVryOff   Descargar dispositivo al desactivar.            -
    ‚ * - jobNam         Nombre del trabajo asignado.                    -
    ‚ * - jobUsr         Usuario del trabajo asignado.                   -
    ‚ * - jobNbr         Número del trabajo asignado.                    -
    ‚ * ------------------------------------------------------------------

     D DEVD1500_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   devType                     10A   Overlay( DEVD1500_T: 109 )
     D   devModel                    10A   Overlay( DEVD1500_T: 119 )
     D   rscName                     10A   Overlay( DEVD1500_T: 129 )
     D   msgq                        10A   Overlay( DEVD1500_T: 139 )
     D   msgqLib                     10A   Overlay( DEVD1500_T: 149 )
     D   assignVryOn                 10A   Overlay( DEVD1500_T: 169 )
     D   unloadVryOff                10A   Overlay( DEVD1500_T: 179 )
     D   jobNam                      10A   Overlay( DEVD1500_T: 189 )
     D   jobUsr                      10A   Overlay( DEVD1500_T: 199 )
     D   jobNbr                       6A   Overlay( DEVD1500_T: 209 )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato DEVD1600 con información sobre dispositivos ópticos    -
    ‚ * - (categoría *OPT).                                              -
    ‚ * -                                                                -
    ‚ * - API Retrieve Device Description (QDCRDEVD)                     -
    ‚ * ------------------------------------------------------------------
    ‚ * - DEVD0100       Las primeras 100 posiciones se corresponden con -
    ‚ * -                el formato DEVD0100.                            -
    ‚ * - devType        Tipo del dispositivo.                           -
    ‚ * - devModel       Modelo del dispositivo.                         -
    ‚ * - rscName        Nombre de recurso.                              -
    ‚ * - msgq           Cola de mensajes.                               -
    ‚ * - msgqLib        Biblioteca de la cola de mensajes.              -
    ‚ * ------------------------------------------------------------------

     D DEVD1600_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   devType                     10A   Overlay( DEVD1600_T: 105 )
     D   devModel                    10A   Overlay( DEVD1600_T: 115 )
     D   rscName                     10A   Overlay( DEVD1600_T: 125 )
     D   msgq                        10A   Overlay( DEVD1600_T: 135 )
     D   msgqLib                     10A   Overlay( DEVD1600_T: 145 )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato CFGD0200 con información de la lista de descripciones  -
    ‚ * - de configuración.                                              -
    ‚ * -                                                                -
    ‚ * - API List Configuration Descriptions (QDCLCFGD)                 -
    ‚ * ------------------------------------------------------------------
    ‚ * - status         Estado actual (código numérico).                -
    ‚ * - cfgDescNam     Nombre de la descripción de configuración.      -
    ‚ * - category       Categoría.                                      -
    ‚ * - statusTxt      Estado actual (texto).                          -
    ‚ * - text           Texto descriptivo.                              -
    ‚ * - jobNam         Nombre del trabajo asignado.                    -
    ‚ * - jobUsr         Usuario del trabajo asignado.                   -
    ‚ * - jobNbr         Número del trabajo asignado.                    -
    ‚ * - passthruDev    Dispositivo paso a través.                      -
    ‚ * - apiFmt         Formato de la API.                              -
    ‚ * - cmdSuffix      ??                                              -
    ‚ * ------------------------------------------------------------------

     D CFGD0200_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   status                      10I 0 Overlay( CFGD0200_T:   1 )
     D   cfgDescNam                  10A   Overlay( CFGD0200_T:   5 )
     D   category                    10A   Overlay( CFGD0200_T:  15 )
     D   statusTxt                   20A   Overlay( CFGD0200_T:  25 )
     D   text                        50A   Overlay( CFGD0200_T:  45 )
     D   jobNam                      10A   Overlay( CFGD0200_T:  95 )
     d   jobUsr                      10A   Overlay( CFGD0200_T: 105 )
     d   jobNbr                       6A   Overlay( CFGD0200_T: 115 )
     D   passthruDev                 10A   Overlay( CFGD0200_T: 121 )
     D   apiFmt                       8A   Overlay( CFGD0200_T: 131 )
     D   cmdSuffix                    4A   Overlay( CFGD0200_T: 139 )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato YASP0100 con información sobre los ASPs configurados   -
    ‚ * - en el sistema.                                                 -
    ‚ * -                                                                -
    ‚ * - Open List of ASPs (QYASPOL)                                    -
    ‚ * ------------------------------------------------------------------
    ‚ * - aspNbr         Número de ASP.                                  -
    ‚ * - rscName        Nombre del recurso.                             -
    ‚ * - devdName       Nombre de la descripción de dispositivo.        -
    ‚ * - version        Versión.                                        -
    ‚ * - aspUsg         Utilización del ASP.                            -
    ‚ * - aspSts         Estado del ASP.                                 -
    ‚ * - dbName         Nombre de la base de datos.                     -
    ‚ * - primAspRscName Nombre del recurso para la ASP primaria.        -
    ‚ * ------------------------------------------------------------------

     D YASP0100_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   aspNbr                      10I 0 Overlay( YASP0100_T:   1 )
     D   rscName                     10A   Overlay( YASP0100_T:   5 )
     D   devdName                    10A   Overlay( YASP0100_T:  15 )
     D   version                     10I 0 Overlay( YASP0100_T:  25 )
     D   aspUsg                      10I 0 Overlay( YASP0100_T:  29 )
     D   aspSts                      10I 0 Overlay( YASP0100_T:  33 )
     D   dbName                      18A   Overlay( YASP0100_T:  37 )
      /IF DEFINED( *V5R4M0 )
     D   primAspRscName...
     D                               10A   Overlay( YASP0100_T:  55 )
      /ENDIF

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato YASP0200 con información básica de los atributos del   -
    ‚ * - ASP.                                                           -
    ‚ * -                                                                -
    ‚ * - Open List of ASPs (QYASPOL)                                    -
    ‚ * ------------------------------------------------------------------
    ‚ * - aspNbr         Número de ASP.                                  -
    ‚ * - nbrDskUnits    Número de unidades de disco.                    -
    ‚ * - aspCapTot      Capacidad total del ASP.                        -
    ‚ * - aspCapAvl      Capacidad total disponible del ASP.             -
    ‚ * - aspCapTotPtc   Capacidad total protegida del ASP.              -
    ‚ * - aspCapAvlPtc   Capacidad protegida disponible del ASP.         -
    ‚ * - aspCapTotUnp   Capacidad total desprotegida del ASP.           -
    ‚ * - aspCapAvlUnp   Capacidad disponible desprotegida del ASP.      -
    ‚ * - aspSysStg      Almacenamiento del sistema.                     -
    ‚ * - ovrFlwStg      Desbordamiento de almacenamiento.               -
    ‚ * - spcAlcErrLog   Espacio reservado de las anotaciones de error.  -
    ‚ * - spcAlcMchLog   Espacio reservado de las anotaciones de máquina.-
    ‚ * - spcAlcMchTrc   Espacio reservado del rastreo de máquina.       -
    ‚ * - spcAlcMsd      Espacio reservado para vuelcos de almacenamiento-
    ‚ * -                principal.                                      -
    ‚ * - spcAlcMic      Espacio reservado del microcódigo.              -
    ‚ * - stgThhPct      Porcentaje umbral de almacenamiento.            -
    ‚ * - aspTyp         Tipo de ASP.                                    -
    ‚ * - ovrFlwRcyRsl   Resultado de la recuperación de desbordamiento. -
    ‚ * - endImdCtl      Control finalización inmediata. ???             -
    ‚ * - cmpRcyPol      Política de recuperación de compresión. ???     -
    ‚ * - cmpDskUniAsp   Unidades de disco comprimidas en el ASP.        -
    ‚ * - balSts         Estado del balanceo.                            -
    ‚ * - balTyp         Tipo de balanceo.                               -
    ‚ * - balDatTim      Fecha y hora del balanceo. ???                  -
    ‚ * - balDtaMov      Datos movidos del balanceo. ???                 -
    ‚ * - balDtaRem      Datos pendientes del balanceo. ???              -
    ‚ * - trcDur         Duración del rastreo.                           -
    ‚ * - trcSts         Estado del rastero.                             -
    ‚ * - trcDatTim      Fecha y hora del rastero.                       -
    ‚ * - chgWrtToDisk   Cambios escritos a disco.                       -
    ‚ * - nbrMultCnnDskUnits                                             -
    ‚ * -                Número de múltiples unidades de disco de        -
    ‚ * -                conexión. ???                                   -
    ‚ * - geographicMirrorRole                                           -
    ‚ * -                Papel de la duplicación geográfica. ???         -
    ‚ * - geographicMirrorCopyState                                      -
    ‚ * -                Estado de la copia de duplicación geográfica. ??-
    ‚ * - geographicMirrorCopyDataState                                  -
    ‚ * -                Estado de la copia de datos de la duplicación   -
    ‚ * -                geográfica. ???                                 -
    ‚ * - geographicMirrorPerformanceMode                                -
    ‚ * -                Modo de rendimiento de la duplicación           -
    ‚ * -                geográfica. ???                                 -
    ‚ * - geographicMirrorResumePriority                                 -
    ‚ * -                Geographic mirror resume priority. ???          -
    ‚ * - geographicMirrorSuspendTimeout                                 -
    ‚ * -                Geographic mirror suspend timeout. ???          -
    ‚ * ------------------------------------------------------------------

     D YASP0200_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   aspNbr                      10I 0 Overlay( YASP0200_T:   1 )
     D   nbrDskUnits                 10I 0 Overlay( YASP0200_T:   5 )
     D   aspCapTot                   10I 0 Overlay( YASP0200_T:   9 )
     D   aspCapAvl                   10I 0 Overlay( YASP0200_T:  13 )
     D   aspCapTotPtc                10I 0 Overlay( YASP0200_T:  17 )
     D   aspCapAvlPtc                10I 0 Overlay( YASP0200_T:  21 )
     D   aspCapTotUnp                10I 0 Overlay( YASP0200_T:  25 )
     D   aspCapAvlUnp                10I 0 Overlay( YASP0200_T:  29 )
     D   aspSysStg                   10I 0 Overlay( YASP0200_T:  33 )
     D   ovrFlwStg                   10I 0 Overlay( YASP0200_T:  37 )
     D   spcAlcErrLog                10I 0 Overlay( YASP0200_T:  41 )
     D   spcAlcMchLog                10I 0 Overlay( YASP0200_T:  45 )
     D   spcAlcMchTrc                10I 0 Overlay( YASP0200_T:  49 )
     D   spcAlcMsd                   10I 0 Overlay( YASP0200_T:  53 )
     D   spcAlcMic                   10I 0 Overlay( YASP0200_T:  57 )
     D   stgThhPct                   10I 0 Overlay( YASP0200_T:  61 )
     D   aspTyp                       2A   Overlay( YASP0200_T:  65 )
     D   ovrFlwRcyRsl                 1A   Overlay( YASP0200_T:  67 )
     D   endImdCtl                    1A   Overlay( YASP0200_T:  68 )
     D   cmpRcyPol                    1A   Overlay( YASP0200_T:  69 )
     D   cmpDskUniAsp                 1A   Overlay( YASP0200_T:  70 )
     D   balSts                       1A   Overlay( YASP0200_T:  71 )
     D   balTyp                       1A   Overlay( YASP0200_T:  72 )
     D   balDatTim                   13A   Overlay( YASP0200_T:  73 )
     D                                3A
     D   balDtaMov                   10I 0 Overlay( YASP0200_T:  89 )
     D   balDtaRem                   10I 0 Overlay( YASP0200_T:  93 )
     D   trcDur                      10I 0 Overlay( YASP0200_T:  97 )
     D   trcSts                       1A   Overlay( YASP0200_T: 101 )
     D   trcDatTim                   13A   Overlay( YASP0200_T: 102 )
      /IF DEFINED( *V5R3M0 )
     D   chgWrtToDisk                 1A   Overlay( YASP0200_T: 115 )
     D                                1A
     D   nbrMultCnnDskUnits...
     D                               10I 0 Overlay( YASP0200_T: 117 )
     D   geographicMirrorRole...
     D                               10I 0 Overlay( YASP0200_T: 121 )
     D   geographicMirrorCopyState...
     D                               10I 0 Overlay( YASP0200_T: 125 )
     D   geographicMirrorCopyDataState...
     D                               10I 0 Overlay( YASP0200_T: 129 )
      /IF DEFINED( *V6R1M0 )
     D   geographicMirrorPerformanceMode...
     D                               10I 0 Overlay( YASP0200_T: 133 )
     D   geographicMirrorResumePriority...
     D                               10I 0 Overlay( YASP0200_T: 137 )
     D   geographicMirrorSuspendTimeout...
     D                               10I 0 Overlay( YASP0200_T: 141 )
      /ENDIF
      /ENDIF

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato YASP0300 con información sobre las unidades de disco   -
    ‚ * - asignadas al ASP.                                              -
    ‚ * -                                                                -
    ‚ * - Open List of ASPs (QYASPOL)                                    -
    ‚ * ------------------------------------------------------------------
    ‚ * - aspNbr         Número de ASP.                                  -
    ‚ * - dskTyp         Tipo del disco.                                 -
    ‚ * - dskMod         Modelo del disco.                               -
    ‚ * - dskSrlNbr      Número de serie del disco.                      -
    ‚ * - rscNam         Nombre de recurso.                              -
    ‚ * - dskUnitNbr     Número de unidad de disco.                      -
    ‚ * - dskCap         Capacidad del disco.                            -
    ‚ * - dskStgAvl      Almacenamiento disponible en el disco.          -
    ‚ * - dskStgSys      Almacenamiento reservado para el sistema.       -
    ‚ * - mirUnitPtc     Unidad protegida por duplicación.               -
    ‚ * - mirUnitRpt     Mirrored unit reported. ???                     -
    ‚ * - mirUnitSts     Estado de la unidad duplicada.                  -
    ‚ * - unitCtl        Unidad de control.                              -
    ‚ * - blkTfrToMs     Bloques transferidos al almacenamiento principal-
    ‚ * - blkTfrFrMs     Bloques transferidos desde el almacenamiento    -
    ‚ * -                principal.                                      -
    ‚ * - rqsTfrToMs     Peticiones de transferencia de datos para el    -
    ‚ * -                almacenamiento principal.                       -
    ‚ * - rqsTfrFrMs     Peticiones de transferencia de datos desde el   -
    ‚ * -                almacenamiento principal.                       -
    ‚ * - pmbTfrFrMs     Bloques permanentes transferidos desde el       -
    ‚ * -                almacenamiento principal.                       -
    ‚ * - rqsPdtFrMs     Peticiones para la transferencia de datos       -
    ‚ * -                permanentes desde el almacenamiento principal.  -
    ‚ * - samCnt         Recuento de ejemplo. ???                        -
    ‚ * - notBusyCnt     Recuento de no ocupado. ???                     -
    ‚ * - cmpSts         Estado de compresión.                           -
    ‚ * - dskPtcTyp      Tipo de protección del disco.                   -
    ‚ * - cmpUnit        Unidad comprimida.                              -
    ‚ * - stgAlcRttUnit  Storage allocation restricted unit. ???         -
    ‚ * - avlParitySetUnit                                               -
    ‚ * -                Disponibilidad de paridad. ???                  -
    ‚ * - multCnnUnit    Unidad de conexión múltiple.                    -
    ‚ * ------------------------------------------------------------------

     D YASP0300_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   aspNbr                      10I 0 Overlay( YASP0300_T:   1 )
     D   dskTyp                       4A   Overlay( YASP0300_T:   5 )
     D   dskMod                       4A   Overlay( YASP0300_T:   9 )
     D   dskSrlNbr                   10A   Overlay( YASP0300_T:  13 )
     D   rscNam                      10A   Overlay( YASP0300_T:  23 )
     D   dskUnitNbr                  10I 0 Overlay( YASP0300_T:  33 )
     D   dskCap                      10I 0 Overlay( YASP0300_T:  37 )
     D   dskStgAvl                   10I 0 Overlay( YASP0300_T:  41 )
     D   dskStgSys                   10I 0 Overlay( YASP0300_T:  45 )
     D   mirUnitPtc                   1A   Overlay( YASP0300_T:  49 )
     D   mirUnitRpt                   1A   Overlay( YASP0300_T:  50 )
     D   mirUnitSts                   1A   Overlay( YASP0300_T:  51 )
      /IF DEFINED( *V6R1M0 )
     D   RAIDtype                     1A   Overlay( YASP0300_T:  52 )
      /ELSE
     D                                1A   Overlay( YASP0300_T:  52 )
      /ENDIF
     D   unitCtl                     10I 0 Overlay( YASP0300_T:  53 )
     D   blkTfrToMs                  10I 0 Overlay( YASP0300_T:  57 )
     D   blkTfrFrMs                  10I 0 Overlay( YASP0300_T:  61 )
     D   rqsTfrToMs                  10I 0 Overlay( YASP0300_T:  65 )
     D   rqsTfrFrMs                  10I 0 Overlay( YASP0300_T:  69 )
     D   pmbTfrFrMs                  10I 0 Overlay( YASP0300_T:  73 )
     D   rqsPdtFrMs                  10I 0 Overlay( YASP0300_T:  77 )
     D   samCnt                      10I 0 Overlay( YASP0300_T:  81 )
     D   notBusyCnt                  10I 0 Overlay( YASP0300_T:  85 )
     D   cmpSts                       1A   Overlay( YASP0300_T:  89 )
     D   dskPtcTyp                    1A   Overlay( YASP0300_T:  90 )
      /IF DEFINED( *V5R3M0 )
     D   cmpUnit                      1A   Overlay( YASP0300_T:  91 )
     D   stgAlcRttUnit...
     D                                1A   Overlay( YASP0300_T:  92 )
     D   avlParitySetUnit...
     D                                1A   Overlay( YASP0300_T:  93 )
     D   multCnnUnit                  1A   Overlay( YASP0300_T:  94 )
      /ENDIF

    ‚ * ==================================================================
    ‚ * = DECLARACIÓN DE FUNCIONES Y PROCEDIMIENTOS PUBLICOS             =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - RtvDevDesc - Recuperar descripción de dispositivo              -
    ‚ * -                                                                -
    ‚ * - Retrieve Device Description (QDCRDEVD)                         -
    ‚ * ------------------------------------------------------------------

     D RtvDevDesc      PR                  ExtPgm( 'QDCRDEVD' )
     D   rcvVar                                  Like( TypeBuffer2 )
     D                                           Options( *VARSIZE )
     D   rcvVarLen                         Const Like( TypeInt )
     D   format                            Const Like( TypeApiFormat )
     D   device                            Const Like( TypeName )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )

    ‚ * ------------------------------------------------------------------
    ‚ * - LstCfgDesc - Listar descripciones de configuración             -
    ‚ * -                                                                -
    ‚ * - List Configuration Descriptions (QDCLCFGD)                     -
    ‚ * ------------------------------------------------------------------

     D LstCfgDesc      PR                  ExtPgm( 'QDCLCFGD' )
     D   usrSpc                            Const Like( TypeQualName )
     D   format                            Const Like( TypeApiFormat )
     D   cfgDescType                       Const Like( TypeName )
     D   objQualif                         Const Like( TypeName )
     D                                           Dim( 4 )
     D   statQualif                  20A   Const
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )

    ‚ * ------------------------------------------------------------------
    ‚ * - OpnLstAsps - Abrir lista de ASPs                               -
    ‚ * -                                                                -
    ‚ * - Open List of ASPs (QYASPOL)                                    -
    ‚ * ------------------------------------------------------------------

     D OpnLstAsps      PR                  ExtPgm( 'QYASPOL' )
     D   rcvvar                                  Like( TypeBuffer2 )
     D                                           Options( *VARSIZE )
     D   rcvVarLen                         Const Like( TypeInt )
     D   lstInf                                  Like( OpnLstInf_T )
     D   nbrRcdRtn                         Const Like( TypeInt )
     D   nbrFilter                         Const Like( TypeInt )
     D   filterInf                   32A   Const
     D                                           Options( *VARSIZE )
     D   format                            Const Like( TypeApiFormat )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )
    ‚D* Grupo opcional 1:
     D   sortInf                           Const Like( TypeBuffer2 )
     D                                           Options( *VARSIZE
     D                                                  : *NOPASS )
