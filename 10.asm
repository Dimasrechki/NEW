.model small
.stack 
.data
	mess db "Vvedite stroku: ",0Dh,0Ah,'$'
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
	mov bl,255
	lea dx,mess
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
	cmp bh,al
	jae met1
	mov bh,al
met1:
	cmp bl,al
	jbe met2
	mov bl,al
	loop cycle1
	jmp vyvod
met2:
	loop cycle1
vyvod:
	mov dl,bl
	mov ah,2
	int 21h
	mov dl,bh
	int 21h
exit:
	mov ah,0
	int 16h
    mov ah,4ch
    int 21h
end main