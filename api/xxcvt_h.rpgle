      /IF DEFINED( XXCVT_H )
      /EOF
      /ENDIF
      /DEFINE XXCVT_H

    ‚ *
    ‚ *  NOMBRE.......: XXCVT_H
    ‚ *  DESCRIPCION..: Declaración de los prototipos de las funciones de
    ‚ *                 C especializadas en conversión de datos numéricos.
    ‚ *
    ‚ *    Este tipo de funciones son útiles cuando no se conoce el tipo
    ‚ *    de dato en tiempo de compilación.
    ‚ *
    ‚ *  Programador..: Javier Mora
    ‚ *  Fecha........: Febrero 2017
    ‚ *
    ‚ *  Historia:
    ‚ *
    ‚ *   Fecha   Programador        Observaciones
    ‚ *  -------- ------------------ -------------
    ‚ *
    ‚ *  Usar como:
    ‚ *
    ‚ *    /COPY API,XXCVT_H
    ‚ *
    ‚ *  Notas:
    ‚ *
    ‚ *    Declaraciones extraidas de QSYSINC/H,XXCVT (XXCVT.H)
    ‚ *

    ‚ * ==================================================================
    ‚ * = OTROS FICHEROS DE CABECERA                                     =
    ‚ * ==================================================================

      /COPY API,StdTyp_H

    ‚ * ==================================================================
    ‚ * = DEFINICIÓN DE TIPOS                                            =
    ‚ * ==================================================================

    ‚ * ==================================================================
    ‚ * = DECLARACIÓN DE FUNCIONES Y PROCEDIMIENTOS PUBLICOS             =
    ‚ * ==================================================================

    ‚/**
    ‚ *  Convertir coma flotante (double) a decimal empaquetado
    ‚ *
    ‚ *  QXXDTOP() - Convert Double to Packed Decimal
    ‚ *
    ‚ *  void QXXDTOP(unsigned char *pptr, int digits, int fraction,
    ‚ *               double value);
    ‚ */

     D QXXDTOP         PR                  ExtProc( 'QXXDTOP' )
     D   packed                            Value Like( TypePtr )
     D   digits                            Value Like( TypeInt )
     D   fraction                          Value Like( TypeInt )
     D   value                             Value Like( TypeDouble )

     D DoubleToPacked  PR                  ExtProc( 'QXXDTOP' )
     D   packed                            Value Like( TypePtr )
     D   digits                            Value Like( TypeInt )
     D   fraction                          Value Like( TypeInt )
     D   value                             Value Like( TypeDouble )

    ‚/**
    ‚ *  Convertir coma flotante (double) a decimal con zona
    ‚ *
    ‚ *  QXXDTOZ() - Convert Double to Zoned Decimal
    ‚ *
    ‚ *  void QXXDTOZ(unsigned char *zptr, int digits, int fraction,
    ‚ *               double value);
    ‚ */

     D QXXDTOZ         PR                  ExtProc( 'QXXDTOZ' )
     D   zoned                             Value Like( TypePtr )
     D   digits                            Value Like( TypeInt )
     D   fraction                          Value Like( TypeInt )
     D   value                             Value Like( TypeDouble )

     D DoubleToZoned   PR                  ExtProc( 'QXXDTOZ' )
     D   zoned                             Value Like( TypePtr )
     D   digits                            Value Like( TypeInt )
     D   fraction                          Value Like( TypeInt )
     D   value                             Value Like( TypeDouble )

    ‚/**
    ‚ *  Convertir entero a decimal empaquetado
    ‚ *
    ‚ *  QXXITOP() - Convert Integer to Packed Decimal
    ‚ *
    ‚ *  void QXXITOP(unsigned char *pptr, int digits, int fraction,
    ‚ *               int value);
    ‚ */

     D QXXITOP         PR                  ExtProc( 'QXXITOP' )
     D   packed                            Value Like( TypePtr )
     D   digits                            Value Like( TypeInt )
     D   fraction                          Value Like( TypeInt )
     D   value                             Value Like( TypeInt )

     D IntToPacked     PR                  ExtProc( 'QXXITOP' )
     D   packed                            Value Like( TypePtr )
     D   digits                            Value Like( TypeInt )
     D   fraction                          Value Like( TypeInt )
     D   value                             Value Like( TypeInt )

    ‚/**
    ‚ *  Convertir entero a decimal con zona
    ‚ *
    ‚ *  QXXITOZ() - Convert Integer to Zoned Decimal
    ‚ *
    ‚ *  void QXXITOZ(unsigned char *zptr, int digits, int fraction,
    ‚ *               int value);
    ‚ */

     D QXXITOZ         PR                  ExtProc( 'QXXITOZ' )
     D   zoned                             Value Like( TypePtr )
     D   digits                            Value Like( TypeInt )
     D   fraction                          Value Like( TypeInt )
     D   value                             Value Like( TypeInt )

     D IntToZoned      PR                  ExtProc( 'QXXITOZ' )
     D   zoned                             Value Like( TypePtr )
     D   digits                            Value Like( TypeInt )
     D   fraction                          Value Like( TypeInt )
     D   value                             Value Like( TypeInt )

    ‚/**
    ‚ *  Convertir decimal empaquetado a entero
    ‚ *
    ‚ *  QXXPTOI() - Convert Packed Decimal to Integer
    ‚ *
    ‚ *  int QXXPTOI(unsigned char *pptr, int digits, int fraction);
    ‚ */

     D QXXPTOI         PR                  Like( TypeInt )
     D                                     ExtProc( 'QXXPTOI' )
     D   packed                            Value Like( TypePtr )
     D   digits                            Value Like( TypeInt )
     D   fraction                          Value Like( TypeInt )

     D PackedToInt     PR                  Like( TypeInt )
     D                                     ExtProc( 'QXXPTOI' )
     D   packed                            Value Like( TypePtr )
     D   digits                            Value Like( TypeInt )
     D   fraction                          Value Like( TypeInt )

    ‚/**
    ‚ *  Convertir decimal empaquetado a coma flotante (double)
    ‚ *
    ‚ *  QXXPTOD() - Convert Packed Decimal to Double
    ‚ *
    ‚ *  double QXXPTOD(unsigned char *pptr, int digits, int fraction);
    ‚ */

     D QXXPTOD         PR                  Like( TypeDouble )
     D                                     ExtProc( 'QXXPTOD' )
     D   packed                            Value Like( TypePtr )
     D   digits                            Value Like( TypeInt )
     D   fraction                          Value Like( TypeInt )

     D PackedToDouble  PR                  Like( TypeDouble )
     D                                     ExtProc( 'QXXPTOD' )
     D   packed                            Value Like( TypePtr )
     D   digits                            Value Like( TypeInt )
     D   fraction                          Value Like( TypeInt )

    ‚/**
    ‚ *  Convertir decimal con zona a coma flotante (double)
    ‚ *
    ‚ *  QXXZTOD() - Convert Zoned Decimal to Double
    ‚ *
    ‚ *  double QXXZTOD(unsigned char *zptr, int digits, int fraction);
    ‚ */

     D QXXZTOD         PR                  Like( TypeDouble )
     D                                     ExtProc( 'QXXZTOD' )
     D   zoned                             Value Like( TypePtr )
     D   digits                            Value Like( TypeInt )
     D   fraction                          Value Like( TypeInt )

     D ZonedToDouble   PR                  Like( TypeDouble )
     D                                     ExtProc( 'QXXZTOD' )
     D   zoned                             Value Like( TypePtr )
     D   digits                            Value Like( TypeInt )
     D   fraction                          Value Like( TypeInt )

    ‚/**
    ‚ *  Convertir decimal con zona a entero
    ‚ *
    ‚ *  QXXZTOI() - Convert Zoned Decimal to Integer
    ‚ *
    ‚ *  int QXXZTOI(unsigned char *zptr, int digits, int fraction);
    ‚ */

     D QXXZTOI         PR                  Like( TypeInt )
     D                                     ExtProc( 'QXXZTOI' )
     D   zoned                             Value Like( TypePtr )
     D   digits                            Value Like( TypeInt )
     D   fraction                          Value Like( TypeInt )

     D ZonedToInt      PR                  Like( TypeInt )
     D                                     ExtProc( 'QXXZTOI' )
     D   zoned                             Value Like( TypePtr )
     D   digits                            Value Like( TypeInt )
     D   fraction                          Value Like( TypeInt )

      /IF DEFINED(*V6R1M0)
    ‚ * Incluidas a partir de:
    ‚ *
    ‚ * SI46981 V6R1M0  20-07-2016
    ‚ * SI47250 V7R1M0  12-10-2016

    ‚/**
    ‚ *  Convertir entero largo a decimal empaquetado
    ‚ *
    ‚ *  QXXLLTOP() - Convert Long Long to Packed Decimal
    ‚ *
    ‚ *  void QXXLLTOP(unsigned char *, int, int, long long);
    ‚ */

     D QXXLLTOP        PR                  ExtProc( 'QXXLLTOP' )
     D   packed                            Value Like( TypePtr )
     D   digits                            Value Like( TypeInt )
     D   fraction                          Value Like( TypeInt )
     D   value                             Value Like( TypeBigInt )

     D LongToPacked    PR                  ExtProc( 'QXXLLTOP' )
     D   packed                            Value Like( TypePtr )
     D   digits                            Value Like( TypeInt )
     D   fraction                          Value Like( TypeInt )
     D   value                             Value Like( TypeBigInt )

    ‚/**
    ‚ *  Convertir entero largo a decimal con zona
    ‚ *
    ‚ *  QXXLLTOZ() - Convert Long Long to Zoned Decimal
    ‚ *
    ‚ *  void QXXLLTOZ(unsigned char *, int, int, long long);
    ‚ */

     D QXXLLTOZ        PR                  ExtProc( 'QXXLLTOZ' )
     D   zoned                             Value Like( TypePtr )
     D   digits                            Value Like( TypeInt )
     D   fraction                          Value Like( TypeInt )
     D   value                             Value Like( TypeBigInt )

     D LongToZoned     PR                  ExtProc( 'QXXLLTOZ' )
     D   zoned                             Value Like( TypePtr )
     D   digits                            Value Like( TypeInt )
     D   fraction                          Value Like( TypeInt )
     D   value                             Value Like( TypeBigInt )

    ‚/**
    ‚ *  Convertir decimal empaquetado a entero largo
    ‚ *
    ‚ *  QXXPTOLL() - Convert Packed Decimal to Long Long
    ‚ *
    ‚ *  long long QXXPTOLL(unsigned char *, int, int);
    ‚ */

     D QXXPTOLL        PR                  Like( TypeBigInt )
     D                                     ExtProc( 'QXXPTOLL' )
     D   packed                            Value Like( TypePtr )
     D   digits                            Value Like( TypeInt )
     D   fraction                          Value Like( TypeInt )

     D PackedToLong    PR                  Like( TypeBigInt )
     D                                     ExtProc( 'QXXPTOLL' )
     D   packed                            Value Like( TypePtr )
     D   digits                            Value Like( TypeInt )
     D   fraction                          Value Like( TypeInt )

    ‚/**
    ‚ *  Convertir decimal empaquetado a entero largo
    ‚ *
    ‚ *  QXXZTOLL() - Convert Zoned Decimal to Long Long
    ‚ *
    ‚ *  long long QXXZTOLL(unsigned char *, int, int);
    ‚ */

     D QXXZTOLL        PR                  Like( TypeBigInt )
     D                                     ExtProc( 'QXXZTOLL' )
     D   zoned                             Value Like( TypePtr )
     D   digits                            Value Like( TypeInt )
     D   fraction                          Value Like( TypeInt )

     D ZonedToLong     PR                  Like( TypeBigInt )
     D                                     ExtProc( 'QXXZTOLL' )
     D   zoned                             Value Like( TypePtr )
     D   digits                            Value Like( TypeInt )
     D   fraction                          Value Like( TypeInt )
      /ENDIF
