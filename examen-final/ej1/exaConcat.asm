; 32 bits app
; ejercicio no 1. examen final
; estudiante: Daniel Eduardo Bautista Fuentes
; creator: @daniel-baf

%include        '../../utils/stdio32.asm'
%include        '../../utils/string.asm'

SECTION .data
    msg_welcome         db          '------------------------', 10 ,'Concatenacion de cadenas', 10, '------------------------', 0H
    msg_request1        db          "Ingresa el primer valor a contactenar: ", 0H
    msg_request2        db          "Ingresa el segundo valor a concatenar: ", 0H
    msg_err_tmp         db          "--> NOTA: a veces se buguea con los espcacios en blanco :c", 0H
    msg_concat          db          "Cadena concatenada: ", 0H

SECTION .bss
    str_input1:     resb        255     ; resb 127 bytes for first input
    str_input2:     resb        255     ; resb 128 butes for first input
    ; save 127 && 128 'cause procedure stores 255bytes for final string
SECTION .text
    global      _start

welcome:
    pusha
    mov         eax, msg_welcome
    call        println
    popa
    ret

request_data:
    .req_input1:
        mov         eax, msg_request1   ; imprime el mensaje de nombre
        call        print               ; imprime el mensaje
        call        readline            ; leemos el valor ingresado
        ; copaimos el contenido de eax en input
        mov         esi, eax            ; esi -> buffer
        mov         edi, str_input1     ; edi -> input
        push        eax
        call        strLen              ; calculamos longitud de texto
        mov         ecx, eax            ; ecx = longitud cadena
        pop         eax 
        
        cld                             ; asegurarse de que el puntero de origen avance hacia adelante
        rep         movsb

    .req_input2:
        mov         eax, msg_request2   ; imprime el mensaje de nombre
        call        print               ; imprime el mensaje
        call        readline            ; leemos el valor ingresado
        ; copaimos el contenido de eax en input
        mov         esi, eax            ; esi -> buffer
        mov         edi, str_input2     ; edi -> input
        push        eax
        call        strLen; calculamos longitud de texto
        mov         ecx, eax            ; ecx = longitud cadena
        pop         eax 
        cld                             ; asegurarse de que el puntero de origen avance hacia adelante
        rep         movsb
    ret

concat:
    mov         eax,msg_err_tmp
    call        println
    mov         eax, msg_concat
    call        print
    mov         eax, str_input1
    mov         ebx, str_input2
    call        concat_str
    call        println
    ret

_start:
    call        welcome         ; msg main
    call        request_data    ; set data
    call        concat          ; concat inputs -> eax = input.concat
    call        sys_exit