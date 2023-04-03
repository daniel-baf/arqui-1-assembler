; Aplicacion que sirve para castear string a numero y vicebersa
; creador: @daniel-baf
; fecha: 10 de marzo del 2023
; ultima actualización: 10 de marzo del 2023

%include        '../../utils/stdio32.asm'

SECTION         .data
    msg_str_number      db          "Este es un string: ", 0H
    msg_number          db          "Este es un numero: ", 0H
    str_number          db          "9210", 0H
    number              dd          20123
    msg_invalid_num     db          "numero ingresado no valido", 0H

SECTION         .bss
    reader:             resb        8 ; max number 8 bytes

SECTION         .text
    global      _start


_start:
    call        cast_string_func
    call        cast_int_func
    call        sys_exit

cast_int_func:
    ; muestra el numero
    mov         eax, msg_number
    call        print
    mov         eax, [number]
    call        iPrintLn
    ; muestra el convertido
    mov         eax, msg_str_number
    call        print
    mov         eax, [number]
    call        int_to_str
    ret


cast_string_func:
    ; imprime el string
    mov         eax, msg_str_number
    call        print
    mov         eax, str_number
    call        println
    ; castea el string
    mov         eax, msg_str_number
    call        print
    mov         eax, str_number
    call        str_to_int
    call        iPrintLn

    ret