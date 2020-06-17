org 	100h

section .text

	call 	texto	
	call 	cursor
	call 	phrase
    call    phrase2
    call    phrase3
	call	kbwait

	int 	20h

texto:	
    mov 	ah, 00h
	mov	    al, 03h
	int 	10h
	ret

cursor: 
    mov	ah, 01h
	mov 	ch, 00000000b
	mov 	cl, 00001110b
	int 	10h
	ret

w_char:	
    mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, [210h+si]
	mov 	cx, 1h
	int 	10h
	ret

kbwait: 
    mov 	ax, 0000h
	int 	16h
	ret

m_cursr:
    mov 	ah, 02h
	mov 	dx, di 
	mov 	dh, [200h+si] 
	mov 	bh, 0h
	int 	10h
	ret

phrase:
    mov 	di, 5d
    mov     cl, 3d
    mov     si, 0
    mov     [200h], cl
    mov     cl, 00001011b
    mov     [210h], cl

lupi:	
    mov 	cl, [msg+di-5d]
	call    m_cursr
	call 	w_char
	inc	    di
	cmp 	di, len
	jb	    lupi
	ret

phrase2:	
    mov 	di, 20d
    mov     cl, 10d 
    mov     si, 1d 
    mov     [201h], cl 
    mov     cl, 00001111b
    mov     [211h], cl
                
lupi2:	
    mov 	cl, [msg1+di-20d]
    call    m_cursr
    call 	w_char
    inc	    di
    cmp 	di, len1
    jb	    lupi2
    ret

phrase3:	
    mov 	di, 7d
    mov     cl, 20d 
    mov     si, 2d 
    mov     [202h], cl 
    mov     cl, 00001001b
    mov     [212h], cl

lupi3:	
    mov 	cl, [msg2+di-7d]
    call    m_cursr
    call 	w_char
    inc	    di
    cmp 	di, len2
    jb	    lupi3
    ret

section .data
msg	db 	"Mami que tu quiere? "
len 	equ	$-msg+5d

msg1	db 	"Tener buenas notas :'v *cries* "
len1 	equ	$-msg1+20d

msg2	db 	"Yo quiero perrear y perrear \o/ "
len2 	equ	$-msg2+7d