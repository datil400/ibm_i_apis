    ‚ *
    ‚ *  NOMBRE.......: TRIGGER_H
    ‚ *  DESCRIPCION..: Definición del buffer utilizado por los programas
    ‚ *                 activadores externos y algunas variables auxiliares
    ‚ *                 para su manejo.
    ‚ *
    ‚ *  Programador..: Javier Mora
    ‚ *  Fecha........: Abril 2015
    ‚ *
    ‚ *  Historia:
    ‚ *
    ‚ *   Fecha   Programador        Observaciones
    ‚ *  -------- ------------------ -------------
    ‚ *
    ‚ *  Uso:
    ‚ *
    ‚ *   /COPY TRIGGER_H
    ‚ *
    ‚ *  Notas :
    ‚ *

      /COPY API,StdTyp_H

    ‚ * ==================================================================
    ‚ * = DEFINICIÓN DE CONSTANTES                                       =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * -  Acción que dispara el activador (Evento)                      -
    ‚ * ------------------------------------------------------------------

     D TRG_INSERTAR    C                   '1'
     D TRG_ELIMINAR    C                   '2'
     D TRG_ACTUALIZAR  C                   '3'

     D TRG_INSERT      C                   '1'
     D TRG_DELETE      C                   '2'
     D TRG_UPDATE      C                   '3'

    ‚ * ------------------------------------------------------------------
    ‚ * -  Cuando se dispara el activador (Momento)                      -
    ‚ * ------------------------------------------------------------------

     D TRG_ANTES       C                   '2'
     D TRG_DESPUES     C                   '1'

     D TRG_BEFORE      C                   '2'
     D TRG_AFTER       C                   '1'

    ‚ * ==================================================================
    ‚ * = DECLARACION DE VARIABLES PÚBLICAS                              =
    ‚ * ==================================================================

    ‚ *
    ‚ *  Qdb_Trigger_Buffer_t
    ‚ *
    ‚ *  QSYSINC/H,TRGBUF
    ‚ *
    ‚ *  La siguiente declaración se corresponde con la parte fija
    ‚ *  del buffer utilizado por los 'activadores externos'. El área con
    ‚ *  los datos de los registros y los mapas de nulos se sitúan a
    ‚ *  continuación.
    ‚ *

     D Trigger_T       DS
     D/IF DEFINED(*V6R1M0)
     D                                     Template
     D/ELSE
     D                                     Based( stdTyp_ )
     D/ENDIF
     D   fileName                    10A   Overlay( Trigger_T:   1 )
     D   libName                     10A   Overlay( Trigger_T:  11 )
     D   member                      10A   Overlay( Trigger_T:  21 )
     D   event                        1A   Overlay( Trigger_T:  31 )
    ‚D*                1=Insertar, 2=Suprimir, 3=Actualizar
     D   time                         1A   Overlay( Trigger_T:  32 )
    ‚D*                1=Después, 2=Antes
     D   commitLvl                    1A   Overlay( Trigger_T:  33 )
    ‚D*                0=*NONE, 1=*CHG, 2=*CS, 3=*ALL
     D   ccsid                       10I 0 Overlay( Trigger_T:  37 )
     D   rrn                         10I 0 Overlay( Trigger_T:  41 )
     D   oldRcdOffs                  10I 0 Overlay( Trigger_T:  49 )
     D   oldRcdLen                   10I 0 Overlay( Trigger_T:  53 )
     D   oldNullOffs                 10I 0 Overlay( Trigger_T:  57 )
     D   oldNullLen                  10I 0 Overlay( Trigger_T:  61 )
     D   newRcdOffs                  10I 0 Overlay( Trigger_T:  65 )
     D   newRcdLen                   10I 0 Overlay( Trigger_T:  69 )
     D   newNullOffs                 10I 0 Overlay( Trigger_T:  73 )
     D   newNullLen                  10I 0 Overlay( Trigger_T:  77 )
    ‚D* Char(*) - Datos del registro original antes de ser actualizado,
    ‚D*           eliminado o leído.
    ‚D* Char(*) - Mapa de valores nulos del registro original:
    ‚D*           0=Not Null, 1=Null
    ‚D* Char(*) - Datos del registro que se ha insertado o actualizado
    ‚D*           como resultado de la operación.
    ‚D* Char(*) - Mapa de valores nulos del registro cambiado:
    ‚D*           0=Not Null, 1=Null


     D Qdb_Trigger_Buffer_t...
     D                 DS                  LikeDs( Trigger_T )
     D/IF DEFINED(*V6R1M0)
     D                                     Template
     D/ELSE
     D                                     Based( stdTyp_ )
     D/ENDIF
