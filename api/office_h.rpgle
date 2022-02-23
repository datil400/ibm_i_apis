      /If Defined( OFFICE_H )
      /Eof
      /Endif
      /Define OFFICE_H

    ‚ *
    ‚ *  NOMBRE.......: OFFICE_H
    ‚ *  DESCRIPCION..: Declaración de los tipos y prototipos para las
    ‚ *                 APIs relacionadas con oficina.
    ‚ *
    ‚ *    Estas APIs le permiten personalizar y acciones adicionales con
    ‚ *    los datos de Oficina.
    ‚ *
    ‚ *  Programador..: Javier Mora
    ‚ *  Fecha........: 19.08.2008
    ‚ *
    ‚ *  Historia:
    ‚ *
    ‚ *   Fecha   Programador        Observaciones
    ‚ *  -------- ------------------ -------------
    ‚ *  21.09.09 Javier Mora        Revisión de estilo.
    ‚ *                              Pierde compatibilidad con v.2
    ‚ *
    ‚ *  Usar como:
    ‚ *
    ‚ *    /Copy API,Office_H
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

     D ADDR_NORMAL     C                   Const( 0 )
     D ADDR_CC         C                   Const( 1 )
     D ADDR_BCC        C                   Const( 2 )

    ‚ * ==================================================================
    ‚ * = DEFINICIÓN DE TIPOS                                            =
    ‚ * ==================================================================

     D Qtmm_fileName_T...
     D                 S            255A   Based( apityp_ )
     D Qtmm_fromAddr_T...
     D                 S            256A   Based( apityp_ )

     D ADDT0100_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   nextOffset                  10I 0
     D   addrLen                     10I 0
     D   addrFormat                   8A
     D   distType                    10I 0
     D   reserved                    10I 0
     D   smtpAddr                   256A

    ‚ * ==================================================================
    ‚ * = DECLARACIÓN DE FUNCIONES Y PROCEDIMIENTOS PUBLICOS             =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - QtmmSendMail - Enviear correo MIME                             -
    ‚ * -                                                                -
    ‚ * - Send MIME mail ( QtmmSendMail )                                -
    ‚ * ------------------------------------------------------------------

     D QtmmSendMail    PR                  ExtProc( 'QtmmSendMail' )
     D   fileName                          Const Like( Qtmm_fileName_T )
     D                                           Options( *VARSIZE )
     D   fileNameLen                       Const Like( TypeInt )
     D   from                              Const Like( Qtmm_fromAddr_T )
     D                                           Options( *VARSIZE )
     D   fromLen                           Const Like( TypeInt )
     D   recipBuf                          Const LikeDs( ADDT0100_T )
     D                                           Dim( 32767 )
     D                                           Options( *VARSIZE )
     D   numRecips                         Const Like( TypeInt )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )

