      /If Defined( UXENVVAR_H )
      /Eof
      /Endif
      /Define UXENVVAR_H

    ‚ *
    ‚ *  NOMBRE.......: UXENVVAR_H
    ‚ *  DESCRIPCION..: Declaración de los tipos y prototipos para las
    ‚ *                 funciones de tipo Unix relacionadas con las
    ‚ *                 variables de entorno.
    ‚ *
    ‚ *  Programador..: Javier Mora
    ‚ *  Fecha........: 27.01.2010
    ‚ *
    ‚ *  Historia:
    ‚ *
    ‚ *   Fecha   Programador        Observaciones
    ‚ *  -------- ------------------ -------------
    ‚ *
    ‚ *  Usar como:
    ‚ *
    ‚ *    /Copy API,UxEnvVar_H
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

    ‚ * ==================================================================
    ‚ * = DEFINICIÓN DE TIPOS                                            =
    ‚ * ==================================================================

    ‚ * ==================================================================
    ‚ * = DECLARACIÓN DE FUNCIONES Y PROCEDIMIENTOS PUBLICOS             =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - Qp0zGetEnv - Obtener el valor de una variable de entorno de    -
    ‚ * -              nivel de trabajo.                                 -
    ‚ * -              Es una extensión de la función getenv() para      -
    ‚ * -              i5/OS.                                            -
    ‚ * -                                                                -
    ‚ * - Get value of environment variable (extended)                   -
    ‚ * ------------------------------------------------------------------

     D Qp0zGetEnv      PR              *   ExtProc( 'Qp0zGetEnv' )
     D   envvar                            Value Like( TypePtr )
     D                                           Options( *STRING )
     D   CCSID                                   Like( TypeInt )

    ‚ * ------------------------------------------------------------------
    ‚ * - Qp0zGetSysEnv - Obtener el valor de una variable de entorno de -
    ‚ * -                 nivel de sistema.                              -
    ‚ * -                                                                -
    ‚ * - Get value of system-level environment variable                 -
    ‚ * ------------------------------------------------------------------

     D Qp0zGetSysEnv   PR            10I 0 ExtProc( 'Qp0zGetSysEnv' )
     D   envvar                            Value Like( TypePtr )
     D                                           Options( *STRING )
     D   rtnBuffer                               Like( TypeBuffer2 )
     D                                           Options( *VARSIZE )
     D   bufLen                                  Like( TypeInt )
     D   CCSID                                   Like( TypeInt )
     D   reserved                                Like( TypePtr )
     D                                           Options( *OMIT )

