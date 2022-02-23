      /If Defined( CEEPROC_H )
      /Eof
      /Endif
      /Define CEEPROC_H

    � *
    � *  NOMBRE.......: CEEPROC_H
    � *  DESCRIPCION..: Declaraci�n de tipos de datos y prototipos de
    � *                 funciones del conjunto de APIs enlazables de
    � *                 ILE CEE relacionadas con llamadas a programas o
    � *                 procedimientos.
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
    � *  Fecha........: 13.08.2007
    � *
    � *  Historia:
    � *
    � *   Fecha   Programador        Observaciones
    � *  -------- ------------------ -------------
    � *  18.09.09 Javier Mora        Revisi�n de estilo.
    � *  22.09.11 Javier Mora        CEESGI y CEEDOD.
    � *
    � *  Usar como:
    � *
    � *    /Copy API,CEEPROC_H
    � *
    � *  Notas:
    � *

    � * ==================================================================
    � * = OTROS FICHEROS DE CABECERA                                     =
    � * ==================================================================

      /Copy Api,StdTyp_H

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
    � * - CEETSTA - Comprobar argumento omitido                          -
    � * -                                                                -
    � * - Test for Omitted Argument                                      -
    � * ------------------------------------------------------------------

     D CEETSTA         PR                  Extproc( 'CEETSTA' )
     D   isPressent                              Like( TypeInt )
     D   argNbr                            Const Like( TypeInt )
    �D* Grupo opcional 1:
     D   fc                                      Like( CEE_feedback_T )
     D                                           Options( *OMIT )

    � * ------------------------------------------------------------------
    � * - CEEGSI - Obtener informaci�n de la cadena                      -
    � * -                                                                -
    � * - Get String Information                                         -
    � * ------------------------------------------------------------------

     D CEEGSI          PR                  Extproc( 'CEEGSI' )
     D   posn                              Const Like( TypeInt )
     D   datatype                                Like( TypeInt )
     D   currlen                                 Like( TypeInt )
     D   maxlen                                  Like( TypeInt )
    �D* Grupo opcional 1:
     D   fc                                      Like( CEE_feedback_T )
     D                                           Options( *OMIT )

    � * ------------------------------------------------------------------
    � * - CEEDOD - Recuperar informaci�n del descriptor operacional      -
    � * -                                                                -
    � * - Retrieve Operational Descriptor Information                    -
    � * ------------------------------------------------------------------

     D CEEDOD          PR                  Extproc( 'CEEDOD' )
     D   posn                              Const Like( TypeInt )
     D   desctype                                Like( TypeInt )
     D   datatype                                Like( TypeInt )
     D   descinf1                                Like( TypeInt )
     D   descinf2                                Like( TypeInt )
     D   datalen                                 Like( TypeInt )
    �D* Grupo opcional 1:
     D   fc                                      Like( CEE_feedback_T )
     D                                           Options( *OMIT )
