      /If Defined( OBJECT_H )
      /Eof
      /Endif
      /Define OBJECT_H

    ‚ *
    ‚ *  NOMBRE.......: OBJECT_H
    ‚ *  DESCRIPCION..: Declaración de los tipos y prototipos para las
    ‚ *                 APIs relacionadas con objetos.
    ‚ *
    ‚ *    Con estas APIs usted podrá obtener información sobre objetos del
    ‚ *    sistema.
    ‚ *
    ‚ *  Programador..: Javier Mora
    ‚ *  Fecha........: 11.04.2008
    ‚ *
    ‚ *  Historia:
    ‚ *
    ‚ *   Fecha   Programador        Observaciones
    ‚ *  -------- ------------------ -------------
    ‚ *
    ‚ *  Usar como:
    ‚ *
    ‚ *    /Copy API,Object_H
    ‚ *
    ‚ *  Notas:
    ‚ *

    ‚ * ==================================================================
    ‚ * = OTROS FICHEROS DE CABECERA                                     =
    ‚ * ==================================================================

      /Copy Api,StdTyp_H

    ‚ * ==================================================================
    ‚ * = DEFINICIÓN DE CONSTANTES                                       =
    ‚ * ==================================================================

    ‚ * ==================================================================
    ‚ * = DEFINICIÓN DE TIPOS                                            =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato OBJD0100 para la información devuelta por la API       -
    ‚ * - "Retrieve Object Description (QUSROBJD)                        -
    ‚ * -                                                                -
    ‚ * - Información básica del objeto (rápida).                        -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytesRtn       Bytes devueltos.                                -
    ‚ * - bytesAvl       Bytes disponibles.                              -
    ‚ * - objNam         Nombre del objeto.                              -
    ‚ * - objLib         Nombre de la biblioteca del objeto.             -
    ‚ * - objTyp         Tipo del objeto.                                -
    ‚ * - rtnLib         Biblioteca devuelta.                            -
    ‚ * - aspNbr         Número del ASP del objeto.                      -
    ‚ * - objOwn         Propietario del objeto.                         -
    ‚ * - objDmn         Dominio del objeto.                             -
    ‚ * - crtDatTim      Fecha y hora de creación.                       -
    ‚ * - chgDatTim      Fecha y hora del último cambio.                 -
    ‚ * ------------------------------------------------------------------

     D OBJD0100_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   bytesRtn                    10I 0 Overlay( OBJD0100_T:   1 )
     D   bytesAvl                    10I 0 Overlay( OBJD0100_T:   5 )
     D   objNam                      10A   Overlay( OBJD0100_T:   9 )
     D   objLib                      10A   Overlay( OBJD0100_T:  19 )
     D   objTyp                      10A   Overlay( OBJD0100_T:  29 )
     D   rtnLib                      10A   Overlay( OBJD0100_T:  39 )
     D   aspNbr                      10I 0 Overlay( OBJD0100_T:  49 )
     D   objOwn                      10A   Overlay( OBJD0100_T:  53 )
     D   objDmn                       2A   Overlay( OBJD0100_T:  63 )
     D   crtDatTim                   13A   Overlay( OBJD0100_T:  65 )
     D   chgDatTim                   13A   Overlay( OBJD0100_T:  78 )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato OBJD0200 para la información devuelta por la API       -
    ‚ * - "Retrieve Object Description (QUSROBJD)                        -
    ‚ * -                                                                -
    ‚ * - Información similar a la mostrada por el PDM.                  -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytesRtn       Bytes devueltos.                                -
    ‚ * - bytesAvl       Bytes disponibles.                              -
    ‚ * - objNam         Nombre del objeto.                              -
    ‚ * - objLib         Nombre de la biblioteca del objeto.             -
    ‚ * - objTyp         Tipo del objeto.                                -
    ‚ * - rtnLib         Biblioteca devuelta.                            -
    ‚ * - aspNbr         Número del ASP del objeto.                      -
    ‚ * - objOwn         Propietario del objeto.                         -
    ‚ * - objDmn         Dominio del objeto.                             -
    ‚ * - crtDatTim      Fecha y hora de creación.                       -
    ‚ * - chgDatTim      Fecha y hora del último cambio.                 -
    ‚ * - extObjAtr      Atributo extendido del objeto.                  -
    ‚ * - text           Texto descriptivo.                              -
    ‚ * - srcNam         Nombre del archivo fuente.                      -
    ‚ * - srcLib         Biblioteca del archivo fuente.                  -
    ‚ * - srcMbr         Nombre del miembro fuente.                      -
    ‚ * ------------------------------------------------------------------

     D OBJD0200_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   bytesRtn                    10I 0 Overlay( OBJD0200_T:   1 )
     D   bytesAvl                    10I 0 Overlay( OBJD0200_T:   5 )
     D   objNam                      10A   Overlay( OBJD0200_T:   9 )
     D   objLib                      10A   Overlay( OBJD0200_T:  19 )
     D   objTyp                      10A   Overlay( OBJD0200_T:  29 )
     D   rtnLib                      10A   Overlay( OBJD0200_T:  39 )
     D   aspNbr                      10I 0 Overlay( OBJD0200_T:  49 )
     D   objOwn                      10A   Overlay( OBJD0200_T:  53 )
     D   objDmn                       2A   Overlay( OBJD0200_T:  63 )
     D   crtDatTim                   13A   Overlay( OBJD0200_T:  65 )
     D   chgDatTim                   13A   Overlay( OBJD0200_T:  78 )
     D   extObjAtr                   10A   Overlay( OBJD0200_T:  91 )
     D   text                        50A   Overlay( OBJD0200_T: 101 )
     D   srcNam                      10A   Overlay( OBJD0200_T: 151 )
     D   srcLib                      10A   Overlay( OBJD0200_T: 161 )
     D   srcMbr                      10A   Overlay( OBJD0200_T: 171 )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato OBJD0300 para la información devuelta por la API       -
    ‚ * - "Retrieve Object Description (QUSROBJD)                        -
    ‚ * -                                                                -
    ‚ * - Información de servicio.                                       -
    ‚ * ------------------------------------------------------------------
    ‚ * - buffer         Los primero 180 bytes corresponden al formato   -
    ‚ * -                OBJD0200.                                       -
    ‚ * - srcChgDt       Fecha y hora de la última actualización del     -
    ‚ * -                archivo fuente.                                 -
    ‚ * - savDatTim      Fecha y hora de salvado del objeto.             -
    ‚ * - rstDatTim      Fecha y hora de restauración del objeto.        -
    ‚ * - crtUsrPrf      Perfile de usuario que ha creado el objeto.     -
    ‚ * - system         Sistema donde fue creado el objeto.             -
    ‚ * - resetDat       Fecha restablecida.                             -
    ‚ * - savSiz         Tamaño salvado.                                 -
    ‚ * - savSeqNbr      Número de secuencia al salvar.                  -
    ‚ * - storage        Almacenamiento.                                 -
    ‚ * - savCmd         Mandato de salvar.                              -
    ‚ * - savVolId       Id de volumen al salvar.                        -
    ‚ * - savDev         Dispositivo de salvar.                          -
    ‚ * - savfNam        Nombre del fichero de salvar.                   -
    ‚ * - savfLib        Nombre de la biblioteca del fichero de salvar.  -
    ‚ * - savLbl         Nivel de salvar.                                -
    ‚ * - sysLbl         Nivel del sistema.                              -
    ‚ * - compiler       Compilador.                                     -
    ‚ * - objLbl         Nivel del objeto.                               -
    ‚ * - usrChg         Cambiado por el usuario.                        -
    ‚ * - licPgm         Programa bajo licencia.                         -
    ‚ * - ptf            Arreglo temporal de programa.                   -
    ‚ * - apar           Informe autorizado de análisis de programa.     -
    ‚ * ------------------------------------------------------------------

     D OBJD0300_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   bytesRtn                    10I 0 Overlay( OBJD0300_T:   1 )
     D   bytesAvl                    10I 0 Overlay( OBJD0300_T:   5 )
     D* ...
     D   srcChgDt                    13A   Overlay( OBJD0300_T: 181 )
     D   savDatTim                   13A   Overlay( OBJD0300_T: 194 )
     D   rstDatTim                   13A   Overlay( OBJD0300_T: 207 )
     D   crtUsrPrf                   10A   Overlay( OBJD0300_T: 220 )
     D   system                       8A   Overlay( OBJD0300_T: 230 )
     D   resetDat                     7A   Overlay( OBJD0300_T: 238 )
     D   savSiz                      10I 0 Overlay( OBJD0300_T: 245 )
     D   savSeqNbr                   10I 0 Overlay( OBJD0300_T: 249 )
     D   storage                     10A   Overlay( OBJD0300_T: 253 )
     D   savCmd                      10A   Overlay( OBJD0300_T: 263 )
     D   savVolId                    71A   Overlay( OBJD0300_T: 273 )
     D   savDev                      10A   Overlay( OBJD0300_T: 344 )
     D   savfNam                     10A   Overlay( OBJD0300_T: 354 )
     D   savfLib                     10A   Overlay( OBJD0300_T: 364 )
     D   savLbl                      17A   Overlay( OBJD0300_T: 374 )
     D   sysLbl                       9A   Overlay( OBJD0300_T: 391 )
     D   compiler                    16A   Overlay( OBJD0300_T: 400 )
     D   objLbl                       8A   Overlay( OBJD0300_T: 416 )
     D   usrChg                       1A   Overlay( OBJD0300_T: 424 )
     D   licPgm                      16A   Overlay( OBJD0300_T: 425 )
     D   ptf                         10A   Overlay( OBJD0300_T: 441 )
     D   apar                        10A   Overlay( OBJD0300_T: 451 )

    ‚ * ==================================================================
    ‚ * = DECLARACIÓN DE FUNCIONES Y PROCEDIMIENTOS PUBLICOS             =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - RtvObjD - Recuperar descripción de objeto                      -
    ‚ * -                                                                -
    ‚ * - Retrieve Object Description (QUSROBJD)                         -
    ‚ * ------------------------------------------------------------------

     D RtvObjD         Pr                  ExtPgm( 'QUSROBJD' )
     D   rcvVar                                  Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   rcvVarLen                         Const Like( TypeInt )
     D   format                            Const Like( TypeApiFormat )
     D   objNamQ                           Const Like( TypeQualName )
     D   objTyp                            Const Like( TypeName )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )

