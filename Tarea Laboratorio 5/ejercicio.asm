org 100h

    section .text
    CALL iniciar
    CALL modotexto
    
    CALL imprimir
    MOV CX, segundonombre
    CALL imprimir
    MOV CX, primerapellido
    CALL imprimir
    MOV CX, segundoapellido
    CALL imprimir
    
    CALL pausa
    INT 20H

    ;limpia los registros y asigna valores iniciales
    iniciar:
        XOR AX, AX
        XOR BX, BX
        XOR CX, CX
        XOR DX, DX
        MOV SI, 05h ; Fila inicial para imprimir
        MOV CX, primernombre ; primera cadena a imprimir
        RET

    modotexto: 
        MOV AH, 0h ; rutina para modo texto
        MOV AL, 03h ; especifica el tipo de modo texto
        INT 10h
        RET

    imprimir:
        call movercursor
        mov DX, CX ; pasa a DX (Registro utilizado para imprimir) el valor guardado en CX
        MOV AH, 09h; rutina para imprimir cadena en DX
        INT 21h
        RET

    movercursor:
        MOV AH, 02h; rutina para mover cursor a posicion especificada en DH, DL
        INC SI; incrementar 1 al iterador para bajar 1 fila
        MOV [0200h], SI 
        MOV DH, [0200h]; Se especifica el valor de la fila
        MOV DL, 05h; empezar en columna 5
        INT 10h
        RET

    pausa:
        MOV AH, 00H ; rutina para esperar pulsacion de una tecla
        INT 16H
        RET

section .data
primernombre DW "Nestor$"
segundonombre DW "Eduardo$"
primerapellido DW "Nieto$"
segundoapellido DW "Alas$"