org 	100h

section .text

	call 	grafico	; Llamada a iniciar modo grafico 13h

	xor 	si, si
	xor 	di, di

    ;Horizontal 1
	mov 	si, 75d ; X -> Columna
	mov 	di, 25d ; Y -> Fila
	call 	linea_h3

    ;horizontal 2
	mov 	si, 75d ; X -> Columna
	mov 	di, 175d ; Y -> Fila
	call 	linea_h

    ;horizontal 3
    mov 	si, 100d ; X -> Columna
	mov 	di, 150d ; Y -> Fila
	call 	linea_h2

    ;vertical 1
	mov	    si, 75d ; X -> Columna
	mov 	di, 25d ; Y -> Fila
	call 	linea_v

    ;vertical 2
	mov	    si, 100d ; X -> Columna
	mov 	di, 25d ; Y -> Fila
	call 	linea_v2

    ;vertical 3
	mov	    si, 175d ; X -> Columna
	mov 	di, 150d ; Y -> Fila
	call 	linea_v

	call 	kb		

	int 	20h

grafico:
    mov	ah, 00h
	mov	al, 13h
	int 	10h
	ret

pixel:	
    mov	ah, 0Ch
	mov	al, 1010b
	int 	10h
	ret

linea_h: 
lupi_h:	
    mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	    dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, 175d
	jne 	lupi_h
	ret

linea_h2: 
lupi_h2:	
    mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	    dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, 175d
	jne 	lupi_h2
	ret

linea_h3: 
lupi_h3:	
    mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	    dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, 100d
	jne 	lupi_h3
	ret

linea_v:
lupi_v:	
    mov 	cx, si ; Columna 
	mov	    dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 175d
	jne 	lupi_v
	ret

linea_v2:
lupi_v2:	
    mov 	cx, si ; Columna 
	mov	    dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 150d
	jne 	lupi_v2
	ret

linea_v3:
lupi_v3:	
    mov 	cx, si ; Columna 
	mov	    dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 175d
	jne 	lupi_v3
	ret


kb: 	mov	ah, 00h
	int 	16h
	ret

section .data