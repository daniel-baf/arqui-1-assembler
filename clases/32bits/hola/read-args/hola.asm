; Hola mundo con paso de parametros por linea de comandos
; Creador: jefe_mayoneso
; fecha: 2023/03/15
; Impresion en pantalla con argumentos enviados

%include '../../../../utils/stdio32.asm'

SECTION .text
    global _start

_start:
    pop     ecx     ; ecx = primer valor en pila = # argumentos
    ; extraccion
nextArg:
    cmp     ecx, 0h     ; verifica si aun hay argumentos
    jz      noArgs      ; 0 -> salir del ciclo e ir a noArgs
    pop     eax         ; obtenemos el valor en el registro a
    call    println     ; imprime
    dec     ecx         ; ecx -- 
    jmp     nextArg     ; retornamos
noArgs:
    call    sys_exit        ; salir del programa
