      /If Defined( USRSPC_H )
      /Eof
      /Endif
      /Define USRSPC_H

    ‚ *
    ‚ *  NOMBRE.......: USRSPC_H
    ‚ *  DESCRIPCION..: Declaración de prototipos de las APIs para el
    ‚ *                 manejo de Espacios de Usuario (USRSPC)
    ‚ *
    ‚ *  Programador..: Javier Mora
    ‚ *  Fecha........: 10.11.2005
    ‚ *
    ‚ *  Historia:
    ‚ *
    ‚ *   Fecha   Programador        Observaciones
    ‚ *  -------- ------------------ -------------
    ‚ *  17.09.09 Javier Mora        Revisión de estilo.
    ‚ *  Abr 2015 Javier Mora        Ampliar parámetros CrtUsrSpc.
    ‚ *
    ‚ *  Usar como:
    ‚ *
    ‚ *    /Copy API,UsrSpc_H
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

    ‚ * ------------------------------------------------------------------
    ‚ * - Claves de las atributos que pueden ser cambiados               -
    ‚ * ------------------------------------------------------------------
     D SPCATR_KEY_SIZE...
     D                 C                   Const( 1 )
     D SPCATR_KEY_INIVAL...
     D                 C                   Const( 2 )
     D SPCATR_KEY_AUTEXT...
     D                 C                   Const( 3 )
     D SPCATR_KEY_TRANSF...
     D                 C                   Const( 4 )

    ‚ * ==================================================================
    ‚ * = DEFINICIÓN DE TIPOS                                            =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato SPCA0100 con la información de los atributos del       -
    ‚ * - espacio de usuario                                             -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytesRet       Bytes devueltos                                 -
    ‚ * - bytesAvl       Bytes disponibles                               -
    ‚ * - size           Tamaño del espacio de usuario                   -
    ‚ * - autoExt        Ampliación automática                           -
    ‚ * -                  0=No; 1=Si                                    -
    ‚ * - initValue      Valor inicial                                   -
    ‚ * - libName        Biblioteca donde está ubicado                   -
    ‚ * ------------------------------------------------------------------

     D SPCA0100_T      DS                  Based( StdTyp_ )
     D                                     Qualified
     D   bytesRet                    10I 0 Overlay( SPCA0100_T: 1 )
     D   bytesAvl                    10I 0 Overlay( SPCA0100_T: 5 )
     D   size                        10I 0 Overlay( SPCA0100_T: 9 )
     D   autoExt                      1A   Overlay( SPCA0100_T: 13 )
     D   initValue                    1A   Overlay( SPCA0100_T: 14 )
     D   libName                     10A   Overlay( SPCA0100_T: 15 )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato de genérico de cabecera para las APIs que generan      -
    ‚ * - listas de datos                                                -
    ‚ * ------------------------------------------------------------------
    ‚ * - userArea       Área de usuario                                 -
    ‚ * - sizeGenHdr     Tamaño de la cabecera genérica                  -
    ‚ * - level          Nivel y release                                 -
    ‚ * - fmtName        Nombre del formato                              -
    ‚ * - apiUsed        API usada                                       -
    ‚ * - createDatTim   Fecha y hora                                    -
    ‚ * - status         Estado (I=Incomplete,C=Complete                 -
    ‚ * -                        F=Partially Complete)                   -
    ‚ * - sizeUsrSpc     Tamaño usado por espacio usuario                -
    ‚ * - offsInpParm    Desplazamiento a la sección de parámetros de    -
    ‚ * -                entrada                                         -
    ‚ * - sizeInpParm    Tamaño sección parametros de entrada            -
    ‚ * - offsHdrSect    Desplazamiento sección cabecera                 -
    ‚ * - sizeHdrSect    Tamaño sección de cabecera                      -
    ‚ * - offsListDta    Desplazamiento a la sección con la lista datos  -
    ‚ * - sizeListDta    Tamaño de la sección con la lista de datos      -
    ‚ * - countEnt       Número de entradas de la lista                  -
    ‚ * - sizeEnt        Tamaño de una única entrada                     -
    ‚ * - ccsidDta       CCSID de los datos                              -
    ‚ * - countryId      Idenficador de país                             -
    ‚ * - languageId     Idenficador de idioma                           -
    ‚ * - subsetLstInd   Subsetted list indicator                        -
    ‚ * - reserved       Reservado                                       -
    ‚ * ------------------------------------------------------------------

     D TypeApiGenLstHdr...
     D                 DS                  Based( StdTyp_ )
     D                                     Qualified
     D   userArea                    64A   Overlay( TypeApiGenLstHdr: 1 )
     D   sizeGenHdr                  10I 0 Overlay( TypeApiGenLstHdr: 65 )
     D   level                        4A   Overlay( TypeApiGenLstHdr: 69 )
     D   fmtName                      8A   Overlay( TypeApiGenLstHdr: 73 )
     D   apiUsed                     10A   Overlay( TypeApiGenLstHdr: 81 )
     D   createDatTim                13A   Overlay( TypeApiGenLstHdr: 91 )
     D   status                       1A   Overlay( TypeApiGenLstHdr: 104 )
     D   sizeUsrSpc                  10I 0 Overlay( TypeApiGenLstHdr: 105 )
     D   offsInpParm                 10I 0 Overlay( TypeApiGenLstHdr: 109 )
     D   sizeInpParm                 10I 0 Overlay( TypeApiGenLstHdr: 113 )
     D   offsHdrSect                 10I 0 Overlay( TypeApiGenLstHdr: 117 )
     D   sizeHdrSect                 10I 0 Overlay( TypeApiGenLstHdr: 121 )
     D   offsListDta                 10I 0 Overlay( TypeApiGenLstHdr: 125 )
     D   sizeListDta                 10I 0 Overlay( TypeApiGenLstHdr: 129 )
     D   countEnt                    10I 0 Overlay( TypeApiGenLstHdr: 133 )
     D   sizeEnt                     10I 0 Overlay( TypeApiGenLstHdr: 137 )
     D   ccsidDta                    10I 0 Overlay( TypeApiGenLstHdr: 141 )
     D   countryId                    2A   Overlay( TypeApiGenLstHdr: 145 )
     D   languageId                   3A   Overlay( TypeApiGenLstHdr: 147 )
     D   subsetLstInd                 1A   Overlay( TypeApiGenLstHdr: 150 )
     D   reserved                    42A   Overlay( TypeApiGenLstHdr: 151 )

    ‚D* Para mantener compatibilidad con v.2
     D SPCA0100        DS                  Based( StdTyp_ )
     D                                     LikeDs( SPCA0100_T )

    ‚ * ==================================================================
    ‚ * = DECLARACIÓN DE FUNCIONES Y PROCEDIMIENTOS PUBLICOS             =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - CrtUsrSpc - Crear espacio de usuario                           -
    ‚ * -                                                                -
    ‚ * - Create User Space (QUSCRTUS)                                   -
    ‚ * ------------------------------------------------------------------

     D CrtUsrSpc       Pr                  ExtPgm( 'QUSCRTUS' )
     D   usrSpcQ                           Const Like( TypeQualName )
     D   extAttr                           Const Like( TypeName )
     D   initSize                          Const Like( TypeInt )
     D   initValue                         Const Like( TypeChar )
     D   publicAuth                        Const Like( TypeName )
     D   text                              Const Like( TypeText )
    ‚D* Grupo Opcional 1
     D   replace                           Const Like( TypeName )
     D                                           Options( *NOPASS )
     D   errorCode                               Like( TypeAPIError )
     D                                           Options( *VARSIZE
     D                                                  : *NOPASS )
    ‚D* Grupo Opcional 2
     D   domain                            Const Like( TypeName )
     D                                           Options( *NOPASS )
    ‚D* Grupo Opcional 3
     D   tfrSize                           Const Like( TypeInt )
     D                                           Options( *NOPASS )
     D   optSpcAlgn                        Const Like( TypeChar )
     D                                           Options( *NOPASS )

    ‚ * ------------------------------------------------------------------
    ‚ * - DltUsrSpc - Eliminar espacio de usuario                        -
    ‚ * -                                                                -
    ‚ * - Delete User Space (QUSDLTUS)                                   -
    ‚ * ------------------------------------------------------------------

     D DltUsrSpc       Pr                  ExtPgm( 'QUSDLTUS' )
     D   usrSpcQ                           Const Like( TypeQualName )
     D   errorCode                               Like( TypeAPIError )
     D                                           Options( *VARSIZE )


    ‚ * ------------------------------------------------------------------
    ‚ * - RtvPtrUsrSpc - Recuperar puntero a espacio de usuario          -
    ‚ * -                                                                -
    ‚ * - Retrieve Pointer to User Space (QUSPTRUS)                      -
    ‚ * ------------------------------------------------------------------

     D RtvPtrUsrSpc    PR                  ExtPgm( 'QUSPTRUS' )
     D   usrSpcQ                           Const Like( TypeQualName )
     D   pointer                                 Like( TypePtr )
    ‚D* Grupo Opcional 1
     D   errorCode                               Like( TypeApiError )
     D                                           Options( *VARSIZE
     D                                                  : *NOPASS )


    ‚ * ------------------------------------------------------------------
    ‚ * - RtvUsrSpc - Recuperar espacio de usuario                       -
    ‚ * -                                                                -
    ‚ * - Retrieve User Space (QUSRTVUS)                                 -
    ‚ * ------------------------------------------------------------------

     D RtvUsrSpc       PR                  ExtPgm( 'QUSRTVUS' )
     D   usrSpcQ                           Const Like( TypeQualName )
     D   startPos                          Const Like( TypeInt )
     D   length                            Const Like( TypeInt )
     D   rcvVar                                  Like( TypeBuffer )
     D                                           Options( *VARSIZE )
    ‚D* Grupo Opcional 1
     D   errorCode                               Like( TypeApiError )
     D                                           Options( *VARSIZE
     D                                                  : *NOPASS )

    ‚ * ------------------------------------------------------------------
    ‚ * - ChgUsrSpc - Cambiar espacio de usuario                         -
    ‚ * -                                                                -
    ‚ * - Change User Space (QUSCHGUS)                                   -
    ‚ * ------------------------------------------------------------------

     D ChgUsrSpc       PR                  ExtPgm( 'QUSCHGUS' )
     D   usrSpcQ                           Const Like( TypeQualName )
     D   startPos                          Const Like( TypeInt )
     D   length                            Const Like( TypeInt )
     D   inpDta                            Const Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   force                             Const Like( TypeChar )
    ‚D* Grupo Opcional 1
     D   errorCode                               Like( TypeApiError )
     D                                           Options( *VARSIZE
     D                                                  : *NOPASS )


    ‚ * ------------------------------------------------------------------
    ‚ * - RtvUsrSpcAttr - Recuperar atributos del espacio de usuario     -
    ‚ * -                                                                -
    ‚ * - Retrieve User Space Attributes (QUSRUSAT)                      -
    ‚ * ------------------------------------------------------------------

     D RtvUsrSpcAttr   PR                  ExtPgm( 'QUSRUSAT' )
     D   rcvVar                                  Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   rcvVarLen                         Const Like( TypeInt )
     D   format                            Const Like( TypeApiFormat )
     D   usrSpcQ                           Const Like( TypeQualName )
     D   errorCode                               Like( TypeApiError )
     D                                           Options( *VARSIZE )

    ‚ * ------------------------------------------------------------------
    ‚ * - ChgUsrSpcAttr - Cambiar atributos del espacio de usuario       -
    ‚ * -                                                                -
    ‚ * - Change User Space Attributes (QUSCUSAT)                        -
    ‚ * ------------------------------------------------------------------

     D ChgUsrSpcAttr   PR                  ExtPgm( 'QUSCUSAT' )
     D   rtnLib                                  Like( TypeName )
     D   usrSpcQ                           Const Like( TypeQualName )
     D   attrib                            Const Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   errorCode                               Like( TypeApiError )
     D                                           Options( *VARSIZE )
