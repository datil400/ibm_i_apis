      /IF DEFINED( STDC_H )
      /EOF
      /ENDIF
      /DEFINE STDC_H

    ‚ *
    ‚ *  NOMBRE.......: STDC_H
    ‚ *  DESCRIPCION..: Declaración de prototipos de la biblioteca de
    ‚ *                 funciones estándar de ILE C.
    ‚ *
    ‚ *  Programador..: Javier Mora
    ‚ *  Fecha........: 27.08.2004
    ‚ *
    ‚ *  Historia:
    ‚ *
    ‚ *   Fecha   Programador        Observaciones
    ‚ *  -------- ------------------ -------------
    ‚ *  Abr 2012 JMG                Incluir varias funciones C.
    ‚ *  10.12.12 JMG                bsearch().
    ‚ *  May 2015 JMG                timeval, timezone, gettimeofday(),
    ‚ *                              Qp0zCvtToMITime(), Qp0zCvtToTimeval()
    ‚ *  22.09.15 JMG                Redefinir 'strtok'.
    ‚ *  Ene 2017 JMG                memcmp, strlen
    ‚ *
    ‚ *  Usar como:
    ‚ *
    ‚ *    /Copy API,StdC_H
    ‚ *
    ‚ *  Notas:
    ‚ *
    ‚ *    Recuerde que para utilizar todas las funciones relacionadas en
    ‚ *    este miembro fuente es necesario enlazar el programa con el
    ‚ *    directorio de enlace QC2LE.
    ‚ *
    ‚ *    ¡Atención! Este fuente podría subdividirse en varios en un
    ‚ *    futuro.
    ‚ *

      /COPY API,StdTyp_H

    ‚ *  typedef unsigned int   size_t;

     D size_t          S             10U 0
      /IF DEFINED(*V6R1M0)
     D                                     Template
      /ELSE
     D                                     Based( StdType_ )
      /ENDIF


    ‚ * ------------------------------------------------------------------
    ‚ * - atoi - Convertir alfanumérico en número entero                 -
    ‚ * ------------------------------------------------------------------

     D atoi            PR            10I 0 ExtProc( 'atoi' )
     D  alpha                          *   Value Options( *STRING )

    ‚ * ------------------------------------------------------------------
    ‚ * - qsort - Quick Sort                                             -
    ‚ * ------------------------------------------------------------------

     D qsort           PR                  ExtProc( 'qsort' )
     D   base                              Value Like( TypePtr )
     D   num                               Value Like( size_t )
     D   width                             Value Like( size_t )
     D   compare                           Value Like( TypeProcPtr )

    ‚ * ------------------------------------------------------------------
    ‚ * - bsearch - Binary search <stdlib.h>                             -
    ‚ * ------------------------------------------------------------------

     D bsearch         PR                        Like( TypePtr )
     D                                     ExtProc( 'bsearch' )
     D   key                               Value Like( TypePtr )
     D   base                              Value Like( TypePtr )
     D   num                               Value Like( size_t )
     D   size                              Value Like( size_t )
     D   compare                           Value Like( TypeProcPtr )

    ‚ * ==================================================================
    ‚ * = <string.h>                                                     =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - strtok - Tokenize string                                       -
    ‚ * -                                                                -
    ‚ * - char *strtok( char *string, const char *delimiters );          -
    ‚ * ------------------------------------------------------------------

      /IF DEFINED( STDC_STRTOK )
     D strtok          PR                  Like( TypePtr )
     D                                     ExtProc( 'strtok' )
     D   string                            Value Like( TypePtr )
     D   delimiters                        Value Like( TypePtr )
     D                                           Options( *STRING )
      /ELSE
    ‚ *
    ‚ *  Este prototipo está mal declarado, ya que el parámetro 'string'
    ‚ *  se modifica en cada llamada a 'strtok'. Por lo tanto, no se
    ‚ *  debería utilizar la cláusula 'OPTIONS(*STRING)', ya que su
    ‚ *  función es crear una copia 'temporal' del valor del parámetro
    ‚ *  añadiéndole al final el valor 'nulo' (X'00').
    ‚ *
    ‚ *  Aunque no se han detectado problemas visibles cuando se ha
    ‚ *  utilizado, podrían ocurrir de forma inesperada (al cambiar
    ‚ *  versión, actualizar PTFs, etc.).
    ‚ *
    ‚ *  ¡NO SE RECOMIENDA SU USO!
    ‚ *
     D strtok          PR              *   ExtProc( 'strtok' )
     D   string                        *   Value Options( *STRING )
     D   delimiters                    *   Value Options( *STRING )
      /ENDIF

    ‚ * ------------------------------------------------------------------
    ‚ * - memcpy - Copy bytes                                            -
    ‚ * -                                                                -
    ‚ * - void    *memcpy    ( void *, const void *, size_t );           -
    ‚ * ------------------------------------------------------------------

     D memcpy          PR                  Like( TypePtr )
     D                                     ExtProc( '__memcpy' )
     D   target                            Value Like( TypePtr )
     D   source                            Value Like( TypePtr )
     D   size                              Value Like( size_t )

    ‚ * ------------------------------------------------------------------
    ‚ * - memcmp - Compare buffers                                       -
    ‚ * -                                                                -
    ‚ * - int      memcmp    ( const void *, const void *, size_t );     -
    ‚ * ------------------------------------------------------------------

     D memcmp          PR                  Like( TypeInt )
     D                                     ExtProc( '__memcmp' )
     D   buf1                              Value Like( TypePtr )
     D   buf2                              Value Like( TypePtr )
     D   size                              Value Like( size_t )

    ‚ * ------------------------------------------------------------------
    ‚ * - strlen - Determine String Length                               -
    ‚ * -                                                                -
    ‚ * - size_t   strlen    ( const char * );                           -
    ‚ * ------------------------------------------------------------------

     D strlen          PR                  Like( size_t )
     D                                     ExtProc( '__strlen' )
     D   string                            Value Like( TypePtr )
     D                                           Options( *STRING )

    ‚ * ==================================================================
    ‚ * = <sys/time.h>                                                   =
    ‚ * ==================================================================

      /IF NOT DEFINED( SOCKET_H )
    ‚ * ------------------------------------------------------------------
    ‚ *  struct timeval {
    ‚ *    long  tv_sec;
    ‚ *    long  tv_usec;
    ‚ *  };
    ‚ * ------------------------------------------------------------------

     D timeval         DS                  Align Qualified
      /IF DEFINED( *V6R1M0 )
     D                                     Template
      /ELSE
     D                                     Based( StdType_ )
      /ENDIF
     D   tv_sec                      10I 0                                      Segundos
     D   tv_usec                     10I 0                                      Microsegundos
      /ENDIF

    ‚ * ------------------------------------------------------------------
    ‚ *  struct timezone {
    ‚ *      int  tz_minuteswest;         /* minutes west of Greenwich */
    ‚ *      int  tz_dsttime;             /* daylight savings time flag */
    ‚ *   };
    ‚ * ------------------------------------------------------------------

     D timezone        DS                  Align Qualified
      /IF DEFINED( *V6R1M0 )
     D                                     Template
      /ELSE
     D                                     Based( StdType_ )
      /ENDIF
     D   tz_minuteswest...
     D                               10I 0
     D   tz_dsttime                  10I 0

    ‚ * ------------------------------------------------------------------
    ‚ *  gettimeofday - Obtener la fecha UTC actual
    ‚ *
    ‚ *  int gettimeofday (struct timeval *tp,
    ‚ *                    struct timezone *tzp);
    ‚ *
    ‚ *  EPOCH = 1970-01-01 00:00:00 (UTC)
    ‚ *
    ‚ *  Get Current UTC Time
    ‚ * ------------------------------------------------------------------

     D gettimeofday    PR            10I 0 Extproc( 'gettimeofday' )
     D   time                          *   Value
     D   timezone                      *   Value

    ‚ * ==================================================================
    ‚ * = <mih/micommon.h>                                               =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ *  typedef char _MI_Time[8];
    ‚ * ------------------------------------------------------------------

     D MI_Time         S              8A
      /IF DEFINED( *V6R1M0 )
     D                                     Template
      /ELSE
     D                                     Based( StdType_ )
      /ENDIF

    ‚ * ==================================================================
    ‚ * = QSYSINC/H,qp0z1170  <qp0z1170.h>                               =
    ‚ * ==================================================================

    ‚ *
    ‚ *  Valores especiales del párametro 'option' de la función
    ‚ *  Qp0zCvtToMITime() y Qp0zCvtToTimeval()
    ‚ *

     D QP0Z_CVTTIME_TO_OFFSET...
     D                 C                   0
     D QP0Z_CVTTIME_TO_TIMESTAMP...
     D                 C                   1
     D QP0Z_CVTTIME_FACTOR_EPOCH_ONLY...
     D                 C                   2
     D QP0Z_CVTTIME_FACTOR_UTCOFFSET_ONLY...
     D                 C                   3

    ‚ * ------------------------------------------------------------------
    ‚ *  Qp0zCvtToMITime - Convierte la estructura 'timeval' al formato
    ‚ *                    interno de la Interfaz de Máquina (MI)
    ‚ *
    ‚ *  int Qp0zCvtToMITime (_MI_Time to,
    ‚ *                       const struct timeval *from,
    ‚ *                       int option);
    ‚ *
    ‚ *  Convert Timeval Structure to _MI_Time
    ‚ * ------------------------------------------------------------------

     D Qp0zCvtToMITime...
     D                 PR            10I 0 ExtProc( 'Qp0zCvtToMITime' )
     D   to                                      Like( MI_Time )
     D   from                                    Like( timeval )
     D   option                            Value Like( TypeInt )

    ‚ * ------------------------------------------------------------------
    ‚ *  Qp0zCvtToTimeval - Convierte el formato MI de fecha y hora en la
    ‚ *                     estructura 'timeval'.
    ‚ *
    ‚ *  int Qp0zCvtToTimeval (struct timeval *to,
    ‚ *                        const _MI_Time from,
    ‚ *                        int option);
    ‚ *
    ‚ *  Convert _MI_Time to Timeval Structure
    ‚ * ------------------------------------------------------------------

     D Qp0zCvtToTimeval...
     D                 PR            10I 0 ExtProc( 'Qp0zCvtToTimeval' )
     D   to                                      Like( timeval )
     D   from                                    Like( MI_Time )
     D   option                            Value Like( TypeInt )

