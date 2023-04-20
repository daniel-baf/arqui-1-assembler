; ASCII https://theasciicode.com.ar/

%include '../../utils/stdio32.asm'
SECTION .data
    topB        db      218, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 0H
    msg         db      'Hola mundo!', 0H       ; len = 11
    msg2        db      'Arquitecutra I', 0H    ; len = 14

SECTION .bss

SECTION .text
    global      _start

_start:
    mov         eax, topB
    call        println

    mov         eax, msg
    call        println
    call        sys_exit
