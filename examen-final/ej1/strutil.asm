SECTION .data
SECTION .bss
    str_input_1:    resb        127         ; max input entry
    str_input_2:    resb        128         ; max input entry
    str_concat:     resb        255         ; 255 bytes + 1 null
SECTION .text

; ------------------------------------------ ;
;               CONCAT STRING                ;
; ------------------------------------------ ;
concat_str:
    ; backup
    push        ecx
    push        esi
    push        edi

    concat_str_copy_data:
        ; copiamos el contenido de eax en str_input_2
        mov         esi, eax            ; esi -> buffer
        mov         edi, str_input_1    ; edi -> str_input_1
        push        eax
        call        strLen; calculamos longitud de texto
        mov         ecx, eax            ; ecx = longitud cadena
        pop         eax 
        cld                             ; asegurarse de que el puntero de origen avance hacia adelante
        rep         movsb

        ; copaimos el contenido de eax en str_input_2
        mov         esi, ebx            ; esi -> buffer
        mov         edi, str_input_2    ; edi -> in_country
        push        eax
        call        strLen; calculamos longitud de texto
        mov         ecx, eax            ; ecx = longitud cadena
        pop         eax 
        cld                             ; asegurarse de que el puntero de origen avance hacia adelante
        rep         movsb

    ; concatenamos
    ; mover la primera cadena a la posicion de la cadena concatenada
    mov         esi, str_input_1            ; esi -> input 1
    mov         edi, str_concat             ; edi -> cadena concatenada
    cld
    ; calculos de offsets input 1
    mov         eax, str_input_1            ; eax -> input 1
    call        strLen                      ; eax = eax.length
    mov         ecx, eax                    ; ecx -> eax.length
    rep         movsb                       ; copia el contenido

    ; calculos de offset input 2
    ; mover la primera cadena a la posicion de la cadena concatenada
    mov         esi, str_input_2            ; esi -> input 2
    ; calculamos offset
    mov         eax, str_input_2            ; eax = input 2
    call        strLen                      ; eax = eax.length
    mov         ecx, str_concat             ; ecx -> str_concat
    add         ecx, eax                    ; ecx += str_input_2.length
    mov         edi, ecx       ; la seguna cadena empieza desde el offset de cadena 1 
    ; calculos de offset de input 2
    mov         eax, str_input_2            ; eax -> input 2
    call        strLen                      ; eax = eax.length
    inc         eax                         ; eax ++ por null
    mov         ecx, eax                    ; ecx -> eax.length = str_input2.length
    rep         movsb
    
    mov         eax, str_concat

    ; restore
    pop         edi
    pop         esi
    pop         ecx
    ret
