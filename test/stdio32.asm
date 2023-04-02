; recopilacion de funciones para el programa usando la entrada y salida
; estandar de la computadora
; creador: @daniel-baf
; fecha: 10 de marzo del 2023
; ultima actualización: 24 de marzo del 2023

%include        'math-utils.asm'

SECTION .data

SECTION .bss
    buffer:         resb        255

SECTION .text
; ------------------------------------------ ;
;           TERMINA EL PROGRAMA              ;
; ------------------------------------------ ;
sys_exit:
    mov         ebx, 0      ; RETURN 0
    mov         eax, 1      ; SYS_EXIT
    int         80h         ; llamada a kernel
    ret

; ------------------------------------------ ;
;       CALCULO DE LONGITUD DE CADENA        ;
; ------------------------------------------ ;

; STRLEN = eax=<CADENA> eax.length -> <LONGITUD>
strLen:
    push        ebx             ; guardamos su valor en pila
    mov         ebx, eax        ; eax = ebx | ebx = dir en memoria de eax

    nextCharLenStrLen:
        cmp         byte[eax], 0            ; msg[eax] == 0 ?
        jz          nextCharLenStrLenEnd    ; GOTO nextCharLenStrLenEnd cuando no hayan mas chars
        inc         eax                     ; eax++ para loop
        jmp         nextCharLenStrLen       ; continua el loop

    nextCharLenStrLenEnd:
    sub         eax, ebx                    ; longitud de la cadena = eax - ebx
    pop         ebx                         ; recupera el valor de ebx
    ret                                     ; fin de funcion

; ------------------------------------------ ;
;           IMPRESION EN PANTALLA            ;
; ------------------------------------------ ;

; imprime un string sin salto de linea
print:
    ; backup de los valores de los registros
    push        eax             ; recuperamos el valor al final
    push        edx
    push        ecx
    push        ebx
    push        eax             ; strLen modifica eax

    call        strLen          ; calculamos la longitud de la cadena
    mov         edx, eax        ; edx = eax, eax actualmente es la longitud
    pop         eax             ; recuperamos el valor a imprimir

    mov         ecx, eax        ; ecx -> apunta a dir de eax
    mov         ebx, 1          ; 1 = SALIDA EN PANTALLA
    mov         eax, 4          ; SYS_WRITE
    int         80h             ; llamada a interrupcion de sistema

    ; restauramos los valores
    pop         ebx
    pop         ecx
    pop         edx
    pop         eax             ; recuperamos el valor
    ret

; imprime una cadena con salto de linea
println:
    call        print           ; imprime la cadena

    push        eax             ; backup
    mov         eax, 0AH        ; eax = \n
    push        eax             ; \n en pila
    mov         eax, esp        ; eax -> puntero de pila
    call        print           ; imprime \n

    pop         eax             ; borra \n
    pop         eax             ; recupera eax
    ret

; ------------------------------------------ ;
;       INGRESO DE VALOR POR CONSOLA         ;
; ------------------------------------------ ;

; lee un valor por consola hasta donde le den enter
readline:
    ; copia de seguridad
    push        edx
    push        ecx
    push        ebx

    ; Lee la entrada del usuario
    ; https://faculty.nps.edu/cseagle/assembly/sys_call.html
    mov         eax, 3          ; eax = no. de instruccion
    mov         ebx, 0          ; ebx = unsigned int
    mov         ecx, buffer     ; ecx = el buffer
    mov         edx, 255        ; edx = tamaño del buffer
    int         80H             ; llamada al sistema

    ; Busca el salto de línea en el buffer
    push        edi
    mov         edi, ecx        ; edi = dirección del buffer
    mov         ecx, eax        ; ecx = número de caracteres leídos
    xor         eax, eax        ; eax = contador de caracteres
    cld                         ; Dirección ascendente para repne scasb
    repne       scasb           ; Busca el salto de línea
    je          reemplzar_salto  ; Si se encontró el salto de línea, reemplaza con null byte

    ; Si no se encuentra el salto de línea, agrega un valor nulo al final de la entrada del usuario
    mov         byte [edi + ecx], 0H

    reemplzar_salto:
        mov         byte [edi + eax - 1], 0H     ; Reemplaza el salto de línea con null byte

    ; retornamos los vlores originales
    pop         edi
    pop         ebx
    pop         ecx
    pop         edx

    mov         eax, buffer                     ; devolvemos el valor en el buffer
    ret


; ------------------------------------------ ;
;       Impresion de numeros                 ;
; ------------------------------------------ ;

iPrintLn:
    call        iPrint      ; imprimimos el numero
    ; imprimimos el salto de linea
    push        eax

    mov         eax, 0AH    ;
    push        eax
    mov         eax, esp
    call        print
    pop         eax

    pop         eax
    ret                     ; regresamos a la funcion origen

; imprime un numero entero que este en eax
iPrint:
    ; backup de los registros
    push        eax
    push        ecx
    push        edx
    push        esi

    mov         ecx, 0      ; iniciamos el contador en 0
    div_loop:
        inc         ecx         ; conteo de digitos
        mov         edx, 0      ; limpiar hsb de la division
        mov         esi, 10     ; esi [divisor] = 10
        idiv        esi         ; <edx:eax>/ esi
        add         edx, 48     ; + 0 int incial
        push        edx         ; residuo -> stack
        cmp         eax, 0      
        jnz         div_loop

    ; fin div_loop
    print_loop:
        dec         ecx         ; decrementamos en la pila
        mov         eax, esp    ;
        call        print
        pop         eax         ; residuo ecx = eax
        cmp         ecx, 0      ; aun hay datos
        jnz         print_loop  ; saltamos

    ; restauramos valores
    pop         esi
    pop         edx
    pop         ecx
    pop         eax         ; 
    ret                     ; regresamos