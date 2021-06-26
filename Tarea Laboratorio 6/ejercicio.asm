org 100h

section .text
    MOV DX, ingresar
    CALL Imprimir

    MOV BP, input
    CALL LeerCadena 

    CALL Validar
    CALL Imprimir

    INT 20h

LeerCaracter:
        MOV     AH, 01h         
        INT     21h
        RET

Imprimir:
	MOV 	AH, 09h
	INT 	21h
	RET

LeerCadena:
        MOV SI, 0h
bucle:  
        CALL    LeerCaracter
        CMP   AL, 0x0D
        JE     parar            
        MOV     [BP+SI], AL
        INC     SI
        JMP     bucle
parar:
        MOV 	byte [BP+SI], "$"
        RET

Validar: 
        MOV CX, 5 ; Se setea 5 en CX para realizar 5 iteraciones del loop
        MOV DI, CX; Utilizamos DI como incremento
iterar:
        DEC DI 
        MOV AL, [contra + DI]
        CMP AL, [input + DI]; Se compara la contraseña con el input
        JNZ ContraIncorrecta; Si no coincide la contraseña, entonces es incorrecta
        LOOP iterar
        JMP ContraCorrecta; Si todos los caracteres coinciden, la contraseña es correcta 

ContraIncorrecta:
        MOV DX, incorrecto
        RET

ContraCorrecta:
        MOV DX, correcto
        RET

section .data
ingresar db "Ingrese la clave : ", "$"
contra db "pass1", "$" ; Esta variable almacena la contraseña
correcto db "BIENVENIDO", "$"
incorrecto db "INCORRECTO", "$"
input times 5 db " "
