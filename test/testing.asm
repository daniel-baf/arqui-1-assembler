%include    '../utils/stdio32.asm'

SECTION .data
    msg_as_num      db          "El numero como numero es: ", 0H
    msg_as_str      db          "El numero como string es: ", 0H
    number          dd          141210
SECTION .bss
SECTION .text
    global      _start

_start:

    mov         eax, msg_as_num
    call        print
    mov         eax, [number]
    call        iPrintLn

    mov         eax, msg_as_str
    call        print
    mov         eax, [number]
    call        int_to_str
    call        println

    call        sys_exit