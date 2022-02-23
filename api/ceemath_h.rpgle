      /IF DEFINED( CEEMATH_H )
      /EOF
      /ENDIF
      /DEFINE CEEMATH_H

    � *
    � *  NOMBRE.......: CEEMATH_H
    � *  DESCRIPCION..: Declaraci�n de tipos de datos y prototipos de
    � *                 funciones del conjunto de APIs enlazables de
    � *                 ILE CEE relacionadas con funciones matem�ticas.
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
    � *  Fecha........: Mayo 2015
    � *
    � *  Historia:
    � *
    � *   Fecha   Programador        Observaciones
    � *  -------- ------------------ -------------
    � *
    � *  Usar como:
    � *
    � *    /COPY API,CEEMATH_H
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

      /IF NOT DEFINED( CEE_FEEDBACK_T_DEF )
      /DEFINE CEE_FEEDBACK_T_DEF
     D CEE_feedback_T  S             12A   Based( apiTyp_ )
      /ENDIF


    � * ==================================================================
    � * = DECLARACI�N DE FUNCIONES Y PROCEDIMIENTOS PUBLICOS             =
    � * ==================================================================

    � * ------------------------------------------------------------------
    � * - CEERAN0 - Generaci�n de n�meros aleatorios                     -
    � * -                                                                -
    � * - Genera un n�mero pseudo aleatorio con un valor entre 0 y 1     -
    � * - (exclusive).                                                   -
    � * -                                                                -
    � * - Basic Random Number Generation (CEERAN0) API              V2R3 -
    � * ------------------------------------------------------------------

     D CEERAN0         PR                  ExtProc( 'CEERAN0' )
     D   seed                                    Like( INT4_T )                 TypeInt
     D   random_no                               Like( Double_T )               TypeDouble
    �D* Grupo opcional 1:
     D   fc                                      Like( CEE_feedback_T )
     D                                           Options( *OMIT )
