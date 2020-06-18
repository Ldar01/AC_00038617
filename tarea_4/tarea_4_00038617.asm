;La suma de mi carnet 38617 seria 25 y el promedio seria 5
org	100h

section .text	 
	mov 	dx, msg
	call 	w_strng
	mov     dx, 0h
	mov 	si, 0h

lupi:	
	call 	kb
	cmp 	al, "$"
	je		calcular
	sub 	al,48
	add		dl,al
	jmp 	lupi

calcular:
	mov     ax, 0h
	mov     bx, 0h
	mov     cx, 0h
	mov     al, dl

	mov bx,5d
	mov cl,bl
	div cl

	mov cx, 0h
	mov cl,al

	mov 	dx, msg1
	cmp 	cl,5d
	je		mostrar

w_strng:
	mov	ah, 09h
	int 	21h
	ret

texto:	
	mov 	ah, 00h
	mov		al, 03h
	int 	10h
	ret

mostrar:
	call	w_strng
    call    kb
	int		20h

	
kb: mov	ah, 1h
	int 	21h
	ret

section .data
msg	db 	"Escribir 5 digitos del carnet (En mi caso seria 38617):  $"
msg1	db 	"En el segundo $"
