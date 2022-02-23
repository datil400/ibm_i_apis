      /If Defined( ASSIST_H )
      /Eof
      /Endif
      /Define ASSIST_H

    ‚ *
    ‚ *  NOMBRE.......: ASSIST_H
    ‚ *  DESCRIPCION..: Declaración de los tipos y prototipos para los
    ‚ *                 APIs relacionados con el Operational Assistant.
    ‚ *
    ‚ *  Programador..: Javier Mora
    ‚ *  Fecha........: 11.04.2007
    ‚ *
    ‚ *  Historia:
    ‚ *
    ‚ *   Fecha   Programador        Observaciones
    ‚ *  -------- ------------------ -------------
    ‚ *  17.09.09 Javier Mora        Revisión de estilo.
    ‚ *
    ‚ *  Usar como:
    ‚ *
    ‚ *    /Copy Api,Assist_H
    ‚ *
    ‚ *  Notas:
    ‚ *

    ‚ * ==================================================================
    ‚ * = OTROS FICHEROS DE CABECERA                                     =
    ‚ * ==================================================================

      /Copy API,StdTyp_H

    ‚ * ==================================================================
    ‚ * = DEFINICIÓN DE CONSTANTES                                       =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - API QEZSNDMG                                                   -
    ‚ * ------------------------------------------------------------------

    ‚ * Tipo de mensaje

     D OA_MGTY_INFO    C                   Const( '*INFO' )
     D OA_MGTY_INQ     C                   Const( '*INQ' )

     D OA_SNDMG_TYP_INFO...
     D                 C                   Const( '*INFO' )
     D OA_SNDMG_TYP_INQ...
     D                 C                   Const( '*INQ' )

    ‚ * Modo de entrega del mensaje

     D OA_MGDV_BREAK   C                   Const( '*BREAK' )
     D OA_MGDV_NORMAL  C                   Const( '*NORMAL' )

     D OA_SNDMG_DLVRY_BREAK...
     D                 C                   Const( '*BREAK' )
     D OA_SNDMG_DLVRY_NORMAL...
     D                 C                   Const( '*NORMAL' )

    ‚ * Lista de perfiles de usuario o de estaciones de pantalla

     D OA_MGLT_ALL     C                   Const( '*ALL' )
     D OA_MGLT_ALLACT  C                   Const( '*ALLACT' )
     D OA_MGLT_SYSOPR  C                   Const( '*SYSOPR' )

     D OA_SNDMG_LIST_ALL...
     D                 C                   Const( '*ALL' )
     D OA_SNDMG_LIST_ALLACT...
     D                 C                   Const( '*ALLACT' )
     D OA_SNDMG_LIST_SYSOPR...
     D                 C                   Const( '*SYSOPR' )

    ‚ * Indicadores del envío del mensaje

     D OA_MGSI_NOMSG   C                   Const( 0 )
     D OA_MGSI_SENT    C                   Const( 1 )
     D OA_MGSI_SENTNOTVALID...
     D                 C                   Const( 2 )

     D OA_SNDMG_IND_NOMSG...
     D                 C                   Const( 0 )
     D OA_SNDMG_IND_SENT...
     D                 C                   Const( 1 )
     D OA_SNDMG_IND_SENTNOTVALID...
     D                 C                   Const( 2 )

    ‚ * Tecla de función usada para salir del programa

     D OA_FCRQ_F3      C                   Const( -4 )
     D OA_FCRQ_F12     C                   Const( -8 )
     D OA_FCRQ_NOTUSED...
     D                 C                   Const( 0 )

     D OA_SNDMG_EXIT_F3...
     D                 C                   Const( -4 )
     D OA_SNDMG_EXIT_F12...
     D                 C                   Const( -8 )
     D OA_SNDMG_EXIT_NOTUSED...
     D                 C                   Const( 0 )

    ‚ * Mostrar pantalla envío mensaje

     D OA_SHOW_YES     C                   Const( 'Y' )
     D OA_SHOW_NO      C                   Const( 'N' )

     D OA_SNDMG_SHOW_YES...
     D                 C                   Const( 'Y' )
     D OA_SNDMG_SHOW_NO...
     D                 C                   Const( 'N' )

    ‚ * Tipo de lista de nombres

     D OA_NMTY_USR     C                   Const( '*USR' )
     D OA_NMTY_DSP     C                   Const( '*DSP' )

     D OA_SNDMG_NAMTYP_USR...
     D                 C                   Const( '*USR' )
     D OA_SNDMG_NAMTYP_DSP...
     D                 C                   Const( '*DSP' )

    ‚ * ==================================================================
    ‚ * = DECLARACIÓN DE FUNCIONES Y PROCEDIMIENTOS PUBLICOS             =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - OA_sndMsg - Enviar mensaje                                     -
    ‚ * -                                                                -
    ‚ * - Send Message (QEZSNDMG) Operational Assistant                  -
    ‚ * -                                                                -
    ‚ * - Envía un mensaje a uno o más usuarios o estaciones de pantalla -
    ‚ * - y muestra, opcionalmente, la pantalla del Operational          -
    ‚ * - Assistant "Enviar Mensaje" antes de enviar el mensaje.         -
    ‚ * - Se tiene la posibilidad de cambiar los valores por defecto     -
    ‚ * - asignando valores a los distintos parámetros.                  -
    ‚ * - Este API combina las funcionalidades de los mandatos SNDMSG y  -
    ‚ * - SNDBRKMSG.                                                     -
    ‚ * ------------------------------------------------------------------

     D OA_sndMsg       PR                  ExtPgm( 'QEZSNDMG' )
    ‚D* Grupo Opcional 1
     D   msgType                           Const Like( TypeName )
     D                                           Options( *NOPASS )
     D   dlvry                             Const Like( TypeName )
     D                                           Options( *NOPASS )
     D   msgText                           Const Like( TypeBuffer )
     D                                           Options( *VARSIZE: *NOPASS )
     D   msgTextLen                        Const Like( TypeInt )
     D                                           Options( *NOPASS )
     D   listUsrDsp                        Const Like( TypeBuffer )
     D                                           Options( *VARSIZE: *NOPASS )
     D   nbrLstUsrDsp                      Const Like( TypeInt )
     D                                           Options( *NOPASS )
     D   msgSentInd                              Like( TypeInt )
     D                                           Options( *NOPASS )
     D   funRequest                              Like( TypeInt )
     D                                           Options( *NOPASS )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE: *NOPASS )
    ‚D* Grupo Opcional 2
     D   showDsp                           Const Like( TypeChar )
     D                                           Options( *NOPASS )
     D   msgqName                          Const Like( TypeQualName )
     D                                           Options( *NOPASS )
     D   nameTypInd                   4A   Const
     D                                           Options( *NOPASS )
    ‚D* Grupo Opcional 3
     D   CCSID                             Const Like( TypeInt )
     D                                           Options( *NOPASS )
