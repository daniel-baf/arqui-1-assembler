; Hola mundo utilizando archivo de cabecera con funciones de impresion en pantalla
; creador: Daniel Bauitista AKA mayoneso
; fecha: 10 de marzo 2023
; Ejemplo de impresion en pantalla con uso de archivos de cabecera

; INICIO DE PROGRAMA
%include 'stdio32.asm'

SECTION .data
    ; nota = esto genera un error, porque el metodo de stdio32 busca el caracter 0 en la cadena y en ningun momento hemos generado
    ; el caracter 0, por eso agregamos 0H
    msg1 db     "Hola Arquitectura II!", 0AH, 0H ; msg = Hola arqu...
    msg2 db     "Reutilizando funciones...", 0AH, 0H ;

SECTION .text

global _start

_start:
    mov eax, msg1
    call printStr
    mov eax, msg2
    call printStr
    call endP