; creacion de archivos de texto
; creador: @daniel_baf
; fecha: 2023-03-31

%include        '../../utils/stdio32.asm'

SECTION .data
    filename        db          'read.txt', 0H

SECTION .text
    global      _start

_start:
    mov         ecx, 0754o          ; o = octal con permiso 0754 rwx
    mov         ebx, filename
    mov         eax, 8
    int         80h

    call        sys_exit