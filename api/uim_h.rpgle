      /IF DEFINED( UIM_H )
      /EOF
      /ENDIF
      /DEFINE UIM_H

    ‚ *
    ‚ *  NOMBRE.......: UIM_H
    ‚ *  DESCRIPCION..: Declaración de los tipos y prototipos para las
    ‚ *                 APIs relacionadas con la Gestión del Interfaz de
    ‚ *                 Usuario.
    ‚ *
    ‚ *  Programador..: Javier Mora
    ‚ *  Fecha........: 23.05.2007
    ‚ *
    ‚ *  Historia:
    ‚ *
    ‚ *   Fecha   Programador        Observaciones
    ‚ *  -------- ------------------ -------------
    ‚ *  02.10.12 Javier Mora        Incluir 'Display Help' (QUHDSPH).
    ‚ *  Dic 2012 Javier Mora        Incluir 'Retrieve Help Text' (QUHRHLPT)
    ‚ *                              y estructuras RHLP01*.
    ‚ *
    ‚ *  Uso:
    ‚ *
    ‚ *    /Copy Api,Uim_H
    ‚ *
    ‚ *  Notas:
    ‚ *

    ‚ * ==================================================================
    ‚ * = OTROS FICHEROS DE CABECERA                                     =
    ‚ * ==================================================================

      /COPY Api,StdTyp_H

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato RHLP0100 para la información recibida desde la API     -
    ‚ * - 'Recuperar Texto de Ayuda (QUHRHLPT)'                          -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytesRtn       Bytes devueltos.                                -
    ‚ * - bytesAvl       Bytes disponibles.                              -
    ‚ * - format         Nombre del formato.                             -
    ‚ * - offsHlpIdIds   Desplazamiento a la lista de identificadores    -
    ‚ * -                de ayuda.                                       -
    ‚ * - nbrEntries     Número de entradas la lista de indentificadores.-
    ‚ * - sizeEntry      Tamaño (en bytes) de cada entrada de la lista.  -
    ‚ * -                                                                -
    ‚ * - PARTE VARIABLE DE LA ESTRUCTURA DE DATOS                       -
    ‚ * -                                                                -
    ‚ * - Char(*)        Lista de indenficadores de ayuda.               -
    ‚ * ------------------------------------------------------------------

     D RHLP0100_T      DS                  Qualified
     D/IF DEFINED( *V6R1M0 )
     D                                     Template
     D/ELSE
     D                                     Based( apityp_ )
     D/ENDIF
     D   bytesRtn                    10I 0 Overlay( RHLP0100_T:  1 )
     D   bytesAvl                    10I 0 Overlay( RHLP0100_T:  5 )
     D   format                       8A   Overlay( RHLP0100_T:  9 )
     D   offsHlpIdIds                10I 0 Overlay( RHLP0100_T: 17 )
     D   nbrEntries                  10I 0 Overlay( RHLP0100_T: 21 )
     D   sizeEntry                   10I 0 Overlay( RHLP0100_T: 25 )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato RHLP0100 para la información recibida desde la API     -
    ‚ * - 'Recuperar Texto de Ayuda (QUHRHLPT)'                          -
    ‚ * -                                                                -
    ‚ * - Estructura de cada entrada de la lista de identificadores de   -
    ‚ * - ayuda.                                                         -
    ‚ * ------------------------------------------------------------------
    ‚ * - hlpId          Nombre del identificador de la ayuda.           -
    ‚ * - objName        Nombre del objeto.                              -
    ‚ * - libName        Biblioteca del objeto.                          -
    ‚ * - objType        Tipo del objeto.                                -
    ‚ * - hlpIdFound     Valor de estado del indentificador:             -
    ‚ * -                  0 = No encontrado debido a un nombre          -
    ‚ * -                      incorrecto.                               -
    ‚ * -                  1 = Se ha encontrado el identificador.        -
    ‚ * -                  2 = Fallo durante el acceso al objeto;        -
    ‚ * -                      revisar las anotaciones del trabajo.      -
    ‚ * - hlpIdAnchor    Nombre del 'ancla' del identificador de ayuda.  -
    ‚ * ------------------------------------------------------------------

     D RHLP0100_hlpIdEnt_T...
     D                 DS                  Qualified
     D/IF DEFINED( *V6R1M0 )
     D                                     Template
     D/ELSE
     D                                     Based( apityp_ )
     D/ENDIF
     D   hlpId                       32A
     D   objName                     10A
     D   libName                     10A
     D   objType                     10A
     D   hlpIdFound                   1A
     D   hlpIdAnchor                 96A
     D                               33A

    ‚ * ==================================================================
    ‚ * = DECLARACIÓN DE FUNCIONES Y PROCEDIMIENTOS PUBLICOS             =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - DspCmdLinWdw - Mostrar ventana de línea de mandato             -
    ‚ * -                                                                -
    ‚ * - Display Command Line Window (QUSCMDLN)                         -
    ‚ * ------------------------------------------------------------------

     D DspCmdLinWdw    PR                  ExtPgm( 'QUSCMDLN' )

    ‚ * ------------------------------------------------------------------
    ‚ * - DspLngTxt - Mostrar una ventana emergente (pop-up) con un      -
    ‚ * -             texto                                              -
    ‚ * -                                                                -
    ‚ * - Display Long Text (QUILNGTX)                                   -
    ‚ * ------------------------------------------------------------------

     D DspLngTxt       PR                  ExtPgm( 'QUILNGTX' )
     D   text                              Const Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   textLen                           Const Like( TypeInt )
     D   msgId                             Const Like( TypeMessageId )
     D   msgFile                           Const Like( TypeQualName )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )

    ‚ * ------------------------------------------------------------------
    ‚ * - DspHlpInf - Visualizar información de ayuda                    -
    ‚ * -                                                                -
    ‚ * - Display Help (QUHDSPH)                                         -
    ‚ * ------------------------------------------------------------------

     D DspHlpInf       PR                  ExtPgm( 'QUHDSPH' )
     D   hlpIdArr                          Const Like( TypeBuffer2 )
     D                                           Options( *VARSIZE )
     D   hlpIdNbr                          Const Like( TypeInt )
     D   hlpType                           Const Like( TypeInt )
     D                                           Dim( 2 )
     D   title                       55A   Const
     D   searchIndex                       Const Like( TypeQualName )
     D   dspType                      1A   Const
     D   upperLeftCorner...
     D                                     Const Like( TypeInt )
     D                                           Dim( 2 )
     D   lowerRightCorner...
     D                                     Const Like( TypeInt )
     D                                           Dim( 2 )
     D   cursorLocation...
     D                                     Const Like( TypeInt )
     D                                           Dim( 2 )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )
    ‚D* Grupo Opcional
     D   bookSelfName                 8A   Const
     D                                           Options( *NOPASS )
     D   borderAtr                    2A   Const
     D                                           Options( *NOPASS )
     D   borderChr                    8A   Const
     D                                           Options( *NOPASS )

    ‚ * ------------------------------------------------------------------
    ‚ * - RtvHlpTxt - Recuperar texto de ayuda                           -
    ‚ * -                                                                -
    ‚ * - Retrieve Help Text (QUHRHLPT)                                  -
    ‚ * ------------------------------------------------------------------

     D RtvHlpTxt       PR                  ExtPgm( 'QUHRHLPT' )
     D   rcvVar                                  Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   rcvVarLen                         Const Like( TypeInt )
     D   format                            Const Like( TypeApiFormat )
     D   hlpIdToRcv                        Const Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   hlpIdNbr                          Const Like( TypeInt )
     D   xmlRcvVar                               Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   xmlRcvVarLen                      Const Like( TypeInt )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )

