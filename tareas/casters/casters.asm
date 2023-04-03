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

    call        sys_exit

; eax = number as string
str_to_int:
    .backup:
        push        edx
        push        ecx
        push        ebx
        push        esi

    mov         ebx,0               ; acumulador
    mov         esi, eax            ; esi -> *eax, cadena

    .str_to_int_loop:
        movzx   edx, byte[esi]      ; cargar en edx el siguiente byte del string en cl
        cmp     dl, 0               ; fin de caneda?
        je      .str_to_int_done

    
        sub     dl, 48              ; cl -= ASCII('0')
        imul    ebx, 10             ; multiplica el acumulador por 10
        add     ebx, edx            ; sumamos el valur numerico al acumulador

        inc     esi                 ; continuamos el loop
        jmp     .str_to_int_loop
    .str_to_int_done:
        mov     eax, ebx
    
    .restore:
        pop     esi
        pop     ebx
        pop     ecx
        pop     edx
    ret