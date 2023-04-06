; Aplicacion principal para el testeo de las funciones implementadas
; creador: @daniel-baf
; fecha: 10 de marzo del 2023
; ultima actualización: 10 de marzo del 2023

%include        '../../utils/stdio32.asm'
%include        '../../utils/string.asm'

SECTION         .data
    msg_goto        db      "Esto es un texto usando goto", 0H

SECTION         .bss

SECTION         .text
    global      _start


_start:
    call        goto_xy_func
    call        sys_exit

goto_xy_func:
    call        clear_screen

    mov         dl, 57
    mov         dh, 57
    call        goto_xy

    mov         eax, msg_goto
    call        println
    ret
