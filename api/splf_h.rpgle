      /If Defined( SPLF_H )
      /Eof
      /Endif
      /Define SPLF_H

    ‚ *
    ‚ *  NOMBRE.......: SPLF_H
    ‚ *  DESCRIPCION..: Declaración de los tipos y prototipos para el
    ‚ *                 acceso y obtención de información para los
    ‚ *                 archivos en spool.
    ‚ *
    ‚ *    Las APIs de archivos en spool obtienen información espcífica
    ‚ *    sobre éstos. Por ejemplo, pueden:
    ‚ *     - Devolver una lista de archivos en spool basándose en un
    ‚ *       criterio de selección dado, tal como un usuario concreto o
    ‚ *       una cola de salida.
    ‚ *     - Proporciona funciones de acceso a un archivo en spool
    ‚ *       especificado, desde el cual el API puede devolver los
    ‚ *       atributos y datos de aquél, o crearlo o duplicarlo.
    ‚ *
    ‚ *    Estas APIs son muy útiles en aplicaciones que limpien, guarden
    ‚ *    y restauren archivos en spool.
    ‚ *
    ‚ *  Programador..: Javier Mora
    ‚ *  Fecha........: 10.08.2007
    ‚ *
    ‚ *  Historia:
    ‚ *  ---------
    ‚ *   Fecha   Programador        Observaciones
    ‚ *  -------- ------------------ -------------
    ‚ *  16.01.08 Javier Mora        RtvSplfAttr: parámetro "qualjob"
    ‚ *                              mal declarado (TypeQualJob).
    ‚ *  06.05.08 Javier Mora        QSPGETSP parámetro "waitfor" mal
    ‚ *                              declarado.
    ‚ *                              SPFR_genHdr_T error en el desplazamiento
    ‚ *                              del campo "offBuf1".
    ‚ *  08.05.08 Javier Mora        Añadir prototipos de las APIs:
    ‚ *                              QSPCRTSP, QSPPUTSP
    ‚ *  17.07.08 Javier Mora        Añadir prototipo para QSPRILSP.
    ‚ *                              Corregir prototipo de la API RtvSplfAttr
    ‚ *  14.05.09 Javier Mora        Corregir estructura de datos SPLF0300_T
    ‚ *  12.11.09 Javier Mora        Ampliar estructura SPLA0100 con todos
    ‚ *                              los subcampos.
    ‚ *
    ‚ *  Usar como:
    ‚ *
    ‚ *    /Copy API,Splf_H
    ‚ *
    ‚ *  Notas :
    ‚ *  -------
    ‚ *

    ‚ * ==================================================================
    ‚ * = OTROS FICHEROS DE CABECERA                                     =
    ‚ * ==================================================================

      /Copy API,StdTyp_H

    ‚ * ==================================================================
    ‚ * = DEFINICIÓN DE TIPOS                                            =
    ‚ * ==================================================================

     D SPLF_handle_T   S             10I 0 Based( apiType_ )
     D SPLF_intId_T    S             16A   Based( apiType_ )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato SPLA0100 para la API Recuperar Atributos de Archivo en -
    ‚ * - Spool (QUSRSPLA)                                               -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytesRet       Bytes Devueltos.                                -
    ‚ * - bytesAvail     Bytes Disponibles.                              -
    ‚ * - intJobId       Idenficador Interno del Trabajo.                -
    ‚ * - intSplfId      Idenficador Interno del Archivo en Spool.       -
    ‚ * - jobName        Nombre del trabajo.                             -
    ‚ * - userName       Nombre del usuario.                             -
    ‚ * - jobNumber      Número del trabajo.                             -
    ‚ * - splfName       Nombre del archivo en spool.                    -
    ‚ * - splfNumber     Número del archivo en spool.                    -
    ‚ * - formType       Tipo de formulario.                             -
    ‚ * - userData       Datos definidos por el usuario.                 -
    ‚ * - status         Estado.                                         -
    ‚ * - fileAvail      Archivo disponible.                             -
    ‚ * - holdBefore     Retener antes de imprimir.                      -
    ‚ * - saveAfter      Salvar después de imprimir.                     -
    ‚ * - totPages       Total páginas.                                  -
    ‚ * - pagRcdWtn      Página o registro impreso.                      -
    ‚ * - startPage      Página inicial.                                 -
    ‚ * - finalPage      Página final.                                   -
    ‚ * - restart        Rearrancar impresión.                           -
    ‚ * - copies         Número de copias total.                         -
    ‚ * - copiesLeft     Número de copias pendientes.                    -
    ‚ * - linesInch      Líneas por pulgada.                             -
    ‚ * - charInch       Caracteres por pulgada.                         -
    ‚ * - priority       Prioridad de salida.                            -
    ‚ * - outqName       Nombre de la cola de salida.                    -
    ‚ * - outqLib        Biblioteca cola de salida.                      -
    ‚ * - crtDate        Fecha de creación.                              -
    ‚ * - crtTime        Hora de creación.                               -
    ‚ * - deviceName     Nombre de dispositivo.                          -
    ‚ * - deviceLib      Biblioteca de dispositivo.                      -
    ‚ * - pgmName        Programa que creó el archivo.                   -
    ‚ * - pgmLib         Biblioteca del programa.                        -
    ‚ * - accountCode    Código de contabilidad.                         -
    ‚ * - printText      Texto de impresión.                             -
    ‚ * - rcdLen         Longitud de registro.                           -
    ‚ * - maxRcds        Máximo número de registros.                     -
    ‚ * - devType        Tipo de dispositivo.                            -
    ‚ * - printDevType   Tipo de disp. de impresión.                     -
    ‚ * - docName        Nombre de documento.                            -
    ‚ * - folderName     Nombre de carpeta.                              -
    ‚ * - s36prcName     Nombre de procedimiento S/36.                   -
    ‚ * - printFidelity  Print Fidelity.                                 -
    ‚ * - rplUnprtChar   Reemplazar caracteres no imprimibles.           -
    ‚ * - rplChar        Caracter de reemplazo.                          -
    ‚ * - pageLen        Longitud de página.                             -
    ‚ * - pageWidth      Ancho de página.                                -
    ‚ * - separators     Número de separadores.                          -
    ‚ * - overflow       Línea de desvordamiento.                        -
    ‚ * - multBytDta     Datos multibyte.                                -
    ‚ * - DBCSextChar                                                    -
    ‚ * - DBCSsosiSpc                                                    -
    ‚ * - DBCScharRot    Rotación caracteres DBCS.                       -
    ‚ * - DBCScpi        Caracteres DBCS por pulgada.                    -
    ‚ * - graphCharSet   Juego de caracteres gráficos.                   -
    ‚ * - codPag         Página de códigos.                              -
    ‚ * - formDef        Nombre de la definición de formulario.          -
    ‚ * - formDefLib     Biblioteca de la definición de forumulario.     -
    ‚ * - drawer         Bandeja de alimentación.                        -
    ‚ * - font           Fuente.                                         -
    ‚ * - s36SplfId      Identificador S/36 del archivo en spool.        -
    ‚ * - pagRtt         Grado de rotación de página.                    -
    ‚ * - justify        Justificación.                                  -
    ‚ * - duplex         Imprimir por las dos caras.                     -
    ‚ * - foldRcd        Doblar registros.                               -
    ‚ * - ctlChar        Carácter de control.                            -
    ‚ * - alignForms     Alinear formularios.                            -
    ‚ * - prtQlty        Calidad de impresión.                           -
    ‚ * - formFeed       Alimentación de papel.                          -
    ‚ * - volumes        Volúmenes.                                      -
    ‚ * - fileLblId      Identificador de etiqueta de archivo.           -
    ‚ * - exchangeType   Tipo de intercambio.                            -
    ‚ * - charCode       Código de carácter.                             -
    ‚ * - totalRcds      Total registros.                                -
    ‚ * - multiup        Páginas por cara.                               -
    ‚ * - frontOvl       Nombre preformato cara anterior.                -
    ‚ * - frontOvlLib    Biblioteca preformato cara anterior.            -
    ‚ * - frontOvlOffsDown                                               -
    ‚ * -                Desplazamiento vertical preformato cara anterior-
    ‚ * - frontOvlOffsAcross                                             -
    ‚ * -                Desplazamiento horizontal preformato cara       -
    ‚ * -                anterior.                                       -
    ‚ * - backOvl        Nombre preformato cara posterior.               -
    ‚ * - backOvlLib     Biblioteca preformato cara posterior.           -
    ‚ * - frontOvlOffsDown                                               -
    ‚ * -                Desplazamiento vertical preformato cara         -
    ‚ * -                posterior.                                      -
    ‚ * - frontOvlOffsAcross                                             -
    ‚ * -                Desplazamiento horizontal preformato cara       -
    ‚ * -                posterior.                                      -
    ‚ * - uom            Unidad de medida.                               -
    ‚ * - pagDfn         Nombre de definición de página.                 -
    ‚ * - pagDfnLib      Biblioteca de la definición de página.          -
    ‚ * - lineSpc        Espaciado entre líneas.                         -
    ‚ * - pointSize      Tamaño de punto.                                -
    ‚ * - frontMarginOffsDown                                            -
    ‚ * -                Desplazamiento vertical margen anterior.        -
    ‚ * - frontMarginOffsAcross                                          -
    ‚ * -                Desplazamiento horizontal margen anterior.      -
    ‚ * - backMarginOffsDown                                             -
    ‚ * -                Desplazamiento vertical margen posterior.       -
    ‚ * - backMarginOffsAcross                                           -
    ‚ * -                Desplazamiento horizontal margen posterior.     -
    ‚ * - lengthOfPage   La longitud de una página. La unidad de medida  -
    ‚ * -                es la especificada en el campo                  -
    ‚ * -                'measurementMethod'.                            -
    ‚ * - widthOfPage    El ancho de la página. La unidad de medida es   -
    ‚ * -                la especificada en el campo 'measurementMethod'.-
    ‚ * - measurementMethod                                              -
    ‚ * -                Método de medida.                               -
    ‚ * - AFPresource    Recurso AFP.                                    -
    ‚ * - charSet        Nombre del juego de caracteres.                 -
    ‚ * - charSetLib     Biblioteca del juego de caracteres.             -
    ‚ * - cdePag         Nombre de la página de códigos.                 -
    ‚ * - cdePagLib      Biblioteca de la página de códigos.             -
    ‚ * - cdeFnt         Nombre del fuente codificado.                   -
    ‚ * - cdeFntLib      Biblioteca del fuente codificado.               -
    ‚ * - DBCScdeFnt     Nombre del fuente DBCS codificado.              -
    ‚ * - DBCScdeFntLib  Biblioteca del fuente DBCS codificado.          -
    ‚ * - usrDefFile     Archivo definido por el usuario.                -
    ‚ * - reduce         Reducir salida.                                 -
    ‚ * - constBackOvl   Preformato posterior constante.                 -
    ‚ * - outBin         Bandeja de salida.                              -
    ‚ * - CCSID          CCSID.                                          -
    ‚ * - usrDefTxt      Texto definido por el usuario.                  -
    ‚ * - systemCrt      Systema donde fue creado el archivo.            -
    ‚ * - idCrt          ID donde fue creado el archivo.                 -
    ‚ * - usrCrt         Usuario que creó el archivo.                    -
    ‚ * - offsUsrDfnOpt  Desplazamiento a las opciones definidas por el  -
    ‚ * -                usuario.                                        -
    ‚ * - nbrUsrDfnOpt   Número de opciones definidas por el usuario.    -
    ‚ * - lenUsrDfnOptE  Longitud de cada entrada de las opciones        -
    ‚ * -                definidas por el usuario.                       -
    ‚ * - usrDfnDta      Datos definidos por el usuario.                 -
    ‚ * - usrDfnObj      Nombre del objeto definido por el usuario.      -
    ‚ * - usrDfnObjLib   Biblioteca del objeto definido por el usuario.  -
    ‚ * - usrObjTyp      Tipo del objeto definido por el usuario.        -
    ‚ * - charSetPoinSize                                                -
    ‚ * -                Tamaño de punto del juego de caracteres.        -
    ‚ * - cdeFntPoitSize                                                 -
    ‚ * -                Tamaño de punto del fuente codificado.          -
    ‚ * - DBCScdeFntPointSize                                            -
    ‚ * -                Tamaño de punto del fuente DBCS codificado.     -
    ‚ * - ASP            Agrupación de almacenamiento auxiliar.          -
    ‚ * - splfSize       Tamaño del archivo en spool.                    -
    ‚ * - splfSizMult    Multiplicador del tamaño del archivo.           -
    ‚ * - ippJobId       Identificador de trabajo IPP.                   -
    ‚ * - splfCrtSec     Método de seguridad al crear.                   -
    ‚ * - splfCrtAut     Método de autentificación al crear.             -
    ‚ * - datWtrBegan    Fecha cuando el transcriptor empieza a procesar -
    ‚ * -                el archivo en spool.                            -
    ‚ * - timWtrBegan    Hora cuando el transcriptor empieza a procesar  -
    ‚ * -                el archivo en spool.                            -
    ‚ * - datWtrComp     Fecha cuando el transcriptor termina a procesar -
    ‚ * -                el archivo en spool.                            -
    ‚ * - timWtrComp     Hora cuando el transcriptor termina a procesar  -
    ‚ * -                el archivo en spool.                            -
    ‚ * - jobSysNam      Job system name.                                -
    ‚ * - ASPdevNam      Nombre de dispositivo ASP.                      -
    ‚ * - expDate        Fecha de caducidad.                             -
    ‚ * ------------------------------------------------------------------

     D SPLA0100_T      DS                  Based( apiTyp_ )
     D                                     Qualified
     D   bytesRet                    10I 0 Overlay( SPLA0100_T: 1 )
     D   bytesAvail                  10I 0 Overlay( SPLA0100_T: 5 )
     D   intJobId                    16A   Overlay( SPLA0100_T: 9 )
     D   intSplfId                   16A   Overlay( SPLA0100_T: 25 )
     D   jobName                     10A   Overlay( SPLA0100_T: 41 )
     D   userName                    10A   Overlay( SPLA0100_T: 51 )
     D   jobNumber                    6A   Overlay( SPLA0100_T: 61 )
     D   splfName                    10A   Overlay( SPLA0100_T: 67 )
     D   splfNumber                  10I 0 Overlay( SPLA0100_T: 77 )
     D   formType                    10A   Overlay( SPLA0100_T: 81 )
     D   userData                    10A   Overlay( SPLA0100_T: 91 )
     D   status                      10A   Overlay( SPLA0100_T: 101 )
     D   fileAvail                   10A   Overlay( SPLA0100_T: 111 )
     D   holdBefore                  10A   Overlay( SPLA0100_T: 121 )
     D   saveAfter                   10A   Overlay( SPLA0100_T: 131 )
     D   totPages                    10I 0 Overlay( SPLA0100_T: 141 )
     D   pagRcdWtn                   10I 0 Overlay( SPLA0100_T: 145 )
     D   startPage                   10I 0 Overlay( SPLA0100_T: 149 )
     D   finalPage                   10I 0 Overlay( SPLA0100_T: 153 )
     D   restart                     10I 0 Overlay( SPLA0100_T: 161 )
     D   copies                      10I 0 Overlay( SPLA0100_T: 165 )
     D   copiesLeft                  10I 0 Overlay( SPLA0100_T: 169 )
     D   linesInch                   10I 0 Overlay( SPLA0100_T: 173 )
     D   charInch                    10I 0 Overlay( SPLA0100_T: 177 )
     D   priority                     2A   Overlay( SPLA0100_T: 181 )
     D   outqName                    10A   Overlay( SPLA0100_T: 183 )
     D   outqLib                     10A   Overlay( SPLA0100_T: 193 )
     D   crtDate                      7A   Overlay( SPLA0100_T: 203 )
     D   crtTime                      6A   Overlay( SPLA0100_T: 210 )
     D   deviceName                  10A   Overlay( SPLA0100_T: 216 )
     D   deviceLib                   10A   Overlay( SPLA0100_T: 226 )
     D   pgmName                     10A   Overlay( SPLA0100_T: 236 )
     D   pgmLib                      10A   Overlay( SPLA0100_T: 246 )
     D   accountCode                 15A   Overlay( SPLA0100_T: 256 )
     D   printText                   30A   Overlay( SPLA0100_T: 271 )
     D   rcdLen                      10I 0 Overlay( SPLA0100_T: 301 )
     D   maxRcds                     10I 0 Overlay( SPLA0100_T: 305 )
     D   devType                     10A   Overlay( SPLA0100_T: 309 )
     D   printDevType                10A   Overlay( SPLA0100_T: 319 )
     D   docName                     12A   Overlay( SPLA0100_T: 329 )
     D   folderName                  64A   Overlay( SPLA0100_T: 341 )
     D   s36prcName                   8A   Overlay( SPLA0100_T: 405 )
     D   printFidelity...
     D                               10A   Overlay( SPLA0100_T: 413 )
     D   rplUnprtChar                 1A   Overlay( SPLA0100_T: 423 )
     D   rplChar                      1A   Overlay( SPLA0100_T: 424 )
     D   pageLen                     10I 0 Overlay( SPLA0100_T: 425 )
     D   pageWidth                   10I 0 Overlay( SPLA0100_T: 429 )
     D   separators                  10I 0 Overlay( SPLA0100_T: 433 )
     D   overflow                    10I 0 Overlay( SPLA0100_T: 437 )
     D   multBytDta                  10A   Overlay( SPLA0100_T: 441 )
     D   DBCSextChar                 10A   Overlay( SPLA0100_T: 451 )
     D   DBCSsosiSpc                 10A   Overlay( SPLA0100_T: 461 )
     D   DBCScharRot                 10A   Overlay( SPLA0100_T: 471 )
     D   DBCScpi                     10I 0 Overlay( SPLA0100_T: 481 )
     D   graphCharSet                10A   Overlay( SPLA0100_T: 485 )
     D   codPag                      10A   Overlay( SPLA0100_T: 495 )
     D   formDef                     10A   Overlay( SPLA0100_T: 505 )
     D   formDefLib                  10A   Overlay( SPLA0100_T: 515 )
     D   drawer                      10I 0 Overlay( SPLA0100_T: 525 )
     D   font                        10A   Overlay( SPLA0100_T: 529 )
     D   s36SplfId                    6A   Overlay( SPLA0100_T: 539 )
     D   pagRtt                      10I 0 Overlay( SPLA0100_T: 545 )
     D   justify                     10I 0 Overlay( SPLA0100_T: 549 )
     D   duplex                      10A   Overlay( SPLA0100_T: 553 )
     D   foldRcd                     10A   Overlay( SPLA0100_T: 563 )
     D   ctlChar                     10A   Overlay( SPLA0100_T: 573 )
     D   alignForms                  10A   Overlay( SPLA0100_T: 583 )
     D   prtQlty                     10A   Overlay( SPLA0100_T: 593 )
     D   formFeed                    10A   Overlay( SPLA0100_T: 603 )
     D   volumes                     71A   Overlay( SPLA0100_T: 613 )
     D   fileLblId                   17A   Overlay( SPLA0100_T: 684 )
     D   exchangeType                10A   Overlay( SPLA0100_T: 701 )
     D   charCode                    10A   Overlay( SPLA0100_T: 711 )
     D   totalRcds                   10I 0 Overlay( SPLA0100_T: 721 )
     D   multiup                     10I 0 Overlay( SPLA0100_T: 725 )
     D   frontOvl                    10A   Overlay( SPLA0100_T: 729 )
     D   frontOvlLib                 10A   Overlay( SPLA0100_T: 739 )
     D   frontOvlOffsDown...
     D                               15P 5 Overlay( SPLA0100_T: 749 )
     D   frontOvlOffsAcross...
     D                               15P 5 Overlay( SPLA0100_T: 757 )
     D   backOvl                     10A   Overlay( SPLA0100_T: 765 )
     D   backOvlLib                  10A   Overlay( SPLA0100_T: 775 )
     D   backOvlOffsDown...
     D                               15P 5 Overlay( SPLA0100_T: 785 )
     D   backOvlOffsAcross...
     D                               15P 5 Overlay( SPLA0100_T: 793 )
     D   uom                         10A   Overlay( SPLA0100_T: 801 )
     D   pagDfn                      10A   Overlay( SPLA0100_T: 811 )
     D   pagDfnLib                   10A   Overlay( SPLA0100_T: 821 )
     D   lineSpc                     10A   Overlay( SPLA0100_T: 831 )
     D   pointSize                   15P 5 Overlay( SPLA0100_T: 841 )
     D   frontMarginOffsDown...
     D                               15P 5 Overlay( SPLA0100_T: 849 )
     D   frontMarginOffsAcross...
     D                               15P 5 Overlay( SPLA0100_T: 857 )
     D   backMarginOffsDown...
     D                               15P 5 Overlay( SPLA0100_T: 865 )
     D   backMarginOffsAcross...
     D                               15P 5 Overlay( SPLA0100_T: 873 )
     D   lengthOfPage                15P 5 Overlay( SPLA0100_T: 881 )
     D   widthOfPage                 15P 5 Overlay( SPLA0100_T: 889 )
     D   measurementMethod...
     D                               10A   Overlay( SPLA0100_T: 897 )
     D   AFPresource                  1A   Overlay( SPLA0100_T: 907 )
     D   charSet                     10A   Overlay( SPLA0100_T: 908 )
     D   charSetLib                  10A   Overlay( SPLA0100_T: 918 )
     D   cdePag                      10A   Overlay( SPLA0100_T: 928 )
     D   cdePagLib                   10A   Overlay( SPLA0100_T: 938 )
     D   cdeFnt                      10A   Overlay( SPLA0100_T: 948 )
     D   cdeFntLib                   10A   Overlay( SPLA0100_T: 958 )
     D   DBCScdeFnt                  10A   Overlay( SPLA0100_T: 968 )
     D   DBCScdeFntLib...
     D                               10A   Overlay( SPLA0100_T: 978 )
     D   usrDefFile                  10A   Overlay( SPLA0100_T: 988 )
     D   reduce                      10A   Overlay( SPLA0100_T: 998 )
     D   constBackOvl                 1A   Overlay( SPLA0100_T: 1008 )
     D   outBin                      10I 0 Overlay( SPLA0100_T: 1009 )
     D   CCSID                       10I 0 Overlay( SPLA0100_T: 1013 )
     D   usrDefTxt                  100A   Overlay( SPLA0100_T: 1017 )
     D   systemCrt                    8A   Overlay( SPLA0100_T: 1117 )
     D   idCrt                        8A   Overlay( SPLA0100_T: 1125 )
     D   usrCrt                      10A   Overlay( SPLA0100_T: 1133 )
     D                                2A   Overlay( SPLA0100_T: 1143 )
     D   offsUsrDfnOpt...
     D                               10I 0 Overlay( SPLA0100_T: 1145 )
     D   nbrUsrDfnOpt                10I 0 Overlay( SPLA0100_T: 1149 )
     D   lenUsrDfnOptE...
     D                               10I 0 Overlay( SPLA0100_T: 1153 )
     D   usrDfnDta                  255A   Overlay( SPLA0100_T: 1157 )
     D   usrDfnObj                   10A   Overlay( SPLA0100_T: 1412 )
     D   usrDfnObjLib                10A   Overlay( SPLA0100_T: 1422 )
     D   usrObjTyp                   10A   Overlay( SPLA0100_T: 1432 )
     D                                3A   Overlay( SPLA0100_T: 1442 )
     D   charSetPoinSize...
     D                               15P 5 Overlay( SPLA0100_T: 1445 )
     D   cdeFntPoitSize...
     D                               15P 5 Overlay( SPLA0100_T: 1453 )
     D   DBCScdeFntPointSize...
     D                               15P 5 Overlay( SPLA0100_T: 1461 )
     D   ASP                         10I 0 Overlay( SPLA0100_T: 1469 )
     D   splfSize                    10I 0 Overlay( SPLA0100_T: 1473 )
     D   splfSizMult                 10I 0 Overlay( SPLA0100_T: 1477 )
     D   ippJobId                    10I 0 Overlay( SPLA0100_T: 1481 )
     D   splfCrtSec                   1A   Overlay( SPLA0100_T: 1485 )
     D   splfCrtAut                   1A   Overlay( SPLA0100_T: 1486 )
     D   datWtrBegan                  7A   Overlay( SPLA0100_T: 1487 )
     D   timWtrBegan                  6A   Overlay( SPLA0100_T: 1494 )
     D   datWtrComp                   7A   Overlay( SPLA0100_T: 1500 )
     D   timWtrComp                   6A   Overlay( SPLA0100_T: 1507 )
     D   jobSysNam                    8A   Overlay( SPLA0100_T: 1513 )
     D   ASPdevNam                   10A   Overlay( SPLA0100_T: 1521 )
     D   expDate                      7A   Overlay( SPLA0100_T: 1531 )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato SPLA0200 para la API Recuperar Atributos de Archivo en -
    ‚ * - Spool (QUSRSPLA)                                               -
    ‚ * -                                                                -
    ‚ * - Nota: la declaración de esta estructura no es completa ya que  -
    ‚ * - faltan subcampos.                                              -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytRtn         Bytes Devueltos.                                -
    ‚ * - bytAvl         Bytes Disponibles.                              -
    ‚ * - jobName        Nombre del trabajo.                             -
    ‚ * - userName       Nombre del usuario.                             -
    ‚ * - jobNumber      Número del trabajo.                             -
    ‚ * - splfName       Nombre del archivo en spool.                    -
    ‚ * - splfNumber     Número del archivo en spool.                    -
    ‚ * - formTyp        Tipo de formulario.                             -
    ‚ * - usrDta         Datos especificados por el usuario.             -
    ‚ * - ...                                                            -
    ‚ * - totPages       Páginas totales.                                -
    ‚ * - ...                                                            -
    ‚ * - pagLen         Longitud de página.                             -
    ‚ * - pagWidth       Ancho de página.                                -
    ‚ * - ...                                                            -
    ‚ * - pagRot         Rotación de página.                             -
    ‚ * - ...                                                            -
    ‚ * - bufSiz         Tamaño del buffer del archivo en spool.         -
    ‚ * - ...                                                            -
    ‚ * - nbrBuf         Número de buffers.                              -
    ‚ * - ...                                                            -
    ‚ * - splfSize       Tamaño del archivo en spool.                    -
    ‚ * - splfSizMult    Multiplicador del tañao del archivo en spool.   -
    ‚ * ------------------------------------------------------------------

     D SPLA0200_T      DS                  Based( apityp_ )
     D                                     Qualified
     D   bytRtn                      10I 0 Overlay( SPLA0200_T:    1 )
     D   bytAvl                      10I 0 Overlay( SPLA0200_T:    5 )
     D   jobName                     10A   Overlay( SPLA0200_T:   49 )
     D   userName                    10A   Overlay( SPLA0200_T:   59 )
     D    usrNam                     10A   Overlay( SPLA0200_T:   59 )
     D   jobNumber                    6A   Overlay( SPLA0200_T:   69 )
     D   splfName                    10A   Overlay( SPLA0200_T:   75 )
     D   splfNumber                  10I 0 Overlay( SPLA0200_T:   85 )
     D   formTyp                     10A   Overlay( SPLA0200_T:   89 )
     D   usrDta                      10A   Overlay( SPLA0200_T:   99 )
    ‚D* ...
     D   totPages                    10I 0 Overlay( SPLA0200_T:  149 )
    ‚D* ...
     D   pagLen                      10I 0 Overlay( SPLA0200_T:  433 )
     D   pagWidth                    10I 0 Overlay( SPLA0200_T:  437 )
    ‚D* ...
     D   pagRot                      10I 0 Overlay( SPLA0200_T:  553 )
    ‚D* ...
     D   bufSiz                      10I 0 Overlay( SPLA0200_T:  861 )
    ‚D* ...
     D   nbrBuf                      10I 0 Overlay( SPLA0200_T:  997 )
    ‚D* ...
     D   splfSize                    10I 0 Overlay( SPLA0200_T: 3777 )
     D   splfSizMult                 10I 0 Overlay( SPLA0200_T: 3781 )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato SPLF0100 usuado por el API List Spooled Files QUSLSPL  -
    ‚ * ------------------------------------------------------------------
    ‚ * - userName       Nombre del usuario                              -
    ‚ * - outqName       Nombre de la cola de salida                     -
    ‚ * - outqLib        Biblioteca de la cola de salida                 -
    ‚ * - formType       Tipo de formulario                              -
    ‚ * - userData       Datos de usuario                                -
    ‚ * - intJobId       Identificador interno del trabajo               -
    ‚ * - intSplfId      Identificador interno del archivo en spool      -
    ‚ * - reserved       Reservado                                       -
    ‚ * - auxStgPool     Agrupación Almacenamiento Auxiliar              -
    ‚ * ------------------------------------------------------------------

     D SPLF0100_T      DS                  Based( apiTyp_ )
     D                                     Qualified
     D   userName                    10A   Overlay( SPLF0100_T: 1 )
     D   outqName                    10A   Overlay( SPLF0100_T: 11 )
     D   outqLib                     10A   Overlay( SPLF0100_T: 21 )
     D   formType                    10A   Overlay( SPLF0100_T: 31 )
     D   userData                    10A   Overlay( SPLF0100_T: 41 )
     D   intJobId                    16A   Overlay( SPLF0100_T: 51 )
     D   intSplfId                   16A   Overlay( SPLF0100_T: 67 )
     D   reserved                     2A   Overlay( SPLF0100_T: 83 )
     D   auxStgPool                  10I 0 Overlay( SPLF0100_T: 85 )

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato SPLF0300 usuado por el API List Spooled Files QUSLSPL  -
    ‚ * ------------------------------------------------------------------
    ‚ * - jobName        Nombre del trabajo                              -
    ‚ * - userName       Nombre del usuario                              -
    ‚ * - jobNumber      Número del trabajo                              -
    ‚ * - splfName       Nombre del archivo en spool                     -
    ‚ * - splfNumber     Número del archivo en spool                     -
    ‚ * - splfStatus     Estado del archivo en spool                     -
    ‚ * - crtDate        Fecha cuando fue creado                         -
    ‚ * - crtTime        Hora cuando fue creado                          -
    ‚ * - splfSched      Planificación salida en spool                   -
    ‚ * - sysName        Nombre del sistema                              -
    ‚ * - userData       Datos especificados por el usuario              -
    ‚ * - formType       Tipo de formulario                              -
    ‚ * - outqName       Cola de salida                                  -
    ‚ * - outqLib        Biblioteca de la cola de salida                 -
    ‚ * - auxStgPool     Agrupación almacenamiento exterior              -
    ‚ * - splfSize       Ocupación del archivo en spool                  -
    ‚ * - splfSizMult    Multiplicador del tamaño                        -
    ‚ * - pages          Total páginas                                   -
    ‚ * - copies         Número de copias                                -
    ‚ * - priority       Prioridad                                       -
    ‚ * ------------------------------------------------------------------

     D SPLF0300_T      DS                  Based( apiTyp_ )
     D                                     Qualified
     D   jobName                     10A   Overlay( SPLF0300_T: 1 )
     D   userName                    10A   Overlay( SPLF0300_T: 11 )
     D   jobNumber                    6A   Overlay( SPLF0300_T: 21 )
    ‚D* El campo 'splfNamer' está mal escrito. Se deja para mantener
    ‚D* la compatibilidad (2009.05.14)
     D   splfNamer                   10A   Overlay( SPLF0300_T: 27 )
     D   splfName                    10A   Overlay( SPLF0300_T: 27 )
    ‚D*
     D   splfNumber                  10I 0 Overlay( SPLF0300_T: 37 )
     D   splfStatus                  10I 0 Overlay( SPLF0300_T: 41 )
     D   crtDate                      7A   Overlay( SPLF0300_T: 45 )
     D   crtTime                      6A   Overlay( SPLF0300_T: 52 )
     D   splfSched                    1A   Overlay( SPLF0300_T: 58 )
     D   sysName                     10A   Overlay( SPLF0300_T: 59 )
     D   userData                    10A   Overlay( SPLF0300_T: 69 )
     D   formType                    10A   Overlay( SPLF0300_T: 79 )
     D   outqName                    10A   Overlay( SPLF0300_T: 89 )
     D   outqLib                     10A   Overlay( SPLF0300_T: 99 )
     D   auxStgPool                  10I 0 Overlay( SPLF0300_T: 109 )
     D   splfSize                    10I 0 Overlay( SPLF0300_T: 113 )
     D   splfSizMult                 10I 0 Overlay( SPLF0300_T: 117 )
     D   pages                       10I 0 Overlay( SPLF0300_T: 121 )
     D   copies                      10I 0 Overlay( SPLF0300_T: 125 )
     D   priority                     1A   Overlay( SPLF0300_T: 129 )

    ‚ * ------------------------------------------------------------------
    ‚ * - Cabecera genérica para los formatos SPFRxxxx de la API Obtener -
    ‚ * - Datos del Archivo en Spool (QSPGETSP)                          -
    ‚ * ------------------------------------------------------------------
    ‚ * - usrArea        Área de usuario genérica.                       -
    ‚ * - hdrSize        Tamaño de la cabecera.                          -
    ‚ * - structLvl      Nivel de la estructura.                         -
    ‚ * - splfLvl        Nivel del archivo en spool.                     -
    ‚ * - format         Formato de la información devuelta.             -
    ‚ * - compInd        Indicador de información completa.              -
    ‚ * - usrSpcSiz      Bytes utilizados del espacio de usuario.        -
    ‚ * - offBuf1        Desplazamiento al primer buffer.                -
    ‚ * - reqBufs        Número de buffers solicitados.                  -
    ‚ * - rtnBufs        Número de buffers devueltos.                    -
    ‚ * - prtDtaSiz      Tamaño de los datos de impresión.               -
    ‚ * - nbrCompPag     Número de páginas completas.                    -
    ‚ * - nbrPag1        Número de la primera página.                    -
    ‚ * - offPag1        Desplazamiento a la primera página.             -
    ‚ * ------------------------------------------------------------------

     D SPFR_genHdr_T   DS                  Based( apityp_ )
     D                                     Qualified
     D   usrArea                     64A   Overlay( SPFR_genHdr_T: 1 )
     D   hdrSize                     10I 0 Overlay( SPFR_genHdr_T: 65 )
     D   stuctLvl                     4A   Overlay( SPFR_genHdr_T: 69 )
     D   splfLvl                      6A   Overlay( SPFR_genHdr_T: 73 )
     D   format                       8A   Overlay( SPFR_genHdr_T: 79 )
     D   compInd                      1A   Overlay( SPFR_genHdr_T: 87 )
     D                                1A
     D   usrSpcSiz                   10I 0 Overlay( SPFR_genHdr_T: 89 )
     D   offBuf1                     10I 0 Overlay( SPFR_genHdr_T: 93 )
     D   reqBufs                     10I 0 Overlay( SPFR_genHdr_T: 97 )
     D   rtnBufs                     10I 0 Overlay( SPFR_genHdr_T: 101 )
     D   prtDtaSiz                   10I 0 Overlay( SPFR_genHdr_T: 105 )
     D   nbrCompPag                  10I 0 Overlay( SPFR_genHdr_T: 109 )
     D   nbrPag1                     10I 0 Overlay( SPFR_genHdr_T: 113 )
     D   offPag1                     10I 0 Overlay( SPFR_genHdr_T: 117 )
     D                                8A

    ‚ * ------------------------------------------------------------------
    ‚ * - Formato SPRL0100 usuado por la API Retrieve Identity of Last   -
    ‚ * - Spooled File Created (QSPRILSP)                                -
    ‚ * ------------------------------------------------------------------
    ‚ * - bytRtn         Bytes devueltos.                                -
    ‚ * - bytAvl         Bytes disponibles.                              -
    ‚ * - splfNam        Nombre del archivo en spool.                    -
    ‚ * - jobName        Nombre del trabajo.                             -
    ‚ * - jobUsr         Nombre del usuario del trabajo.                 -
    ‚ * - jobNbr         Número del trabajo.                             -
    ‚ * - splfNbr        Número del archivo en spool.                    -
    ‚ * - jobSysNam      Nombre del sistema del trabajo.                 -
    ‚ * - splfCrtDat     Fecha de creación del archivo en spool.         -
    ‚ * - splfCrtTim     Hora de creación del archivo en spool.          -
    ‚ * ------------------------------------------------------------------

     D SPRL0100_T      DS                  Based( apiTyp_ )
     D                                     Qualified
     D   bytRtn                      10I 0 Overlay( SPRL0100_T:  1 )
     D   bytAvl                      10I 0 Overlay( SPRL0100_T:  5 )
     D   splfNam                     10A   Overlay( SPRL0100_T:  9 )
     D   jobName                     10A   Overlay( SPRL0100_T: 19 )
     D   jobUsr                      10A   Overlay( SPRL0100_T: 29 )
     D   jobNbr                       6A   Overlay( SPRL0100_T: 39 )
     D   splfNbr                     10I 0 Overlay( SPRL0100_T: 45 )
     D   jobSysNam                    8A   Overlay( SPRL0100_T: 49 )
     D   splfCrtDat                   7A   Overlay( SPRL0100_T: 57 )
     D                                1A   Overlay( SPRL0100_T: 64 )
     D   splfCrtTim                   6A   Overlay( SPRL0100_T: 65 )

    ‚D*  ¡OBSOLETOS! Se mantienen por compatibilidad (2007-06-21)
     D SPLA0100        DS                  Based( apiTyp_ )
     D                                     LikeDs( SPLA0100_T )
     D SPLF0100        DS                  Based( apiTyp_ )
     D                                     LikeDs( SPLF0100_T )
     D SPLF0300        DS                  Based( apiTyp_ )
     D                                     LikeDs( SPLF0300_T )
     D TypeSplfHandle  S                   Based( apiType_ )
     D                                     Like( SPLF_handle_T )
     D TypeIntSplfId   S                   Based( apiType_ )
     D                                     Like( SPLF_intId_T )


    ‚ * ==================================================================
    ‚ * = DECLARACIÓN DE FUNCIONES Y PROCEDIMIENTOS PUBLICOS             =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - CrtSplf - Crear archivo en spool                               -
    ‚ * -                                                                -
    ‚ * - Create Spooled File (QSPCRTSP)                                 -
    ‚ * ------------------------------------------------------------------

     D CrtSplf         PR                  ExtPgm( 'QSPCRTSP' )
     D   handle                                  Like( SPLF_handle_T )
     D   attributes                              Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )

    ‚ * ------------------------------------------------------------------
    ‚ * - OpnSplf - Abrir archivo en spool                               -
    ‚ * -                                                                -
    ‚ * - Open Spooled File (QSPOPNSP)                                   -
    ‚ * ------------------------------------------------------------------

     D OpnSplf         PR                  ExtPgm( 'QSPOPNSP' )
     D   handle                                  Like( SPLF_handle_T )
     D   job                               Const Like( TypeQualJobName )
     D   intJob                            Const Like( TypeIntJobId )
     D   intSpl                            Const Like( SPLF_intId_T )
     D   spoolName                         Const Like( TypeName )
     D   spoolNbr                          Const Like( TypeInt )
     D   nbrBuf                            Const Like( TypeInt )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )

    ‚ * ------------------------------------------------------------------
    ‚ * - CloSplf - Cerrar archivo en spool                              -
    ‚ * -                                                                -
    ‚ * - Close Spooled File (QSPCLOSP)                                  -
    ‚ * ------------------------------------------------------------------

     D CloSplf         PR                  ExtPgm( 'QSPCLOSP' )
     D   handle                            Const Like( SPLF_handle_T )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )

    ‚ * ------------------------------------------------------------------
    ‚ * - GetSplfDta - Obtener datos de un archivo en spool              -
    ‚ * -                                                                -
    ‚ * - Get Spooled File Data (QSPGETSP)                               -
    ‚ * ------------------------------------------------------------------

     D GetSplfDta      PR                  ExtPgm( 'QSPGETSP' )
     D   handle                            Const Like( SPLF_handle_T )
     D   usrspc                            Const Like( TypeQualName )
     D   format                            Const Like( TypeApiFormat )
     D   bufNo                             Const Like( TypeInt )
     D   waitFor                           Const Like( TypeName )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )

    ‚ * ------------------------------------------------------------------
    ‚ * - PutSplfDta - Poner datos de un archivo en spool                -
    ‚ * -                                                                -
    ‚ * - Put Spooled File Data (QSPPUTSP)                               -
    ‚ * ------------------------------------------------------------------

     D PutSplfDta      PR                  ExtPgm( 'QSPPUTSP' )
     D   handle                            Const Like( SPLF_handle_T )
     D   usrspc                            Const Like( TypeQualName )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )

    ‚ * ------------------------------------------------------------------
    ‚ * - RtvSplfAttr - Recuperar atributos de archivo en spool          -
    ‚ * -                                                                -
    ‚ * - Retrieve Spooled File Attributes (QUSRSPLA)                    -
    ‚ * ------------------------------------------------------------------

     D RtvSplfAttr     PR                  ExtPgm( 'QUSRSPLA' )
     D   rcvVar                                  Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   rcvVarLen                         Const Like( TypeInt )
     D   format                            Const Like( TypeApiFormat )
     D   qualJob                           Const Like( TypeQualJobName )
     D   intJob                            Const Like( TypeIntJobId )
     D   intSpool                          Const Like( SPLF_intId_T )
     D   splfName                          Const Like( TypeName )
     D   splfNbr                           Const Like( TypeInt )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )

      /If Defined( *V5R2M0 )
    ‚ * ------------------------------------------------------------------
    ‚ * - RtvIdtLastSplf - Recuperar identidad del último archivo en     -
    ‚ * -                  spool creado                                  -
    ‚ * -                                                                -
    ‚ * - Retrieve Identity of Last Spooled File Created (QSPRILSP)      -
    ‚ * ------------------------------------------------------------------

     D RtvIdtLastSplf  PR                  ExtPgm( 'QSPRILSP' )
     D   rcvVar                                  Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   rcvVarLen                         Const Like( TypeInt )
     D   format                            Const Like( TypeApiFormat )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )
      /Endif

    ‚ * ------------------------------------------------------------------
    ‚ * - ListSplf - Listar archivos en spool                            -
    ‚ * -                                                                -
    ‚ * - List Spooled File (QUSLSPL)                                    -
    ‚ * ------------------------------------------------------------------

     D LstSplf         PR                  ExtPgm( 'QUSLSPL' )
     D   usrSpc                            Const Like( TypeQualName )
     D   format                            Const Like( TypeApiFormat )
     D   userID                            Const Like( TypeName )
     D   outQ                              Const Like( TypeQualName )
     D   formType                          Const Like( TypeName )
     D   usrDta                            Const Like( TypeName )
    ‚D* Grupo Opcional 1
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE: *NOPASS )
    ‚D* Grupo Opcional 2
     D   qualJob                           Const Like( TypeQualJobName )
     D                                           Options( *NOPASS )
     D   keys                              Const Like( TypeInt )
     D                                           Dim(32767)
     D                                           Options( *VARSIZE:
     D                                             *NOPASS: *OMIT )
     D   nbrKeys                           Const Like( TypeInt )
     D                                           Options( *NOPASS )
    ‚D* Grupo Opcional 3
     D   ASP                               Const Like( TypeInt )
     D                                           Options( *NOPASS )
      /If Defined( *V5R2M0 )
    ‚D* Grupo Opcional 4
     D   systemName                   8A   Const Options( *NOPASS )
     D   startDate                    7A   Const Options( *NOPASS )
     D   startTime                    6A   Const Options( *NOPASS )
     D   endDate                      7A   Const Options( *NOPASS )
     D   endTime                      6A   Const Options( *NOPASS )
      /EndIf
