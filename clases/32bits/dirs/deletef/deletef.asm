%include        '../../../../utils/stdio32.asm'

SECTION .data
    filename    db      'readme.txt'
SECTION .text
    global      _start:

_start:
    mov     ebx, filename       ; save on ebx the namefile
    mov     eax, 10             ; SYS_UNLINK
    int     80H                 ; kernel

    call    sys_exit
