; Ejecucion de comandos del sistema
; creador: @daniel-baf
; fecha: 2023-03-30
; llamada a funciones de sistema

%include        '../utils/stdio32.asm'


SECTION         .data
    command         db          "/bin/echo", 0H             ; comando a ejecutar
    msg             db          "tu path es: ", 0H
    env1            db          "$PATH", 0H

    ; crear lista de argumentos de estructura
    args            dd          command
                    dd          msg
                    dd          env1
                    dd          0H      ; null
    enviroment      dd          env1
                    dd          0H

SECTION         .text
    global      _start

_start:
    mov         eax, enviroment
    mov         ecx, args
    mov         ebx, command
    mov         eax, 11
    int         80h

    call        sys_exit