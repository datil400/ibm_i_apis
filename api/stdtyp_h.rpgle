      /IF DEFINED( STDTYP_H )
      /EOF
      /ENDIF
      /DEFINE STDTYP_H

    ‚ *
    ‚ *  NOMBRE.......: STDTYP_H
    ‚ *  DESCRIPCION..: Declaración de los tipos estándar de datos para su
    ‚ *                 usu en cualquier programa.
    ‚ *
    ‚ *  Programador..: Javier Mora
    ‚ *  Fecha........: 23.07.2004
    ‚ *
    ‚ *  Historia:
    ‚ *
    ‚ *   Fecha   Programador        Observaciones
    ‚ *  -------- ------------------ -------------
    ‚ *  11.01.10 Javier Mora        Nuevos tipos de datos TypeBuffer2,
    ‚ *                              TypeVarBuffer2  y TypeDec2 que
    ‚ *                              duplican el tamaño de los tipos
    ‚ *                              originales (sin el 2 final).
    ‚ *  22.11.12 Javier Mora        Nuevos nombres para algunos tipos.
    ‚ *
    ‚ *  Usar como:
    ‚ *
    ‚ *    /Copy API,StdTyp_H
    ‚ *
    ‚ *  Notas:
    ‚ *

      /IF NOT DEFINED( STDTYPE_DEF )
      /DEFINE STDTYPE_DEF
     D StdType_        S               *
      /ENDIF
     D ClassType_      S               *

     D TipoEstandar_   S                   Like( StdType_ )
     D TipoClase_      S                   Like( ClassType_ )

    ‚ * ==================================================================
    ‚ * = Tipos estándar usados en ILE RPG                               =
    ‚ * ==================================================================

     D TypeBin2        S              4B 0 Based( StdType_ )
     D TypeBin4        S              9B 0 Based( StdType_ )
     D TypeChar        S              1A   Based( StdType_ )
     D TypeDate        S               D   Based( StdType_ ) DatFmt( *ISO )
     D TypeLgl         S               N   Based( StdType_ )
     D TypeProcPtr     S               *   Based( StdType_ ) ProcPtr
     D TypePtr         S               *   Based( StdType_ )
     D TypeTime        S               T   Based( StdType_ ) TimFmt( *ISO )
     D TypeTimeStamp   S               Z   Based( StdType_ )

    ‚ * ==================================================================
    ‚ * = Tipos estándar usados por los APIs del sistema                 =
    ‚ * ==================================================================

     D TypeApiFormat   S              8A   Based( StdType_ )
     D TypeAPIError    DS                  Qualified
     D  bytesPrv                     10I 0 Inz( %Size( TypeAPIError ) )
     D  bytesAvl                     10I 0 Inz( *Zero )
     D  msgID                         7    Inz( *Blanks )
     D                                1    Inz( X'00' )
     D  msgDta                      256    Inz( *Blanks )
     D ERRC0100_T      DS                  LikeDs( TypeApiError ) Inz(*LIKEDS)

    ‚ * ==================================================================
    ‚ * = Tipos estándar usados para enlace con C                        =
    ‚ * ==================================================================

     D TypeBigInt      S             20I 0 based( StdType_ )
     D TypeDouble      S              8F   Based( StdType_ )
     D TypeFloat       S              4F   Based( StdType_ )
     D TypeInt         S             10I 0 Based( StdType_ )
     D TypeSmallInt    S              5I 0 Based( StdType_ )
     D TypeTinyInt     S              3i 0 Based( StdType_ )
     D TypeUnsignedBigInt...
     D                 S             20U 0 Based( StdType_ )
     D TypeUnsignedInt...
     D                 S             10U 0 Based( StdType_ )
     D TypeUnsignedSmallInt...
     D                 S              5U 0 Based( StdType_ )
     D TypeUnsignedTinyInt...
     D                 S              3U 0 Based( StdType_ )

     D Double_T        S              8F   Based( StdType_ )
     D Float_T         S              4F   Based( StdType_ )

     D INT8_T          S             20I 0 based( StdType_ )
     D INT4_T          S             10I 0 Based( StdType_ )
     D INT2_T          S              5I 0 Based( StdType_ )
     D INT1_T          S              3i 0 Based( StdType_ )

     D UINT8_T         S             20U 0 Based( StdType_ )
     D UINT4_T         S             10U 0 Based( StdType_ )
     D UINT2_T         S              5U 0 Based( StdType_ )
     D UINT1_T         S              3U 0 Based( StdType_ )

    ‚ * ==================================================================
    ‚ * = Tipos estándar del sistema                                     =
    ‚ * ==================================================================

     D TypeBuffer      S          32767A   Based( StdType_ )
     D TypeCommand     S           3000A   Based( StdType_ )
     D TypeDec         S             15P 5 Based( StdType_ )
     D TypeIntJobId    S             16A   Based( StdType_ )
     D TypeMessageId   S              7A   Based( StdType_ )
     D TypeName        S             10A   Based( StdType_ )
     D TypeQualJobName...
     D                 DS                  Based( StdType_ ) Qualified
     D  job                          10A
     D  user                         10A
     D  number                        6A
     D TypeQualName    DS                  Based( StdType_ ) Qualified
     D  name                               Like( TypeName )
     D  lib                                Like( TypeName )
     D TypeText        S             50A   Based( StdType_ )
     D TypeVarBuffer   S          32767A   Based( StdType_ ) Varying
     D TypeVarCommand  S           3000A   Based( StdType_ ) Varying
     D TypeVarName     S             10A   Based( StdType_ ) Varying
     D TypeVarText     S             50A   Based( StdType_ ) Varying

      /IF DEFINED( *V5R3M0 )
     D TypeBuffer2     S          65535A   Based( StdType_ )
     D TypeVarBuffer2  S          65535A   Based( StdType_ ) Varying
     D TypeDec2        S             30P10 Based( StdType_ )
      /ENDIF

    ‚ * ==================================================================
    ‚ * = Sin categoría                                                  =
    ‚ * ==================================================================

     D TypeQualFile    DS                  Based( StdType_ ) Qualified
     D  size                               Like( TypeSmallInt )
     D  name                               Like( TypeName )
     D  lib                                Like( TypeName )
     D  member                             Like( TypeName )
     D TypeString      S            256A   Based( StdType_ )
     D TypeToken       S             32A   Based( StdType_ )
     D TypeVarString   S            256A   Based( StdType_ ) Varying
     D TypeVarToken    S             32A   Based( StdType_ ) Varying

     D TypeClass       S               *   Based( StdType_ )
