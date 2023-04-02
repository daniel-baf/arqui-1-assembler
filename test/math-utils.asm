; recibe en eax la base y en ebx la potencia
; devuelve en eax el valor de la potencia
pow:

    .backup:
        push        ebx
        push        ecx
        push        edx

    mov     ecx, eax        ; ecx = base

    cmp     ebx, 1          ; la potencia de 1 es 1
    je      .end_pow        ; fin de la potencia

    mov     edx, 1          ; reg auxiliar para la multiplcacion

    .pow_loop:
        test        bl, 1           ; lsb de ebx es 1?
        jz          .pow_loop_end   ; si es 0, saltamos al final
        imul        edx, ecx        ; si es 1, multiplicamos el reg auxiliar por la base
        
        .pow_loop_end:
            shr     ebx, 1          ; desplazamos a la derecha los bits del exponente
            imul    ecx, ecx        ; multiplicamos la base por la misma base
            jnz     .pow_loop       ; si ebx no es 0, volvemos a multiplicar
    .end_pow:
        mov     eax, edx            ; eax = resultado
        pop     edx
        pop     ecx
        pop     ebx    
    
    ret