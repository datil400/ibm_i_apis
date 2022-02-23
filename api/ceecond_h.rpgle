      /IF DEFINED( CEECOND_H )
      /EOF
      /ENDIF
      /DEFINE CEECOND_H

    ‚ *
    ‚ *  NOMBRE.......: CEECOND_H
    ‚ *  DESCRIPCION..: Declaración de tipos de datos y prototipos de
    ‚ *                 funciones del conjunto de APIs enlazables del
    ‚ *                 ILE CEE relacionadas con el manejo de condiciones
    ‚ *                 de error.
    ‚ *
    ‚ *    El conjunto de APIs para la gestión de condiciones ILE
    ‚ *    proporcionan la posibilidad de gestionar errores
    ‚ *    independientemente del manejo de errores específico del
    ‚ *    lenguaje de alto nivel.
    ‚ *
    ‚ *  Programador..: Javier Mora
    ‚ *  Fecha........: Agosto 2013
    ‚ *
    ‚ *  Historia:
    ‚ *
    ‚ *   Fecha   Programador        Observaciones
    ‚ *  -------- ------------------ -------------
    ‚ *
    ‚ *  Usar como:
    ‚ *
    ‚ *    /COPY API,CEECOND_H
    ‚ *
    ‚ *  Notas:
    ‚ *

    ‚ * ==================================================================
    ‚ * = OTROS FICHEROS DE CABECERA                                     =
    ‚ * ==================================================================

      /COPY Api,StdTyp_H

    ‚ * ==================================================================
    ‚ * = DEFINICIÓN DE CONSTANTES                                       =
    ‚ * ==================================================================

    ‚ *
    ‚ * 'result_code' de la interfaz del manejador de condiciones.
    ‚ *
     D CEE_CH_RESUME   C                   10
     D CEE_CH_PERCOLATE_NEXTHLR...
     D                 C                   20
     D CEE_CH_PERCOLATE_NEXTCALLSTK...
     D                 C                   21
     D CEE_CH_PROMOTE_NEXTHLR...
     D                 C                   30
     D CEE_CH_PROMOTE_NEXTCALLSTK...
     D                 C                   31
     D CEE_CH_PROMOTE_AND_RESTART...
     D                 C                   32

    ‚ * ==================================================================
    ‚ * = DEFINICIÓN DE TIPOS                                            =
    ‚ * ==================================================================

      /IF NOT DEFINED( CEE_FEEDBACK_T_DEF )
      /DEFINE CEE_FEEDBACK_T_DEF
     D CEE_feedback_T  S             12A   Based( apiTyp_ )
      /ENDIF

    ‚ * ------------------------------------------------------------------
    ‚ * - Estrutura de datos de la 'señal' (token) de una condición de   -
    ‚ * - error.                                                         -
    ‚ * -                                                                -
    ‚ * - Información más detallada en:                                  -
    ‚ * -                                                                -
    ‚ * - Who Knew You Could Do That with RPG IV? Página 103             -
    ‚ * ------------------------------------------------------------------
    ‚ * - msgSev         Gravedad del mensaje.                           -
    ‚ * - msgNbr         Número del mensaje. P.e. X'1211' para 'división -
    ‚ * -                por cero'.                                      -
    ‚ * - msgNbrC        Número del mensaje en formato CHAR.             -
    ‚ * - caseSevCtl     Un byte divido en grupos de bits:               -
    ‚ * -                case (2bits): define el formato de la porción   -
    ‚ * -                  msgSev+msgNbr. Para la condiciones ILE        -
    ‚ * -                  siempre a 1.                                  -
    ‚ * -                Severity (3bits): indica la gravedad de la      -
    ‚ * -                  condición de error. Misma información en      -
    ‚ * -                  'msgSev'. Valores de 0 a 4.                   -
    ‚ * -                Control (3bits): flags que describen o controlan-
    ‚ * -                  varios aspectos para el manejo de condición.  -
    ‚ * -                  El tercer bit indica si 'msgType' ha sido     -
    ‚ * -                  asignado por IBM.                             -
    ‚ * - msgType        Tipo del mensaje (CEE, CPF, MCH, RNX, etc.).    -
    ‚ * - msgKey         Identificador (key) único del mensaje.          -
    ‚ * ------------------------------------------------------------------

     D CEE_condition_token_T...
     D                 DS                  Based( apiTyp_ )
     D                                     Qualified
     D   msgSev                       5I 0
     D   msgNbr                       5I 0
     D   msgNbrC                      2A   Overlay( CEE_condition_token_T: 3 )
     D   caseSevCtl                   1A
     D   msgType                      3A
     D   msgKey                       4A

    ‚ * ==================================================================
    ‚ * = DECLARACIÓN DE FUNCIONES Y PROCEDIMIENTOS PUBLICOS             =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - CEENCOD - Construir una 'señal' (token) de condición.          -
    ‚ * -                                                                -
    ‚ * - Construct a Condition Token (CEENCOD)                          -
    ‚ * ------------------------------------------------------------------

     D CEENCOD         PR                  ExtProc( 'CEENCOD' )
     D   msgSev                            Const Like( INT2_T )
     D   msgNbr                            Const Like( INT2_T )
     D   case                              Const Like( INT2_T )
     D   severity                          Const Like( INT2_T )
     D   control                           Const Like( INT2_T )
     D   facilityId                   3A   Const
     D   msgKey                       4A   Const
     D   newToken                    12A
    ‚D* Grupo opcional 1:
     D   fc                                      Like( CEE_feedback_T )
     D                                           Options( *OMIT )

    ‚ * ------------------------------------------------------------------
    ‚ * - CEEDCOD - Descomponer una 'señal' (token) de condición.        -
    ‚ * -                                                                -
    ‚ * - Decompose a Condition Token (CEEDCOD)                          -
    ‚ * ------------------------------------------------------------------

     D CEEDCOD         PR                  ExtProc( 'CEEDCOD' )
     D   token                       12A   Const
     D   msgSev                                  Like( INT2_T )
     D   msgNbr                                  Like( INT2_T )
     D   case                                    Like( INT2_T )
     D   severity                                Like( INT2_T )
     D   control                                 Like( INT2_T )
     D   facilityId                   3A
     D   msgKey                       4A
     D   newToken                    12A
    ‚D* Grupo opcional 1:
     D   fc                                      Like( CEE_feedback_T )
     D                                           Options( *OMIT )

    ‚ * ------------------------------------------------------------------
    ‚ * - CEEHDLR - Registrar manejador de condiciones escrito por el    -
    ‚ * -           usuario.                                             -
    ‚ * -                                                                -
    ‚ * - Register a User-Written Condition Handler (CEEHDLR)            -
    ‚ * ------------------------------------------------------------------

     D CEEHDLR         PR                  ExtProc( 'CEEHDLR' )
     D   handler                           Const Like( TypeProcPtr )
     D   token                             Const Like( TypePtr )
    ‚D* Grupo opcional 1:
     D   fc                                      Like( CEE_feedback_T )
     D                                           Options( *OMIT )

    ‚ * ------------------------------------------------------------------
    ‚ * - CEEHDLU - Cancelar manejador de condiciones escrito por el     -
    ‚ * -           usuario.                                             -
    ‚ * -                                                                -
    ‚ * - Unregister a User-Written Condition Handler (CEEHDLU)          -
    ‚ * ------------------------------------------------------------------

     D CEEHDLU         PR                  ExtProc( 'CEEHDLU' )
     D   handler                           Const Like( TypeProcPtr )
    ‚D* Grupo opcional 1:
     D   fc                                      Like( CEE_feedback_T )
     D                                           Options( *OMIT )

