      /If Defined( NLS_H )
      /Eof
      /Endif
      /Define NLS_H

    � *
    � *  NOMBRE.......: NLS_H
    � *  DESCRIPCION..: Declaraci�n de los tipos y prototipos para las
    � *                 APIs referidas al Soporte de Lenguas Nacionales.
    � *
    � *    Con estas APIs podr� manipular los datos en distintas lenguas   s
    � *    nacionles.
    � *
    � *  Programador..: Javier Mora
    � *  Fecha........: 27.01.2010
    � *
    � *  Historia:
    � *
    � *   Fecha   Programador        Observaciones
    � *  -------- ------------------ -------------
    � *  22.10.10 Javier Mora        Incluir prototipo para QLGCNVCS.
    � *                              A�adir 'Qualified' a las DSs
    � *                              NLS_reqCtlBlk_*
    � *                              Corregir tipo del primer par�metro en
    � *                              QlgConvertCase.
    � *  12.06.12 Javier Mora        Revisi�n definici�n tipos NLS*.
    � *
    � *  Usar como:
    � *
    � *    /Copy API,Nls_H
    � *
    � *  Notas:
    � *


    � * ==================================================================
    � * = OTROS FICHEROS DE CABECERA                                     =
    � * ==================================================================

      /Copy Api,StdTyp_H

    � * ==================================================================
    � * = DEFINICI�N DE CONSTANTES                                       =
    � * ==================================================================

    � * ==================================================================
    � * = DEFINICI�N DE TIPOS                                            =
    � * ==================================================================

    � * ------------------------------------------------------------------
    � * - Bloque de control de la petici�n para la API Convertir a       -
    � * - may�sculas o min�sculas.                                       -
    � * -                                                                -
    � * - API Convert Case (QLGCNVCS, QlgConvertCase)                    -
    � * ------------------------------------------------------------------

     D NLS_reqCtlblk_T...
     D                 S            512A   Based( apityp_ )

    � * ------------------------------------------------------------------
    � * - Para un petici�n de tipo CCSID (tipo 1)                        -
    � * ------------------------------------------------------------------
     D NLS_reqCtlBlk_ccsid_T...
     D                 DS                  Based( apityp_ )
     D                                     Qualified
     D                                     Align
     D   reqType                     10I 0
     D   ccsid                       10I 0
     D   caseReq                     10I 0
     D                               10A

    � * ------------------------------------------------------------------
    � * - Para un petici�n con tabla de conversi�n (tipo 2)              -
    � * ------------------------------------------------------------------
     D NLS_reqCtlBlk_table_T...
     D                 DS                  Based( apityp_ )
     D                                     Qualified
     D                                     Align
     D   reqType                     10I 0
     D   dbcs                        10I 0
     D   tabNamQ                     20A

    � * ------------------------------------------------------------------
    � * - Para un petici�n con tabla definida por el usuario (tipo 3)    -
    � * ------------------------------------------------------------------
     D NLS_reqCtlBlk_usrDef_T...
     D                 DS                  Based( apityp_ )
     D                                     Qualified
     D                                     Align
     D   reqType                     10I 0
     D   dbcs                        10I 0
     D                               10I 0
     D   lenUsrDefTab                10I 0
     D*  usrDefTab (Char *)

    � * ==================================================================
    � * = DECLARACI�N DE FUNCIONES Y PROCEDIMIENTOS PUBLICOS             =
    � * ==================================================================

    � * ------------------------------------------------------------------
    � * - QlgConvertCase - Convertir cadenas de caracteres a may�sculas  -
    � * -                  o min�sculas                                  -
    � * -                                                                -
    � * - Convert Case                                                   -
    � * ------------------------------------------------------------------

     D QlgConvertCase  PR                  ExtProc( 'QlgConvertCase' )
     D   reqCtlBlk                         Const Like( NLS_reqCtlBlk_T )
     D                                           Options( *VARSIZE )
     D   inpDta                            Const Like( TypeBuffer2 )
     D                                           Options( *VARSIZE )
     D   outDta                                  Like( TypeBuffer2 )
     D                                           Options( *VARSIZE )
     D   lenDta                            Const Like( TypeInt )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )

    � * ------------------------------------------------------------------
    � * - QLGCNVCS - Convertir cadenas de caracteres a may�sculas o      -
    � * -            min�sculas                                          -
    � * -                                                                -
    � * - Convert Case                                                   -
    � * ------------------------------------------------------------------

     D QLGCNVCS        PR                  ExtPgm( 'QLGCNVCS' )
     D   reqCtlBlk                         Const Like( NLS_reqCtlBlk_T )
     D                                           Options( *VARSIZE )
     D   inpDta                            Const Like( TypeBuffer2 )
     D                                           Options( *VARSIZE )
     D   outDta                                  Like( TypeBuffer2 )
     D                                           Options( *VARSIZE )
     D   lenDta                            Const Like( TypeInt )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )
