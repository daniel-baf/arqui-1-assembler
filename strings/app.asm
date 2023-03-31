; Aplicacion principal para el testeo de las funciones implementadas
; creador: @daniel-baf
; fecha: 10 de marzo del 2023
; ultima actualización: 10 de marzo del 2023

%include        'stdio32.asm'

SECTION         .data
    msg_name        db      "Ingresa tu nombre: ", 0H
    msg_sec_nam     db      "Ingresa tu apellido: ", 0H
    msg_country     db      "Ingresa tu pais: ", 0H
    msg_final_1     db      "Hola, ", 0H
    msg_final_2     db      "! vives en ", 0H

SECTION         .bss
    in_name:        resb    255
    in_sec_name:    resb    255
    in_country:     resb    255

SECTION         .text
    global      _start


_start:
    call        request_data
    call        sys_exit

request_data:
    push        ecx

    request_data_name:
        mov         eax, msg_name       ; imprime el mensaje de nombre
        call        print
        call        readline            ; leemos el valor ingresado
        ; copaimos el contenido de eax en in_name
        mov         esi, eax            ; esi -> buffer
        mov         edi, in_name        ; edi -> in_name
        push        eax
        call        strLen; calculamos longitud de texto
        mov         ecx, eax            ; ecx = longitud cadena
        pop         eax 
        cld                             ; asegurarse de que el puntero de origen avance hacia adelante
        rep         movsb

    request_data_second_name:
        mov         eax, msg_sec_nam    ; imprime el mensaje de apellido
        call        print
        call        readline            ; leemos el valor ingresado
        ; copaimos el contenido de eax en in_name
        mov         esi, eax            ; esi -> buffer
        mov         edi, in_sec_name    ; edi -> in_country
        push        eax
        call        strLen; calculamos longitud de texto
        mov         ecx, eax            ; ecx = longitud cadena
        pop         eax 
        cld                             ; asegurarse de que el puntero de origen avance hacia adelante
        rep         movsb

    request_data_country:
        mov         eax, msg_country    ; imprime el mensaj de ciudad
        call        print
        call        readline            ; leemos el valor ingresado
        ; copaimos el contenido de eax en in_name
        mov         esi, eax            ; esi -> buffer
        mov         edi, in_country     ; edi -> in_country
        push        eax
        call        strLen; calculamos longitud de texto
        mov         ecx, eax            ; ecx = longitud cadena
        pop         eax 
        cld                             ; asegurarse de que el puntero de origen avance hacia adelante
        rep         movsb

    request_data_print_result:
        mov         eax, msg_final_1        ; eax -> "Hola, "
        call        print                   ; imprime "Hola, "

        mov         eax, in_name            ; eax -> <NOMBRE>
        call        print                   ; imprime <NOMBRE>

        mov         eax, 20H                ; eax = \s
        push        eax                     ; stack.push
        mov         eax, esp                ; eax -> esi
        call        print                   ; imprime \s
        
        mov         eax, in_sec_name        ; eax -> <APELLIDO>
        call        print                   ; imprime <APELLIDO>
        pop         eax

        mov         eax, msg_final_2        ; eax -> " vives en "
        call        print                   ; imprime " vives en "

        mov         eax, in_country         ; eax -> <CIUDAD>
        call        println                 ; imprime <CIUDAD>\n

    pop         ecx         ; recupera los datos

    ret