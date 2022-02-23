      /IF DEFINED( CEEFLOW_H )
      /EOF
      /ENDIF
      /DEFINE CEEFLOW_H

    � *
    � *  NOMBRE.......: CEEFLOW_H
    � *  DESCRIPCION..: Declaraci�n de tipos de datos y prototipos de
    � *                 funciones del conjunto de APIs enlazables de
    � *                 ILE CEE relacionadas con grupos de activaci�n y
    � *                 control de flujo.
    � *
    � *    El conjunto de APIs enlazables proporcionan funcionalidades
    � *    adicionales m�s all� de las suministradas por los lenguajes
    � *    de alto nivel (p.e. RPG). No todos los lenguajes de programaci�n
    � *    ofrecen las mismas funcionalidades y en algunos casos se pueden
    � *    complementar utilizando las API CEE apropiadas.
    � *
    � *    Un consejo, si su lenguaje de programaci�n suministra la misma
    � *    funcionalidad que alg�n grupo de estas APIs, es preferible que
    � *    utilice las espec�ficas del lenguaje de alto nivel.
    � *
    � *  Programador..: Javier Mora
    � *  Fecha........: Junio 2013
    � *
    � *  Historia:
    � *
    � *   Fecha   Programador        Observaciones
    � *  -------- ------------------ -------------
    � *  20.02.14 JMG                Incluir CEEUTX.
    � *
    � *  Usar como:
    � *
    � *    /Copy API,CEEFLOW_H
    � *
    � *  Notas:
    � *

    � * ==================================================================
    � * = OTROS FICHEROS DE CABECERA                                     =
    � * ==================================================================

      /COPY Api,StdTyp_H

    � * ==================================================================
    � * = DEFINICI�N DE TIPOS                                            =
    � * ==================================================================

      /If Not Defined( CEE_FEEDBACK_T_DEF )
      /Define CEE_FEEDBACK_T_DEF
     D CEE_feedback_T  S             12A   Based( apiTyp_ )
      /Endif


    � * ==================================================================
    � * = DECLARACI�N DE FUNCIONES Y PROCEDIMIENTOS PUBLICOS             =
    � * ==================================================================

    � * ------------------------------------------------------------------
    � * - CEERTX - Registrar procedimiento de terminaci�n para una       -
    � * -          entrada de la pila de llamada                         -
    � * -                                                                -
    � * - Register Call Stack Entry Termination User Exit Procedure      -
    � * -                                                                -
    � * - Interfaz que debe tener el procedimiento registrado:           -
    � * -                                                                -
    � * -   D termination_procedure...                                   -
    � * -   D                 PR                                         -
    � * -   D    info                         *   Const                  -
    � * -                                                                -
    � * ------------------------------------------------------------------

     D CEERTX          PR                  Extproc( 'CEERTX' )
     D   procedure                         Const Like( TypeProcPtr )
    �D* Grupo opcional 1:
     D   info                              Const Like( TypePtr )
     D                                           Options( *OMIT )
     D   fc                                      Like( CEE_feedback_T )
     D                                           Options( *OMIT )

    � * ------------------------------------------------------------------
    � * - CEEUTX - Elimina un procedimiento de terminaci�n previamente   -
    � * -          registrado con CEERTX.                                -
    � * -                                                                -
    � * - Unregister Call Stack Entry Termination User Exit Procedure    -
    � * ------------------------------------------------------------------

     D CEEUTX          PR                  ExtProc( 'CEEUTX' )
     D   procedure                         Const Like( TypeProcPtr )
    �D* Grupo opcional 1:
     D   fc                                      Like( CEE_feedback_T )
     D                                           Options( *OMIT )

    � * ------------------------------------------------------------------
    � * - CEE4RAGE - Registrar procedimiento de finalizaci�n de un       -
    � * -            grupo de activaci�n                                 -
    � * -                                                                -
    � * - Register Activation Group Exit Procedure                       -
    � * -                                                                -
    � * - Interfaz que debe tener el procedimiento registrado:           -
    � * -                                                                -
    � * -   D activation_group_exit...                                   -
    � * -   D                 PR                                         -
    � * -   D   ag_mark                     10U 0 Const                  -
    � * -   D   reason                      10U 0 Const                  -
    � * -   D   result_code                 10U 0                        -
    � * -   D   user_rc                     10U 0                        -
    � * -                                                                -
    � * ------------------------------------------------------------------

     D CEE4RAGE        PR                  Extproc( 'CEE4RAGE' )
     D   procedure                         Const Like( TypeProcPtr )
    �D* Grupo opcional 1:
     D   fc                                      Like( CEE_feedback_T )
     D                                           Options( *OMIT
     D                                                  : *VARSIZE )

    � * ------------------------------------------------------------------
    � * - CEE4RAGE2 - Registrar procedimiento de finalizaci�n de un      -
    � * -             grupo de activaci�n (versi�n de 64 bits)           -
    � * -                                                                -
    � * - Register Activation Group Exit Procedure                       -
    � * -                                                                -
    � * - Interfaz que debe tener el procedimiento registrado:           -
    � * -                                                                -
    � * -   D activation_group_exit...                                   -
    � * -   D                 PR                                         -
    � * -   D   ag_mark                     20U 0 Const                  -
    � * -   D   reason                      10U 0 Const                  -
    � * -   D   result_code                 10U 0                        -
    � * -   D   user_rc                     10U 0                        -
    � * -                                                                -
    � * ------------------------------------------------------------------

     D CEE4RAGE2       PR                  ExtProc( 'CEE4RAGE2' )
     D   procedure                         Const Like( TypeProcPtr )
    �D* Grupo opcional 1:
     D   fc                                      Like( CEE_feedback_T )
     D                                           Options( *OMIT
     D                                                  : *VARSIZE )
