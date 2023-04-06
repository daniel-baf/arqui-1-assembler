; Posicion 2,7 de pantalla
; creador @daniel_baf
; fecha: 2023-03-29
; imprime un mensaje contrado en pantalla

%include '../../utils/stdio32.asm'

SECTION .data
    msg     db      'Arquitectura 2!!', 0H
    posxy   db      1BH, '[24;1H', 0H
    strCln  db      1BH, '[23, 18H', 0H

SECTION .text
    global  _start

_start:
    mov     eax, posxy
    call    print
    mov     eax, msg
    call    println
    call    sys_exit
    