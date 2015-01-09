.model small
.stack 
.data
	mess1 db "Vvedite simvol: ",0Dh,0Ah,'$'
	mess2 db "Vvedite stroku: ",0Dh,0Ah,'$'
	pryzok db "",0Dh,0Ah,'$'
  	str1ml db 200 
	str1l	DB	'$'
	str1	DB	200 dup('$')
.code   
main:   
    mov ax,@data
    mov ds,ax
	mov es,ax
	xor ax,ax
	xor bx,bx
	
	lea dx,mess1
	mov ah,09h
	int 21h
	
	mov ah,01h
	int 21h
	mov bl,al
	
	lea dx,pryzok
	mov ah,09h
	int 21h
	lea dx,mess2
	mov ah,09h
	int 21h
	
	lea dx,str1ml
	mov ah,0ah
	int 21h
	
	lea dx,pryzok
	mov ah,09h
	int 21h
	
	xor cx,cx
	mov cl,str1l
	
	cld
	lea si,str1
	xor ax,ax
cycle1:
	lods str1
	cmp bl,al
	je met1
	loop cycle1
	jmp vyvod
met1:
	inc bh
	loop cycle1
vyvod:
	mov dl,bh
	add dl,'0'
	mov ah,2
	int 21h
	mov ah,0
	int 16h
    mov ah,4ch
    int 21h
end main