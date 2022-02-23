      /IF DEFINED( CEEDATE_H )
      /EOF
      /ENDIF
      /DEFINE CEEDATE_H

    ‚ *
    ‚ *  NOMBRE.......: CEEDATE_H
    ‚ *  DESCRIPCION..: Declaración de tipos de datos y prototipos de
    ‚ *                 funciones del conjunto de APIs enlazables del
    ‚ *                 ILE CEE relacionadas con fechas y horas.
    ‚ *
    ‚ *    El conjunto de APIs enlazables proporcionan funcionalidades
    ‚ *    adicionales más allá de las suministradas por los lenguajes
    ‚ *    de alto nivel (p.e. RPG). No todos los lenguajes de programación
    ‚ *    ofrecen las mismas funcionalidades y en algunos casos se pueden
    ‚ *    complementar utilizando las API CEE apropiadas.
    ‚ *
    ‚ *    Un consejo, si su lenguaje de programación suministra la misma
    ‚ *    funcionalidad que algún grupo de estas APIs, es preferible que
    ‚ *    utilice las específicas del lenguaje de alto nivel.
    ‚ *
    ‚ *  Programador..: Javier Mora
    ‚ *  Fecha........: 21.08.2007
    ‚ *
    ‚ *  Historia:
    ‚ *
    ‚ *   Fecha   Programador        Observaciones
    ‚ *  -------- ------------------ -------------
    ‚ *  01.09.11 JMG                Añadir más prototipos de funciones
    ‚ *                              de fecha ILE CEE.
    ‚ *  Jul 2013 JMG                Añadir CEEUTC.
    ‚ *  May 2015 JMG                Añadir CEEUTCO, CEEFMDA, CEEFMTM,
    ‚ *                              CEEFMDT, CEEQCEN
    ‚ *
    ‚ *  Usar como:
    ‚ *
    ‚ *    /COPY API,CEEDATE_H
    ‚ *
    ‚ *  Notas:
    ‚ *

    ‚ * ==================================================================
    ‚ * = OTROS FICHEROS DE CABECERA                                     =
    ‚ * ==================================================================

      /COPY Api,StdTyp_H

    ‚ * ==================================================================
    ‚ * = DEFINICIÓN DE TIPOS                                            =
    ‚ * ==================================================================

      /IF NOT DEFINED( CEE_FEEDBACK_T_DEF )
      /DEFINE CEE_FEEDBACK_T_DEF
     D CEE_feedback_T  S             12A   Based( apiTyp_ )
      /ENDIF

     D   CEE_seconds_T...
     D                 S                   Like( TypeDouble )
     D                                     Based( apiTyp_ )
     D   CEE_lilian_T...
     D                 S                   Like( TypeInt )
     D                                     Based( apiTyp_ )

    ‚ * ==================================================================
    ‚ * = DECLARACIÓN DE FUNCIONES Y PROCEDIMIENTOS PUBLICOS             =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - CEEDAYS - Convertir una fecha en formato "Lilian"              -
    ‚ * -                                                                -
    ‚ * - Convert Date to Lilian Format                                  -
    ‚ * ------------------------------------------------------------------

     D CEEDAYS         PR                  Opdesc
     D   charDate                   255A   Const Options( *VARSIZE )
     D   dateFmt                    255A   Const Options( *VARSIZE )
     D   lilianDate                              Like( CEE_lilian_T )
    ‚D* Grupo opcional 1:
     D   fc                                      Like( CEE_feedback_T )
     D                                           Options( *OMIT )

    ‚ * ------------------------------------------------------------------
    ‚ * - CEEDATE - Convertir una fecha "Lilian" en formato carácter     -
    ‚ * -                                                                -
    ‚ * - Convert Lilian Date to Character Format                        -
    ‚ * ------------------------------------------------------------------

     D CEEDATE         PR                  Opdesc
     D   lilianDate                        Const Like( CEE_lilian_T )
     D   dateFmt                    255A   Const Options( *VARSIZE )
     D   charDate                   255A         Options( *VARSIZE )
    ‚D* Grupo opcional 1:
     D   fc                                      Like( CEE_feedback_T )
     D                                           Options( *OMIT )

    ‚ * ------------------------------------------------------------------
    ‚ * - CEEDYWK - Convertir una fecha "Lilian" en día de la semana     -
    ‚ * -                                                                -
    ‚ * - Convert Day of Week from Lilian Date                           -
    ‚ * ------------------------------------------------------------------

     D CEEDYWK         PR                  Opdesc
     D   lilianDate                        Const Like( CEE_lilian_T )
     D   dayOfWeek                               Like( TypeInt )
    ‚D* Grupo opcional 1:
     D   fc                                      Like( CEE_feedback_T )
     D                                           Options( *OMIT )

    ‚ * ------------------------------------------------------------------
    ‚ * - CEESECS - Convertir marca de fecha y hora a segundos           -
    ‚ * -                                                                -
    ‚ * - Convert Timestamp to Number of Seconds                         -
    ‚ * ------------------------------------------------------------------

     D CEESECS         PR                  Opdesc
     D   timeStamp                  255A   Const Options( *VARSIZE )
     D   picture                    255A   Const Options( *VARSIZE )
     D   seconds                                 Like( CEE_seconds_T )
    ‚D* Grupo opcional 1:
     D   fc                                      Like( CEE_feedback_T )
     D                                           Options( *OMIT )

    ‚ * ------------------------------------------------------------------
    ‚ * - CEEDATM - Convertir segundos en una marca de fecha y hora      -
    ‚ * -                                                                -
    ‚ * - Convert Seconds to Character Timestamp                         -
    ‚ * ------------------------------------------------------------------

     D CEEDATM         PR                  Opdesc
     D   seconds                           Const Like( CEE_seconds_T )
     D   picture                           Const Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   timeStamp                               Like( TypeBuffer )
     D                                           Options( *VARSIZE )
    ‚D* Grupo opcional 1:
     D   fc                                      Like( CEE_feedback_T )
     D                                           Options( *OMIT )

    ‚ * ------------------------------------------------------------------
    ‚ * - CEELOCT - Obtener la hora local actual                         -
    ‚ * -                                                                -
    ‚ * - Get Current Local Time                                         -
    ‚ * ------------------------------------------------------------------

     D CEELOCT         PR                  Opdesc
     D   lilian                                  Like( CEE_lilian_T )
     D   seconds                                 Like( CEE_seconds_T )
     D   gregorian                   23A
    ‚D* Grupo opcional 1:
     D   fc                                      Like( CEE_feedback_T )
     D                                           Options( *OMIT )

    ‚ * ------------------------------------------------------------------
    ‚ * - CEESECI - Convertir segundos a enteros                         -
    ‚ * -                                                                -
    ‚ * - Convert Seconds to Integers                                    -
    ‚ * ------------------------------------------------------------------

     D CEESECI         PR                  Opdesc
     D   seconds                           Const Like( CEE_seconds_T )
     D   year                                    Like( TypeInt )
     D   month                                   Like( TypeInt )
     D   day                                     Like( TypeInt )
     D   hours                                   Like( TypeInt )
     D   minutes                                 Like( TypeInt )
     D   seconds                                 Like( TypeInt )
     D   miliseconds                             Like( TypeInt )
    ‚D* Grupo opcional 1:
     D   fc                                      Like( CEE_feedback_T )
     D                                           Options( *OMIT )

    ‚ * ------------------------------------------------------------------
    ‚ * - CEESCEN - Establecer siglo                                     -
    ‚ * -                                                                -
    ‚ * - Set Century                                                    -
    ‚ * ------------------------------------------------------------------

     D CEESCEN         PR
     D   centuryStart                      Const Like( TypeInt )
    ‚D* Grupo opcional 1:
     D   fc                                      Like( CEE_feedback_T )
     D                                           Options( *OMIT )

    ‚ * ------------------------------------------------------------------
    ‚ * - CEEQCEN - Consultar siglo                                      -
    ‚ * -                                                                -
    ‚ * - Query Century                                             V2R3 -
    ‚ * ------------------------------------------------------------------

     D CEEQCEN         PR
     D   centuryStart                            Like( TypeInt )
    ‚D* Grupo opcional 1:
     D   fc                                      Like( CEE_feedback_T )
     D                                           Options( *OMIT )

    ‚ * ------------------------------------------------------------------
    ‚ * - CEEUTC - Obtener la hora UTC actual.                           -
    ‚ * -                                                                -
    ‚ * - Get Universal Time Coordinated                                 -
    ‚ * ------------------------------------------------------------------

     D CEEUTC          PR
     D   lilian                                  Like( TypeInt )
     D   seconds                                 Like( TypeDouble )
    ‚D* Grupo opcional 1:
     D   fc                                      Like( CEE_feedback_T )
     D                                           Options( *OMIT )

    ‚ * ------------------------------------------------------------------
    ‚ * - CEEUTCO - Obtener el desplazamiento (o diferencia) de la hora  -
    ‚ * -           local respecto a la Hora Universal Coordinada (UTC). -
    ‚ * -                                                                -
    ‚ * - Get Offset from Universal Time Coordinated to Local Time  V2R3 -
    ‚ * ------------------------------------------------------------------

     D CEEUTCO         PR
     D   offs_hours                              Like( INT4_T )
     D   offs_minutes                            Like( INT4_T )
     D   offs_seconds                            Like( DOUBLE_T )
    ‚D* Grupo opcional 1:
     D   fc                                      Like( CEE_feedback_T )
     D                                           Options( *OMIT )

    ‚ * ------------------------------------------------------------------
    ‚ * - CEEFMDT - Formato de fecha y hora por defecto para el país o   -
    ‚ * -           región especificado.                                 -
    ‚ * -                                                                -
    ‚ * - Return Default Date and Time Strings for Country or RegionV2R3 -
    ‚ * ------------------------------------------------------------------

     D CEEFMDT         PR                  Opdesc
     D   country_region...
     D                                2A   Const
     D                                           Options( *OMIT )
     D   datetime_pic                            Like( TypeBuffer )
     D                                           Options( *VARSIZE )
    ‚D* Grupo opcional 1:
     D   fc                                      Like( CEE_feedback_T )
     D                                           Options( *OMIT )

    ‚ * ------------------------------------------------------------------
    ‚ * - CEEFMDA - Formato de fecha por defecto para el pais/región     -
    ‚ * -           especificado.                                        -
    ‚ * -                                                                -
    ‚ * - Return Default Date String for Country or Region          V2R3 -
    ‚ * ------------------------------------------------------------------

     D CEEFMDA         PR                  Opdesc
     D   country_region...
     D                                2A   Const
     D                                           Options( *OMIT )
     D   date_pic                                Like( TypeBuffer )
     D                                           Options( *VARSIZE )
    ‚D* Grupo opcional 1:
     D   fc                                      Like( CEE_feedback_T )
     D                                           Options( *OMIT )

    ‚ * ------------------------------------------------------------------
    ‚ * - CEEFMTM - Formato de hora por defecto para el pais/región      -
    ‚ * -           especificado.                                        -
    ‚ * -                                                                -
    ‚ * - Return Default Time String for Country or Region          V2R3 -
    ‚ * ------------------------------------------------------------------

     D CEEFMTM         PR                  Opdesc
     D   country_region...
     D                                2A   Const
     D                                           Options( *OMIT )
     D   time_pic                                Like( TypeBuffer )
     D                                           Options( *VARSIZE )
    ‚D* Grupo opcional 1:
     D   fc                                      Like( CEE_feedback_T )
     D                                           Options( *OMIT )
