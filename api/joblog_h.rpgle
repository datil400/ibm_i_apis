      /If Defined( JOBLOG_H )
      /Eof
      /Endif
      /Define JOBLOG_H

    ‚ *
    ‚ *  NOMBRE.......: JOBLOG_H
    ‚ *  DESCRIPCION..: Declaración de prototipos de las APIs para el
    ‚ *                 manejo de las anotaciones de trabajo (Job Logs).
    ‚ *
    ‚ *  Programador..: Javier Mora
    ‚ *  Fecha........: 16.05.2006
    ‚ *
    ‚ *  Historia:
    ‚ *
    ‚ *   Fecha   Programador        Observaciones
    ‚ *  -------- ------------------ -------------
    ‚ *  29.10.10 Javier Mora        Incluir constanta JOBLOG_LF para uso
    ‚ *                              con la api Qp0zLprintf.
    ‚ *
    ‚ *  Uso:
    ‚ *
    ‚ *    /Copy Api,JobLog_H
    ‚ *
    ‚ *  Notas:
    ‚ *

     D JOBLOG_LF       C                   Const( X'25' )

    ‚ * ------------------------------------------------------------------
    ‚ * - PrintfJobLog - Imprimir datos con formato en anotaciones de    -
    ‚ * -                trabajo.                                        -
    ‚ * -                                                                -
    ‚ * - Print Formatted Job Log Data (Qp0zLprintf)                     -
    ‚ * ------------------------------------------------------------------

     D PrintfJobLog    PR            10I 0 ExtProc( 'Qp0zLprintf' )
     D  formatString                   *   Value Options( *STRING )
     D                                 *   Value Options( *STRING: *NOPASS )
     D                                 *   Value Options( *STRING: *NOPASS )
     D                                 *   Value Options( *STRING: *NOPASS )
     D                                 *   Value Options( *STRING: *NOPASS )
     D                                 *   Value Options( *STRING: *NOPASS )
     D                                 *   Value Options( *STRING: *NOPASS )
     D                                 *   Value Options( *STRING: *NOPASS )
     D                                 *   Value Options( *STRING: *NOPASS )
     D                                 *   Value Options( *STRING: *NOPASS )
     D                                 *   Value Options( *STRING: *NOPASS )

     D Qp0zLprintf     PR            10I 0 ExtProc( 'Qp0zLprintf' )
     D  formatString                   *   Value Options( *STRING )
     D                                 *   Value Options( *STRING: *NOPASS )
     D                                 *   Value Options( *STRING: *NOPASS )
     D                                 *   Value Options( *STRING: *NOPASS )
     D                                 *   Value Options( *STRING: *NOPASS )
     D                                 *   Value Options( *STRING: *NOPASS )
     D                                 *   Value Options( *STRING: *NOPASS )
     D                                 *   Value Options( *STRING: *NOPASS )
     D                                 *   Value Options( *STRING: *NOPASS )
     D                                 *   Value Options( *STRING: *NOPASS )
     D                                 *   Value Options( *STRING: *NOPASS )
