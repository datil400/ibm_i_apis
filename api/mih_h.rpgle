      /IF DEFINED( MIH_H )
      /EOF
      /ENDIF
      /DEFINE MIH_H

    ‚ *
    ‚ *  NOMBRE.......: MIH_H
    ‚ *  DESCRIPCION..: Declaración de lo tipos y prototipos para las
    ‚ *                 funciones de la interfaz de máquina (MI)
    ‚ *
    ‚ *  Programador..: Javier Mora
    ‚ *  Fecha........: 18.12.2007
    ‚ *
    ‚ *  Historia:
    ‚ *
    ‚ *   Fecha   Programador        Observaciones
    ‚ *  -------- ------------------ -------------
    ‚ *  30.06.08 Javier Mora        Añadidas las funciones _LBEDIT y
    ‚ *                              _MEMMOVE.
    ‚ *  02.10.12 Javier Mora        Incluir _CPYBYTES.
    ‚ *  May 2013 Javier Mora        Incluir _MODINVAU.
    ‚ *  Abr 2014 Javier Mora        Incluir _MATMATR1, _MATRMD, tstbts,
    ‚ *                              cvtch, cvthc
    ‚ *
    ‚ *  Usar como:
    ‚ *
    ‚ *    /COPY API,Mih_H
    ‚ *
    ‚ *  Notas:
    ‚ *

    ‚ * ==================================================================
    ‚ * = OTROS FICHEROS DE CABECERA                                     =
    ‚ * ==================================================================

      /COPY Api,StdTyp_H

    ‚ * ==================================================================
    ‚ * = DEFINICIÓN DE CONSTANTES                                       =
    ‚ * ==================================================================

    ‚ * TIPOS NUMÉRICOS

     D MIH_T_SIGNED    C                   X'00'
     D MIH_T_INT       C                   X'00'
     D MIH_T_FLOAT     C                   X'01'
     D MIH_T_ZONED     C                   X'02'
     D MIH_T_PACKED    C                   X'03'
     D MIH_T_CHAR      C                   X'04'
     D MIH_T_ONLYNS    C                   X'06'
     D MIH_T_ONLYN     C                   X'07'
     D MIH_T_EITHER    C                   X'08'
     D MIH_T_OPEN      C                   X'09'
     D MIH_T_UNSIGNED  C                   X'0A'

    ‚D* Valores para MODINVAU:
    ‚D*
     D MIH_ALLOW_ADOPT...
     D                 C                   X'00'
     D MIH_DONT_ALLOW_ADOPT...
     D                 C                   X'01'

    ‚ * ==================================================================
    ‚ * = DEFINICIÓN DE TIPOS                                            =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - Atributos del valor numérico                                   -
    ‚ * -                                                                -
    ‚ * - Data Pointer Attr template                                     -
    ‚ * ------------------------------------------------------------------

     D DPA_template_T  DS                  Qualified
     D   type                         1A
     D   length                       5I 0
     D    decPos                      3I 0 Overlay( length: 1 )
     D    totDig                      3I 0 Overlay( length: 2 )
     D   reserved                    10I 0 Inz

     D MIH_mask_T      DS                  Based( apityp_ )
     D                                     Qualified
     D  curSym                        1A
     D  comSym                        1A
     D  decPntSym                     1A

    ‚ * ==================================================================
    ‚ * = DECLARACIÓN DE FUNCIONES Y PROCEDIMIENTOS PUBLICOS             =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - CVTEFN - Convertir formato externo a numérico                  -
    ‚ * -                                                                -
    ‚ * - Convert external format to numeric (_CVTEFN)                   -
    ‚ * ------------------------------------------------------------------

     D CVTEFN          PR                  ExtProc( '_CVTEFN' )
     D   rcvVar                            Value Like( TypePtr )
     D   rcvAtr                            Const Like( DPA_Template_T )
     D   source                            Value Like( TypePtr )
     D   srcLen                            Const Like( TypeUnsignedInt )
     D   symMsk                            Const Like( MIH_mask_T )

    ‚ * ------------------------------------------------------------------
    ‚ * - cvtefnd - Convertir formato externo a numérico de coma flotante-
    ‚ * -                                                                -
    ‚ * - Convert external format to numeric -- double float (cvtefnd)   -
    ‚ * ------------------------------------------------------------------

     D cvtefnd         PR             8F   ExtProc( 'cvtefnd' )
     D   src                               Value Like( TypePtr )
     D   srclen                            Value Like( TypeUnsignedInt )
     D   symMsk                            Const Like( MIH_mask_T )

    ‚ * ------------------------------------------------------------------
    ‚ * - cvtefni - Convertir formato externo a numérico entero          -
    ‚ * -                                                                -
    ‚ * - Convert external format to numeric -- integer (cvtefni)        -
    ‚ * ------------------------------------------------------------------

     D cvtefni         PR            10I 0 ExtProc( 'cvtefni' )
     D   src                               Value Like( TypePtr )
     D   srclen                            Value Like( TypeUnsignedInt )
     D   symMsk                            Const Like( MIH_mask_T )

    ‚ * ------------------------------------------------------------------
    ‚ * - LBCPYNV - Copiar variable numérica                             -
    ‚ * -                                                                -
    ‚ * - Late bound copy numeric variable (_LBCPYNV)                    -
    ‚ * ------------------------------------------------------------------

     D LBCPYNV         PR                  ExtProc( '_LBCPYNV' )
     D   target                            Value Like( TypePtr )
     D   target_tpl                        Const Like( DPA_Template_T )
     D   source                            Value Like( TypePtr )
     D   source_tpl                        Const Like( DPA_Template_T )

    ‚ * ------------------------------------------------------------------
    ‚ * - LBCPYNV - Copiar variable numérica con redondeo                -
    ‚ * -                                                                -
    ‚ * - Late bound copy numeric variable with rounding (_LBCPYNVR)     -
    ‚ * ------------------------------------------------------------------

     D LBCPYNVR        PR                  ExtProc( '_LBCPYNVR' )
     D   target                            Value Like( TypePtr )
     D   target_tpl                        Const Like( DPA_Template_T )
     D   source                            Value Like( TypePtr )
     D   source_tpl                        Const Like( DPA_Template_T )

    ‚ * ------------------------------------------------------------------
    ‚ * - LBEDIT - Transforma un valor numérico (en formato interno) en  -
    ‚ * -          una cadena de caracteres                              -
    ‚ * -                                                                -
    ‚ * - Edit (_LBEDIT)                                                 -
    ‚ * ------------------------------------------------------------------

     D LBEDIT          PR                  ExtProc( '_LBEDIT' )
     D   rcvVar                            Value Like( TypePtr )
     D   rcvVarLen                         Const Like( TypeUnsignedInt )
     D   srcVar                            Value Like( TypePtr )
     D   srcVarAtr                         Const Like( DPA_Template_T )
     D   edtMsk                     256A   Const
     D   edtMskLen                         Const Like( TypeUnsignedInt )

    ‚ * ------------------------------------------------------------------
    ‚ * - MEMMOVE - Copiar un área de memoria                            -
    ‚ * -                                                                -
    ‚ * - Memory Move (_MEMMOVE)                                         -
    ‚ * ------------------------------------------------------------------

     D MEMMOVE         PR              *   ExtProc( '_MEMMOVE' )
     D   outAddr                           Value Like( TypePtr )
     D   inpAddr                           Value Like( TypePtr )
     D   memSize                           Value Like( TypeUnsignedInt )

    ‚ * ------------------------------------------------------------------
    ‚ * - CPYBYTES - Copiar bytes                                        -
    ‚ * -                                                                -
    ‚ * - Copy Bytes (_CPYBYTES)                                         -
    ‚ * ------------------------------------------------------------------

     D CPYBYTES        PR                  ExtProc( '_CPYBYTES' )
     D   receiver                          Value Like( TypePtr )
     D   source                            Value Like( TypePtr )
     D   size                              Value Like( TypeUnsignedInt )

    ‚ * ------------------------------------------------------------------
    ‚ * - ModInvAutA - Modificar el atributo de autorización de          -
    ‚ * -              invocación                                        -
    ‚ * -                                                                -
    ‚ * - Modify invocation authority attribute (_MODINVAU)              -
    ‚ * ------------------------------------------------------------------

     D ModInvAutA      Pr                  ExtProc( '_MODINVAU' )
     D   autAtr                       1A   Const

    ‚ * ------------------------------------------------------------------
    ‚ * - MatMAtr - Materializar atributos de máquina                    -
    ‚ * -                                                                -
    ‚ * - Materialize Machine Attributes (MATMATR)                       -
    ‚ * ------------------------------------------------------------------

     D MatMAtr         PR                  ExtProc( '_MATMATR1' )
     D   rcvVar                            Value Like( TypePtr )
     D   opt                          2A   Const

    ‚ * ------------------------------------------------------------------
    ‚ * - MatRmd - Materializar datos de gestión de recursos             -
    ‚ * -                                                                -
    ‚ * - Materialize Resource Management Data (MATRMD)                  -
    ‚ * ------------------------------------------------------------------

     D MatRmd          PR                  ExtProc( '_MATRMD' )
     D   rcvVar                            Value Like( TypePtr )
     D   ctl                          8A   Const

    ‚ * ------------------------------------------------------------------
    ‚ * - tstbts - Comprobar bit                                         -
    ‚ * -                                                                -
    ‚ * - Test Bit in String (TSTBTS)                                    -
    ‚ * ------------------------------------------------------------------

     D tstbts          PR                  Like( INT4_T )
     D                                     ExtProc( 'tstbts' )
     D   string                            Value Like( TypePtr )
     D   offset                            Value Like( UINT4_T )

    ‚/**
    ‚ *  cvtch - Convert Eight Bit Character to Hex Nibbles
    ‚ *
    ‚ *  Toma como entrada una cadena de caracteres donde cada byte
    ‚ *  es un dígito hexadecimal (0-9, A-F) y la transforma en su
    ‚ *  valor binario en grupos de 4 bits (hex nibble).
    ‚ *
    ‚ *  Sirve para convertir una representación hexadecimal leible
    ‚ *  por los humanos en su representación binaria entendible por
    ‚ *  la máquina.
    ‚ */

     D cvtch           PR                  ExtProc( 'cvtch' )
     D  binResult                          Value Like( TypePtr )
     D  charSource                         Value Like( TypePtr )
     D  charSrcSize                        Value Like( TypeInt )

     D CharToHex       PR                  ExtProc( 'cvtch' )
     D  binResult                          Value Like( TypePtr )
     D  charSource                         Value Like( TypePtr )
     D  charSrcSize                        Value Like( TypeInt )

    ‚/**
    ‚ *  cvthc - Convert Hex to Character
    ‚ *
    ‚ *  Toma como entrada un fragmento de memoria y transforma cada
    ‚ *  4 bits (hex nibble) en su representación de 1 byte (0-9, A-F).
    ‚ *
    ‚ *  Sirve para convertir un valor binario entendible por la máquina
    ‚ *  en una representación con dígitos hexadecimales entendible por
    ‚ *  los humanos.
    ‚ */

     D cvthc           PR                  ExtProc( 'cvthc' )
     D  charResult                         Value Like( TypePtr )
     D  binSource                          Value Like( TypePtr )
     D  charRstSize                        Value Like( TypeInt )

     D HexToChar       PR                  ExtProc( 'cvthc' )
     D  charResult                         Value Like( TypePtr )
     D  binSource                          Value Like( TypePtr )
     D  charRstSize                        Value Like( TypeInt )

