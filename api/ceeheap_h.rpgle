      /IF DEFINED( CEEHEAP_H )
      /EOF
      /ENDIF
      /DEFINE CEEHEAP_H

    � *
    � *  NOMBRE.......: CEEHEAP_H
    � *  DESCRIPCION..: Declaraci�n de tipos de datos y prototipos de
    � *                 funciones del conjunto de APIs enlazables de
    � *                 ILE CEE relacionadas con la gesti�n de la
    � *                 memoria din�mica (heap).
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
    � *    /Copy API,CEEHEAP_H
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
    � * - CEECRHP - Crear un espacio de memoria din�mica                 -
    � * -                                                                -
    � * - Create Heap                                                    -
    � * ------------------------------------------------------------------

     D CEECRHP         PR                  ExtProc( 'CEECRHP' )
     D   heapId                      10I 0
    �D* Grupo opcional 1:
     D   initSize                          Const Like( INT4_T )
     D                                           Options( *OMIT )
     D   increment                         Const Like( INT4_T )
     D                                           Options( *OMIT )
     D   allocStrat                        Const Like( INT4_T )
     D   fc                                      Like( CEE_feedback_T )
     D                                           Options( *OMIT )

    � * ------------------------------------------------------------------
    � * - CEEDSHP - Suprimir un espacio de memoria din�mica              -
    � * -                                                                -
    � * - Discard Heap                                                   -
    � * ------------------------------------------------------------------

     D CEEDSHP         PR                  ExtProc( 'CEEDSHP' )
     D   heapId                      10I 0 Const
    �D* Grupo opcional 1:
     D   fc                                      Like( CEE_feedback_T )
     D                                           Options( *OMIT )

    � * ------------------------------------------------------------------
    � * - CEEGTST - Reservar almacenamiento en la memoria din�mica       -
    � * -                                                                -
    � * - Get Heap Storage                                               -
    � * ------------------------------------------------------------------

     D CEEGTST         PR                  ExtProc( 'CEEGTST' )
     D   heapId                            Const Like( INT4_T )
     D   size                              Const Like( INT4_T )
     D   addr                                    Like( TypePtr )
    �D* Grupo opcional 1:
     D   fc                                      Like( CEE_feedback_T )
     D                                           Options( *OMIT )

    � * ------------------------------------------------------------------
    � * - CEEFRST - Libera almacenamiento asignado en la memoria         -
    � * -           din�mica                                             -
    � * -                                                                -
    � * - Free Storage                                                   -
    � * ------------------------------------------------------------------

     D CEEFRST         PR                  ExtProc( 'CEEFRST' )
     D   addr                                    Like( TypePtr )
    �D* Grupo opcional 1:
     D   fc                                      Like( CEE_feedback_T )
     D                                           Options( *OMIT )

    � * ------------------------------------------------------------------
    � * - CEECZST - Cambiar el tama�o de un bloque de almacenamiento     -
    � * -           asignado previamente                                 -
    � * -                                                                -
    � * - Reallocate Storage                                             -
    � * ------------------------------------------------------------------

     D CEECZST         PR                  ExtProc( 'CEECZST' )
     D   addr                                    Like( TypePtr )
     D   size                              Const Like( INT4_T )
    �D* Grupo opcional 1:
     D   fc                                      Like( CEE_feedback_T )
     D                                           Options( *OMIT )

