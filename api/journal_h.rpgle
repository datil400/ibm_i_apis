      /IF DEFINED( JOURNAL_H )
      /EOF
      /ENDIF
      /DEFINE JOURNAL_H

    ‚ *
    ‚ *  NOMBRE.......: JOURNAL_H
    ‚ *  DESCRIPCION..: Declaración de tipos de datos y prototipos de
    ‚ *                 funciones relacionadas con las APIs de registro
    ‚ *                 por diario y control de compromiso.
    ‚ *
    ‚ *  El diario le permite especificar los objetos que desee proteger
    ‚ *  con fines de recuperación. También proporciona un seguimiento de
    ‚ *  auditoría para los cambios de objetos. El diario ofrece una
    ‚ *  auditoría y seguimiento de la actividad para otros objetos ya
    ‚ *  sea por operaciones realizadas por el sistema o por acciones del
    ‚ *  usuario. Las APIs de diario permiten realizar la siguientes
    ‚ *  tareas:
    ‚ *
    ‚ *    - Obtener información de algunos atributos de los diarios o de
    ‚ *      los receptores de diario.
    ‚ *    - Obtener información de diario basándose en un identificador.
    ‚ *    - Enviar entradas a un diario concreto.
    ‚ *    - Añadir, eliminar, activar y desactivar diarios remotos.
    ‚ *    - Iniciar y detener el registro por diario.
    ‚ *
    ‚ *  El control de compromiso le permite definir y procesar los cambios
    ‚ *  en los recursos, tales como archivos de BBDD o tablas, como una
    ‚ *  sola unidad lógica de trabajo. Este sistema utiliza el diario para
    ‚ *  realizar las unidades de trabajo. Con estas APIs se podrán realizar
    ‚ *  las siguientes tareas:
    ‚ *
    ‚ *    - Añadir y eliminar los recursos que se utilicen en el control de
    ‚ *      compromiso (COMMIT o ROLLBACK)
    ‚ *    - Recuperar información sobre el entorno de control de compromiso.
    ‚ *    - Cambior opciones de control de compromiso.
    ‚ *    - Poner una definición de compromiso en estado
    ‚ *      'rollback-required'.
    ‚ *
    ‚ *
    ‚ *  Programador..: Javier Mora
    ‚ *  Fecha........: Abril 2013
    ‚ *
    ‚ *  Historia:
    ‚ *
    ‚ *   Fecha   Programador        Observaciones
    ‚ *  -------- ------------------ -------------
    ‚ *
    ‚ *  Usar como:
    ‚ *
    ‚ *    /Copy API,JOURNAL_H
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


    ‚ * ==================================================================
    ‚ * = DECLARACIÓN DE FUNCIONES Y PROCEDIMIENTOS PUBLICOS             =
    ‚ * ==================================================================

    ‚ * ------------------------------------------------------------------
    ‚ * - SndJrnE - Escribir una entrada en un diario concreto           -
    ‚ * -                                                                -
    ‚ * - Send Journal Entry (QJOSJRNE)                                  -
    ‚ * ------------------------------------------------------------------

     D SndJrnE         PR                  ExtPgm( 'QJOSJRNE' )
     D   jrnNamQ                           Const Like( TypeQualName )
     D   jrnEntInf                         Const Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   entDta                            Const Like( TypeBuffer )
     D                                           Options( *VARSIZE )
     D   entDtaLen                         Const Like( TypeInt )
     D   error                                   Like( TypeApiError )
     D                                           Options( *VARSIZE )
