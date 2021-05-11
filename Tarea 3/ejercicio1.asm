org 100h

section .text
    XOR AX, AX
    MOV word CX, 8d ; 8 digitos de carnet
    CALL guardarcarnet
    CALL sumardigito
    MOV byte BL, 8d
    DIV BL
    MOV [020Ah], AL ; suma = 29 / 8 = 3 con residuo 5
    int 20h

guardarcarnet:
    MOV byte [0200h], 0d
    MOV byte [0201h], 0d
    MOV byte [0202h], 1d
    MOV byte [0203h], 9d
    MOV byte [0204h], 9d
    MOV byte [0205h], 0d
    MOV byte [0206h], 1d
    MOV byte [0207h], 9d
    ret

sumardigito:
    ADD AL, [0200h + DI]
    INC DI
    LOOP sumardigito
    ret

