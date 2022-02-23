      /If Defined( NETSVR_H )
      /Eof
      /Endif
      /Define NETSVR_H

    � *
    � *  NOMBRE.......: NETSVR_H
    � *  DESCRIPCION..: Declaraci�n de los tipos y prototipos para las
    � *                 APIs del servicio NetServer (iSeries Support for
    � *                 Windows Network Neighborhood Server).
    � *
    � *    Con estas APIs podr� desde cualquier PC acceder a ficheros e
    � *    impresoras del iSeries utilizando el soporte de red proporcionado
    � *    con su sistema operativo. Los soportados por NetServer son:
    � *    Windows 2000/XP/Server 2003 y Linux/Samba.
    � *
    � *  Programador..: Javier Mora
    � *  Fecha........: 19.08.2008
    � *
    � *  Historia:
    � *
    � *   Fecha   Programador        Observaciones
    � *  -------- ------------------ -------------
    � *
    � *  Usar como:
    � *
    � *    /Copy API,NetSvr_H
    � *
    � *  Notas:
    � *


    � * ==================================================================
    � * = OTROS FICHEROS DE CABECERA                                     =
    � * ==================================================================

      /Copy Api,StdTyp_H

    � * ==================================================================
    � * = DEFINICI�N DE CONSTANTES                                       =
    � * ==================================================================

    � * ==================================================================
    � * = DEFINICI�N DE TIPOS                                            =
    � * ==================================================================

    � * ------------------------------------------------------------------
    � * - Estructura con la informaci�n sobre la lista que ha sido       -
    � * - abierta con la API QZLSOLST.                                   -
    � * -                                                                -
    � * - API Open List of Server Information (QZLSOLST)                 -
    � * ------------------------------------------------------------------
    � * - totRcds        N�mero total de registros.                      -
    � * - rcdRtn         Registros devueltos.                            -
    � * - rcdLen         Longitud del registro.                          -
    � * - lenInfRtn      Tama�o de la informaci�n devuelta.              -
    � * - infCmpInd      Indicador de informaci�n completa.              -
    � * - dts            Fecha y hora de creaci�n.                       -
    � * ------------------------------------------------------------------

     D NETSVR_lstInf_T...
     D                 DS                  Based( apityp_ )
     D                                     Qualified
     D  totRcds                      10I 0
     D  rcdRtn                       10I 0
     D  rcdLen                       10I 0
     D  lenInfRtn                    10I 0
     D  infCmpInd                     1A
     D  dts                          13A
     D                               34A

    � * ------------------------------------------------------------------
    � * - Calificador de informaci�n                                     -
    � * -                                                                -
    � * - Permite al llamador de la API seleccionar un subconjunto de    -
    � * - las entradas devueltas normalmente.                            -
    � * ------------------------------------------------------------------

     D NETSVR_infQual_T...
     D                 S             15A   Based( apityp_ )

    � * ==================================================================
    � * = DECLARACI�N DE FUNCIONES Y PROCEDIMIENTOS PUBLICOS             =
    � * ==================================================================

    � * ------------------------------------------------------------------
    � * - OpnLstSvrInf - Abrir lista de informaci�n de servidor          -
    � * -                                                                -
    � * - Open List of Server Information (QZLSOLST)                     -
    � * ------------------------------------------------------------------

     D OpnLstSvrInf    PR                  ExtPgm( 'QZLSOLST' )
     D   rcvVar                                  Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   rcvVarLen                         Const Like( TypeInt )
     D   lstInf                                  Like( NETSVR_lstInf_T )
     D   format                            Const Like( TypeApiFormat )
     D   infQual                           Const Like( NETSVR_infQual_T )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VarSize )
    �D* Grupo Opcional 1:
     D   ssnUsr                            Const Like( TypeName )
     D                                           Options( *NOPASS )
    �D* Grupo Opcional 2:
     D   ssnId                             Const Like( TypeBigInt )
     D                                           Options( *NOPASS )

    � * ------------------------------------------------------------------
    � * - ChgSvrInf - Cambiar informaci�n de servidor                    -
    � * -                                                                -
    � * - Change Server Information (QZLSCHSI)                           -
    � * ------------------------------------------------------------------

     D ChgSvrInf       PR                  ExtPgm( 'QZLSCHSI' )
     D   rqsVar                            Const Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   rqsVarLen                         Const Like( TypeInt )
     D   format                            Const Like( TypeApiFormat )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )
