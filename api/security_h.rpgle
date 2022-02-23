      /IF DEFINED( SECURITY_H )
      /EOF
      /ENDIF
      /DEFINE SECURITY_H

    ‚ *
    ‚ *  NOMBRE.......: SECURITY_H
    ‚ *  DESCRIPCION..: Declaración de los tipos y prototipos para los
    ‚ *                 APIs relacionados con la seguridad del sistema.
    ‚ *
    ‚ *  Programador..: Javier Mora
    ‚ *  Fecha........: 27.07.2007
    ‚ *
    ‚ *  Historia:
    ‚ *
    ‚ *   Fecha   Programador        Observaciones
    ‚ *  -------- ------------------ -------------
    ‚ *  30.07.07 Javier Mora        Estructura USRI0100 para API QSYRUSRI.
    ‚ *  02.01.08 Javier Mora        Estructura USRI0200 para API QSYRUSRI.
    ‚ *  07.01.08 Javier Mora        Estructura USRI0300 para API QSYRUSRI.
    ‚ *  26.02.08 Javier Mora        Incluir API QGYOLAUS - Open List of
    ‚ *                              Autorized Users y estructuras de datos
    ‚ *                              relacionadas.
    ‚ *  25.08.08 Javier Mora        Incluir miembro copia OpnLst_H para
    ‚ *                              tipo TypeOpnLstInf.
    ‚ *  21.09.09 Javier Mora        Revisión de estilo.
    ‚ *  15.05.13 Javier Mora        Change Service tools user ID (QSYCHGDS)
    ‚ *
    ‚ *  Usar como:
    ‚ *
    ‚ *    /Copy API,Security_H
    ‚ *
    ‚ *  Notas :
    ‚ *  -------
    ‚ *

    ‚ * ==================================================================
    ‚ * = OTROS FICHEROS DE CABECERA                                     =
    ‚ * ==================================================================

      /Copy API,StdTyp_H
      /Copy API,OpnLst_H

    ‚ * ==================================================================
    ‚ * = DEFINICIÓN DE TIPOS                                            =
    ‚ * ==================================================================

     D PrfHdl_T        S             12A   Based( apiType_ )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato AUTU0100 para la información devuelta por la API       -
    ‚ * - "Open List of Authorized Users (QGYOLAUS)                      -
    ‚ * -                                                                -
    ‚ * - Indica si el perfil de usuario es de grupo o no y si tiene     -
    ‚ * - algún miembro en el grupo.                                     -
    ‚ * ------------------------------------------------------------------
    ‚ * - usrPrf         Nombre del perfil de usuario.                   -
    ‚ * - usrGrpI        Indicador de usuario o grupo.                   -
    ‚ * - grpMbrI        Indica si el grupo tiene miembros.              -
    ‚ * ------------------------------------------------------------------

     D AUTU0100_T      DS                  Based( apityp_ )
     D                                     Qualified
     D  usrPrf                       10A
     D  usrGrpI                       1A
     D  grpMbrI                       1A

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato AUTU0150 para la información devuelta por la API       -
    ‚ * - "Open List of Authorized Users (QGYOLAUS)                      -
    ‚ * -                                                                -
    ‚ * - Exactamente igual que AUTU0100 pero además incluye el texto    -
    ‚ * - descriptivo del perfil de usuario.                             -
    ‚ * ------------------------------------------------------------------
    ‚ * - usrPrf         Nombre del perfil de usuario.                   -
    ‚ * - usrGrpI        Indicador de usuario o grupo.                   -
    ‚ * - grpMbrI        Indica si el grupo tiene miembros.              -
    ‚ * - text           Texto descriptivo.                              -
    ‚ * ------------------------------------------------------------------

     D AUTU0150_T      DS                  Based( apityp_ )
     D                                     Qualified
     D  usrPrf                       10A
     D  usrGrpI                       1A
     D  grpMbrI                       1A
     D  text                         50A

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato AUTU0200 para la información devuelta por la API       -
    ‚ * - "Open List of Authorized Users (QGYOLAUS)                      -
    ‚ * -                                                                -
    ‚ * - Exactamente igual que AUTU0100 y además se incluyen los        -
    ‚ * - grupos de los usuarios que son miembros de uno más grupos.     -
    ‚ * ------------------------------------------------------------------
    ‚ * - usrPrf         Nombre del perfil de usuario.                   -
    ‚ * - usrGrpI        Indicador de usuario o grupo.                   -
    ‚ * - grpMbrI        Indica si el grupo tiene miembros.              -
    ‚ * - nbrGrpPrf      Número de perfiles de grupo.                    -
    ‚ * - grpPrf         Serie con los perfiles de grupo.                -
    ‚ * ------------------------------------------------------------------

     D AUTU0200_T      DS                  Based( apityp_ )
     D                                     Qualified
     D  usrPrf                       10A
     D  usrGrpI                       1A
     D  grpMbrI                       1A
     D  nbrGrpPrf                    10I 0
     D  grpPrf                       10A   Dim( 16 )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato AUTU0250 para la información devuelta por la API       -
    ‚ * - "Open List of Authorized Users (QGYOLAUS)                      -
    ‚ * -                                                                -
    ‚ * - Exactamente igual que AUTU0200 pero además incluye el texto    -
    ‚ * - descriptivo del perfil de usuario.                             -
    ‚ * ------------------------------------------------------------------
    ‚ * - usrPrf         Nombre del perfil de usuario.                   -
    ‚ * - usrGrpI        Indicador de usuario o grupo.                   -
    ‚ * - grpMbrI        Indica si el grupo tiene miembros.              -
    ‚ * - text           Texto descriptivo.                              -
    ‚ * - nbrGrpPrf      Número de perfiles de grupo.                    -
    ‚ * - grpPrf         Serie con los perfiles de grupo.                -
    ‚ * ------------------------------------------------------------------

     D AUTU0250_T      DS                  Based( apityp_ )
     D                                     Qualified
     D  usrPrf                       10A
     D  usrGrpI                       1A
     D  grpMbrI                       1A
     D  text                         50A
     D                                2A
     D  nbrGrpPrf                    10I 0
     D  grpPrf                       10A   Dim( 16 )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato USRI0100 para la información devuelta por el API       -
    ‚ * - "Retrieve User Information" (QSYRUSRI)                         -
    ‚ * -                                                                -
    ‚ * - Devuelve información relacionada con la contraseña y la        -
    ‚ * - conexión al sistema.                                           -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytesRtn       Bytes devueltos.                                -
    ‚ * - bytesAvl       Bytes disponibles.                              -
    ‚ * - usrPrf         Nombre del perfil de usuario.                   -
    ‚ * - signonDatTim   Fecha y hora de la última conexión.             -
    ‚ * - signonAttemp   Intentos de conexión no válidos.                -
    ‚ * - status         Estado.                                         -
    ‚ * - pwdChgDate     Fecha de cambio de la contraseña.               -
    ‚ * - noPwd          Indicador de que no hay contraseña.             -
    ‚ * - pwdExpInt      Intervalo de caducidad de la contraseña.        -
    ‚ * - datExpExp      Fecha de caducidad de la contraseña.            -
    ‚ * - daysPwdExp     Número de días hasta que caduque la contraseña. -
    ‚ * - setPwdExp      Establecer la contraseña en caducada.           -
    ‚ * - signonInf      Visualizar información de inicio de sesión.     -
    ‚ * - lclPwdMan      Gestión de la contraseña local.                 -
    ‚ * ------------------------------------------------------------------

     D USRI0100_T      DS                  Based( apiTyp_ )
     D                                     Qualified
     D   bytesRtn                    10I 0 Overlay( USRI0100_T:   1 )
     D   bytesAvl                    10I 0 Overlay( USRI0100_T:   5 )
     D   usrPrf                      10A   Overlay( USRI0100_T:   9 )
     D   signonDatTim                13A   Overlay( USRI0100_T:  19 )
     D                                1A   Overlay( USRI0100_T:  32 )
     D   signonAttemp                10I 0 Overlay( USRI0100_T:  33 )
     D   status                      10A   Overlay( USRI0100_T:  37 )
     D   pwdChgDate                   8A   Overlay( USRI0100_T:  47 )
     D   noPwd                        1A   Overlay( USRI0100_T:  55 )
     D                                1A   Overlay( USRI0100_T:  56 )
     D   pwdExpInt                   10I 0 Overlay( USRI0100_T:  57 )
     D   datPwdExp                    8A   Overlay( USRI0100_T:  61 )
     D   daysPwdExp                  10I 0 Overlay( USRI0100_T:  69 )
     D   setPwdExp                    1A   Overlay( USRI0100_T:  73 )
     D   signonInf                   10A   Overlay( USRI0100_T:  74 )
     D   lclPwdMan                    1A   Overlay( USRI0100_T:  84 )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato USRI0200 para la información devuelta por el API       -
    ‚ * - "Retrieve User Information" (QSYRUSRI)                         -
    ‚ * -                                                                -
    ‚ * - Devuelve información relacionada con autorizaciones.           -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytesRtn       Bytes devueltos.                                -
    ‚ * - bytesAvl       Bytes disponibles.                              -
    ‚ * - usrPrf         Nombre del perfil de usuario.                   -
    ‚ * - usrCls         Nombre de la clase de usuario.                  -
    ‚ * - spcAut         Autorizaciones especiales.                      -
    ‚ * -                *ALLOBJ   (1)                                   -
    ‚ * -                *SECADM   (2)                                   -
    ‚ * -                *JOBCTL   (3)                                   -
    ‚ * -                *SPLCTL   (4)                                   -
    ‚ * -                *SAVSYS   (5)                                   -
    ‚ * -                *SERVICE  (6)                                   -
    ‚ * -                *AUDIT    (7)                                   -
    ‚ * -                *IOSYSCFG (8)                                   -
    ‚ * - grpPrf         Nombre del perfil de grupo.                     -
    ‚ * - owner          Propietario.                                    -
    ‚ * - grpAut         Autorización de grupo.                          -
    ‚ * - lmtCab         Limitar posibilidades.                          -
    ‚ * - grpAutTyp      Tipo de autorización de grupo.                  -
    ‚ * - offsSupGrp     Desplazamiento a la matriz de grupos            -
    ‚ * -                suplementarios.                                 -
    ‚ * - nbrSupGrp      Número de grupos suplementarios.                -
    ‚ * - supGrps        Matriz de grupos suplementarios. Cada elemento  -
    ‚ * -                de 10 alfanumérico.                             -
    ‚ * ------------------------------------------------------------------

     D USRI0200_T      DS                  Based( apiTyp_ )
     D                                     Qualified
     D   bytesRtn                    10I 0 Overlay( USRI0200_T:   1 )
     D   bytesAvl                    10I 0 Overlay( USRI0200_T:   5 )
     D   usrPrf                      10A   Overlay( USRI0200_T:   9 )
     D   usrCls                      10A   Overlay( USRI0200_T:  19 )
     D   spcAut                      15A   Overlay( USRI0200_T:  29 )
     D   grpPrf                      10A   Overlay( USRI0200_T:  44 )
     D   owner                       10A   Overlay( USRI0200_T:  54 )
     D   grpAut                      10A   Overlay( USRI0200_T:  64 )
     D   lmtCap                      10A   Overlay( USRI0200_T:  74 )
     D   grpAutTyp                   10A   Overlay( USRI0200_T:  84 )
     D                                3A   Overlay( USRI0200_T:  94 )
     D   offsSupGrp                  10I 0 Overlay( USRI0200_T:  97 )
     D   nbrSupGrp                   10I 0 Overlay( USRI0200_T: 101 )
     D   supGrps                    150A   Overlay( USRI0200_T: 105 )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato USRI0300 para la información devuelta por el API       -
    ‚ * - "Retrieve User Information" (QSYRUSRI)                         -
    ‚ * -                                                                -
    ‚ * - Devuelve toda la información relacionada con el usuario.       -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytesRtn       Bytes devueltos.                                -
    ‚ * - bytesAvl       Bytes disponibles.                              -
    ‚ * - usrPrf         Nombre del perfil de usuario.                   -
    ‚ * - signonDatTim   Fecha y hora de la última conexión.             -
    ‚ * - signonAttemp   Intentos de conexión no válidos.                -
    ‚ * - status         Estado.                                         -
    ‚ * - pwdChgDate     Fecha de cambio de la contraseña.               -
    ‚ * - noPwd          Indicador de que no hay contraseña.             -
    ‚ * - pwdExpInt      Intervalo de caducidad de la contraseña.        -
    ‚ * - datExpExp      Fecha de caducidad de la contraseña.            -
    ‚ * - daysPwdExp     Número de días hasta que caduque la contraseña. -
    ‚ * - setPwdExp      Establecer la contraseña en caducada.           -
    ‚ * - usrCls         Nombre de la clase de usuario.                  -
    ‚ * - spcAut         Autorizaciones especiales.                      -
    ‚ * - grpPrf         Nombre del perfil de grupo.                     -
    ‚ * - owner          Propietario.                                    -
    ‚ * - grpAut         Autorización de grupo.                          -
    ‚ * - assistLvl      Nivel de ayuda.                                 -
    ‚ * - curLib         Nombre de la biblioteca actual.                 -
    ‚ * - initMnu        Nombre del menú inicial.                        -
    ‚ * - initMnuLib     Nombre de la biblioteca del menú inicial.       -
    ‚ * - initPgm        Nombre del programa inicial.                    -
    ‚ * - initPgmLib     Nombre de la biblioteca del programa inicial.   -
    ‚ * - lmtCap         Limitar posibilidades.                          -
    ‚ * - text           Texto descriptivo.                              -
    ‚ * - signonInf      Visualizar información de inicio de sesión.     -
    ‚ * - lmtDevSes      Limitar sesiones de dispositivo.                -
    ‚ * - kbdBuff        Almacenamiento intermedio de teclado.           -
    ‚ * - maxAllowStg    Máximo de almacenamiento permitido.             -
    ‚ * - stgUsed        Almacenamiento utilizado.                       -
    ‚ * - maxScdPty      Máxima prioridad de planificación.              -
    ‚ * - jobd           Nombre de la descripción de trabajo.            -
    ‚ * - jobdLib        Nombre de la biblioteca de la desc. de trabajo. -
    ‚ * - accountCode    Código de contabilidad.                         -
    ‚ * - msgq           Nombre de la cola de mensajes.                  -
    ‚ * - msgqLib        Nombre de la biblioteca de la cola de mensajes. -
    ‚ * - msgqDlvry      Método de entrega de los mensajes.              -
    ‚ * - msgSev         Filtro de gravedad para los mensajes.           -
    ‚ * - outq           Nombre de la cola de salida.                    -
    ‚ * - outqLib        Nombre de la biblioteca de la cola de salida.   -
    ‚ * - prtDev         Nombre de dispositivo de impresora.             -
    ‚ * - spcEnv         Entorno especial.                               -
    ‚ * - atnPgm         Programa de atención.                           -
    ‚ * - atnPgmLib      Biblioteca del programa de atención.            -
    ‚ * - langId         Identificador de idioma.                        -
    ‚ * - countryId      Identificador de país o región.                 -
    ‚ * - ccsid          Id. de juego de caracteres.                     -
    ‚ * - usrOpt         Opciones de usuario.                            -
    ‚ * - seqTbl         Nombre de la tabla para la secuencia de         -
    ‚ * -                ordenación.                                     -
    ‚ * - seqTblLib      Nombre de biblioteca para tabla secuencia de    -
    ‚ * -                ordenación.                                     -
    ‚ * - objAud         Valor de auditoría de objeto.                   -
    ‚ * - usrActAudLvl   User action audit level.                        -
    ‚ * - grpAutTyp      Tipo de autorización de grupo.                  -
    ‚ * - offsSupGrp     Desplazamiento a la matriz de grupos            -
    ‚ * -                suplementarios.                                 -
    ‚ * - nbrSupGrp      Número de grupos suplementarios.                -
    ‚ * - usrId          Número de identificación del usuario.           -
    ‚ * - grpId          Número de identificación del grupo.             -
    ‚ * - offsHomeDir    Desplazamiento al directorio inicial.           -
    ‚ * - lenHomeDir     Tamaño del directorio inicial.                  -
    ‚ * - locJobAttr     Atributos de "escenario" del trabajo.           -
    ‚ * - offsLocPath    Desplazamiento al nombre de la "vía del         -
    ‚ * -                escenario".                                     -
    ‚ * - lenLocPath     Tamaño de la "vía de localización".             -
    ‚ * - grpMbrInd      Indicador de miembro de grupo.                  -
    ‚ * - digCertInd     Indicador de certificado digital.               -
    ‚ * - charIdCtl      Control de identificador de carácter.           -
    ‚ * - offsAspDesc                                                    -
    ‚ * - nbrAspDesc                                                     -
    ‚ * - nbrAspDescRt                                                   -
    ‚ * - lenAspDesc                                                     -
    ‚ * - pwdMan         Gestión de la contraseña local.                 -
    ‚ * - buffer         Buffer para información adicional:              -
    ‚ * -                 - Grupos suplementarios                        -
    ‚ * -                 - Directorio inicial                           -
    ‚ * -                 - Nombre de la vía del escenario               -
    ‚ * -                 - Descriptores de uso del almacenamiento ASP   -
    ‚ * ------------------------------------------------------------------

     D USRI0300_T      DS                  Based( apiTyp_ )
     D                                     Qualified
     D   bytesRtn                    10I 0 Overlay( USRI0300_T:   1 )
     D   bytesAvl                    10I 0 Overlay( USRI0300_T:   5 )
     D   usrPrf                      10A   Overlay( USRI0300_T:   9 )
     D   signonDatTim                13A   Overlay( USRI0300_T:  19 )
     D                                1A   Overlay( USRI0300_T:  32 )
     D   signonAttemp                10I 0 Overlay( USRI0300_T:  33 )
     D   status                      10A   Overlay( USRI0300_T:  37 )
     D   pwdChgDate                   8A   Overlay( USRI0300_T:  47 )
     D   noPwd                        1A   Overlay( USRI0300_T:  55 )
     D                                1A   Overlay( USRI0300_T:  56 )
     D   pwdExpInt                   10I 0 Overlay( USRI0300_T:  57 )
     D   datPwdExp                    8A   Overlay( USRI0300_T:  61 )
     D   daysPwdExp                  10I 0 Overlay( USRI0300_T:  69 )
     D   setPwdExp                    1A   Overlay( USRI0300_T:  73 )
     D   usrCls                      10A   Overlay( USRI0300_T:  74 )
     D   spcAut                      15A   Overlay( USRI0300_T:  84 )
     D   grpPrf                      10A   Overlay( USRI0300_T:  99 )
     D   owner                       10A   Overlay( USRI0300_T: 109 )
     D   grpAut                      10A   Overlay( USRI0300_T: 119 )
     D   assistLvl                   10A   Overlay( USRI0300_T: 129 )
     D   curLib                      10A   Overlay( USRI0300_T: 139 )
     D   initMnu                     10A   Overlay( USRI0300_T: 149 )
     D   initMnuLib                  10A   Overlay( USRI0300_T: 159 )
     D   initPgm                     10A   Overlay( USRI0300_T: 169 )
     D   initPgmLib                  10A   Overlay( USRI0300_T: 179 )
     D   lmtCap                      10A   Overlay( USRI0300_T: 189 )
     D   text                        50A   Overlay( USRI0300_T: 199 )
     D   signonInf                   10A   Overlay( USRI0300_T: 249 )
     D   lmtDevSes                   10A   Overlay( USRI0300_T: 259 )
     D   kbdBuff                     10A   Overlay( USRI0300_T: 269 )
     D                                2A   Overlay( USRI0300_T: 279 )
     D   maxAllowStg                 10I 0 Overlay( USRI0300_T: 281 )
     D   stgUsed                     10I 0 Overlay( USRI0300_T: 285 )
     D   maxScdPty                    1A   Overlay( USRI0300_T: 289 )
     D   jobd                        10A   Overlay( USRI0300_T: 290 )
     D   jobdLib                     10A   Overlay( USRI0300_T: 300 )
     D   accountCode                 15A   Overlay( USRI0300_T: 310 )
     D   msgq                        10A   Overlay( USRI0300_T: 325 )
     D   msgqLib                     10A   Overlay( USRI0300_T: 335 )
     D   msgqDlvry                   10A   Overlay( USRI0300_T: 345 )
     D                                2A   Overlay( USRI0300_T: 355 )
     D   msgqSev                     10I 0 Overlay( USRI0300_T: 357 )
     D   outq                        10A   Overlay( USRI0300_T: 361 )
     D   outqLib                     10A   Overlay( USRI0300_T: 371 )
     D   prtDev                      10A   Overlay( USRI0300_T: 381 )
     D   spcEnv                      10A   Overlay( USRI0300_T: 391 )
     D   atnPgm                      10A   Overlay( USRI0300_T: 401 )
     D   atnPgmLib                   10A   Overlay( USRI0300_T: 411 )
     D   langId                      10A   Overlay( USRI0300_T: 421 )
     D   countryId                   10A   Overlay( USRI0300_T: 431 )
     D   ccsid                       10I 0 Overlay( USRI0300_T: 441 )
     D   usrOpt                      36A   Overlay( USRI0300_T: 445 )
     D   seqTbl                      10A   Overlay( USRI0300_T: 481 )
     D   seqTblLib                   10A   Overlay( USRI0300_T: 491 )
     D   objAud                      10A   Overlay( USRI0300_T: 501 )
     D   usrActAudLvl                64A   Overlay( USRI0300_T: 511 )
     D   grpAutTyp                   10A   Overlay( USRI0300_T: 575 )
     D   offsSupGrp                  10I 0 Overlay( USRI0300_T: 585 )
     D   nbrSupGrp                   10I 0 Overlay( USRI0300_T: 589 )
     D   usrId                       10I 0 Overlay( USRI0300_T: 593 )
     D   grpId                       10I 0 Overlay( USRI0300_T: 597 )
     D   offsHomeDir                 10I 0 Overlay( USRI0300_T: 601 )
     D   lenHomeDir                  10I 0 Overlay( USRI0300_T: 605 )
     D   locJobAttr                  16A   Overlay( USRI0300_T: 609 )
     D   offsLocPath                 10I 0 Overlay( USRI0300_T: 625 )
     D   lenLocPath                  10I 0 Overlay( USRI0300_T: 629 )
     D   grpMbrInd                    1A   Overlay( USRI0300_T: 633 )
     D   digCertInd                   1A   Overlay( USRI0300_T: 634 )
     D   charIdCtl                   10A   Overlay( USRI0300_T: 635 )
     D   offsAspDesc                 10I 0 Overlay( USRI0300_T: 645 )
     D   nbrAspDesc                  10I 0 Overlay( USRI0300_T: 649 )
     D   nbrAspDescRt                10I 0 Overlay( USRI0300_T: 653 )
     D   lenAspDesc                  10I 0 Overlay( USRI0300_T: 657 )
     D   pwdMan                       1A   Overlay( USRI0300_T: 661 )
     D   buffer                    2048A   Overlay( USRI0300_T: 662 )

    ‚D*  ¡OBSOLETOS! Se mantienen por compatibilidad (2009-09-21)
     D TypePrfHdl      S                   Based( apiType_ )
     D                                     Like( PrfHdl_T )

    ‚ * ==================================================================
    ‚ * = DECLARACIÓN DE FUNCIONES Y PROCEDIMIENTOS PUBLICOS             =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - ChgPrvSod - Cambiar última fecha de conexión                   -
    ‚ * -                                                                -
    ‚ * - Change previous sign-on date (QSYCHGPR)                        -
    ‚ * -                                                                -
    ‚ * - Cambia la última fecha y hora de conexión del usuario actual   -
    ‚ * - del trabajo por la fecha y hora del momento.                   -
    ‚ * ------------------------------------------------------------------

     D ChgPrvSod       PR                  ExtPgm( 'QSYCHGPR' )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )

    ‚ * ------------------------------------------------------------------
    ‚ * - GetPrfHdl - Obtener el descriptor de un perfil de usuario      -
    ‚ * -                                                                -
    ‚ * - Get Profile Handle (QSYGETPH)                                  -
    ‚ * -                                                                -
    ‚ * - Valida un Id de usuario y su contraseña y crea un descriptor   -
    ‚ * - del perfil para su uso en trabajos que se ejecutan bajo varios -
    ‚ * - perfiles de usuario.                                           -
    ‚ * ------------------------------------------------------------------

     D GetPrfHdl       PR                  ExtPgm( 'QSYGETPH' )
     D   usrPrf                            Const Like( TypeName )
     D   pwd                               Const Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   prfHdl                                  Like( TypePrfHdl )
    ‚D* Grupo Opcional 1
     D   error                                   Like( TypeAPIError )
     D                                           Options( *VARSIZE
     D                                                  : *NOPASS )
    ‚D* Grupo Opcional 2
     D   pwdLen                            Const Like( TypeInt )
     D                                           Options( *NOPASS )
     D   pwdCcsId                          Const Like( TypeInt )
     D                                           Options( *NOPASS )

    ‚ * ------------------------------------------------------------------
    ‚ * - QsyGetProfileHandle -                                          -
    ‚ * -    Obtener el descriptor de un perfil de usuario (no se        -
    ‚ * -    admiten valores especiales para la contraseña)              -
    ‚ * -                                                                -
    ‚ * - Get profile handle (QsyGetProfileHandle)                       -
    ‚ * ------------------------------------------------------------------

     D QsyGetProfileHandle...
     D                 PR                  ExtProc( 'QsyGetProfileHandle' )
     D   prfHdl                                  Like( TypePrfHdl )
     D   usrPrf                            Const Like( TypeName )
     D   pwd                               Const Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   pwdLen                            Value Like( TypeInt )
     D   pwdCcsId                          Value Like( TypeUnsignedInt )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )

    ‚ * ------------------------------------------------------------------
    ‚ * - OpnLstAutUsr - Abrir lista de usuarios autorizados             -
    ‚ * -                                                                -
    ‚ * - Open List of Autorized Users (QGYOLAUS)                        -
    ‚ * ------------------------------------------------------------------

     D OpnLstAutUsr    PR                  ExtPgm( 'QGYOLAUS' )
     D   rcvVar                                  Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   rcvVarLen                         Const Like( TypeInt )
     D   lstInf                                  Like( OpnLstInf_T )
     D   nbrRcdRtn                         Const Like( TypeInt )
     D   format                            Const Like( TypeApiFormat )
     D   sltCri                            Const Like( TypeName )
     D   grpPrf                            Const Like( TypeName )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )
     D   usrPrf                            Const Like( TypeName )
     D                                           Options( *NOPASS )

    ‚ * ------------------------------------------------------------------
    ‚ * - SetPrtHdl - Establecer descriptor de perfil de usuario         -
    ‚ * -                                                                -
    ‚ * - Set Profile Handle (QWTSETP)                                   -
    ‚ * ------------------------------------------------------------------

     D SetPrfHdl       PR                  ExtPgm('QWTSETP')
     D   prfHdl                            Const Like( TypePrfHdl )
    ‚D* Grupo opcional 1:
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE
     D                                                  : *NOPASS )

    ‚ * ------------------------------------------------------------------
    ‚ * - QsySetToProfileHandle -                                        -
    ‚ * -    Establecer descriptor de perfil de usuario (ILE)            -
    ‚ * -                                                                -
    ‚ * - Set Profile Handle (QSySetToProfileHandle)                     -
    ‚ * ------------------------------------------------------------------

     D QsySetToProfileHandle...
     D                 PR                  ExtProc( 'QsySetToProfileHandle' )
     D   prfHdl                            Const Like( TypePrfHdl )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE
     D                                                  : *NOPASS )

    ‚ * ------------------------------------------------------------------
    ‚ * - RlsPrfHdl - Liberar el descriptor de un perfil de usuario      -
    ‚ * -                                                                -
    ‚ * - Release Profile Handle (QSYRLSPH)                              -
    ‚ * -                                                                -
    ‚ * - Realiza la validación del descriptor suministrado y después lo -
    ‚ * - libera. El descriptor deja de ser válido y ya no puede volver  -
    ‚ * - a usarse en el trabajo actual.                                 -
    ‚ * ------------------------------------------------------------------

     D RlsPrfHdl       PR                  ExtPgm( 'QSYRLSPH' )
     D   prfHdl                            Const Like( TypePrfHdl )
    ‚D* Grupo Opcional 1:
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE
     D                                                  : *NOPASS )

    ‚ * ------------------------------------------------------------------
    ‚ * - QsyReleaseProfileHandle -                                      -
    ‚ * -    Liberar el descriptor de un perfil de usuario (ILE)         -
    ‚ * -                                                                -
    ‚ * - Release Profile Handle (QsyReleaseProfileHandle)               -
    ‚ * ------------------------------------------------------------------

     D QsyReleaseProfileHandle...
     D                 PR                  ExtProc( 'QsyReleaseProfileHandle' )
     D   prfHdl                            Const Like( TypePrfHdl )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE
     D                                                  : *NOPASS )

    ‚ * ------------------------------------------------------------------
    ‚ * - RtvUsrInf - Recuperar información de un perfil de usuario      -
    ‚ * -                                                                -
    ‚ * - Retrieve User Information (QSYRUSRI)                           -
    ‚ * ------------------------------------------------------------------

     D RtvUsrInf       PR                  ExtPgm( 'QSYRUSRI' )
     D   rcvVar                                  Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   rcvVarLen                         Const Like( TypeInt )
     D   formato                           Const Like( TypeApiFormat )
     D   usrPrf                            Const Like( TypeName )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )

    ‚ * ------------------------------------------------------------------
    ‚ * - ChgSstUsrId - Cambiar ID de usuario de las herramienta de      -
    ‚ * -               servicio                                         -
    ‚ * -                                                                -
    ‚ * - Change service tools user ID (QSYCHGDS)                        -
    ‚ * ------------------------------------------------------------------

     D ChgSstUsrId     PR                  ExtPgm( 'QSYCHGDS' )
     D   rqsSstUsrId                       Const Like( TypeName )
     D   rqsSstUsrPwd               128A   Const
     D   chgSstUsrId                       Const Like( TypeName )
     D   newSstUsrId                       Const Like( TypeName )
     D   newSstUsrPwd               128A   Const
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )
    ‚D* Grupo Opcional 1:
     D   rqsUsrIdLen                       Const Like( TypeInt )
     D                                           Options( *NOPASS )
     D   rqsPwdLen                         Const Like( TypeInt )
     D                                           Options( *NOPASS )
     D   rqsPwdCcsId                       Const Like( TypeInt )
     D                                           Options( *NOPASS )
     D   newUsrIdLen                       Const Like( TypeInt )
     D                                           Options( *NOPASS )
     D   newPwdLen                         Const Like( TypeInt )
     D                                           Options( *NOPASS )
     D   newPwdCcsId                       Const Like( TypeInt )
     D                                           Options( *NOPASS )
