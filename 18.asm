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
	
	lea dx,mess
	mov ah,09h
	int 21h
	
	lea dx,str1ml
	mov ah,0ah
	int 21h
	
	lea dx,pryzok
	mov ah,09h
	int 21h
	lead dx,str1l
	xor cx,cx
	mov cl,str1l
	
	cld
	lea si,str1
	xor ax,ax
cycle1:
	lods str1
	push ax
	loop cycle1
zapis:	
	mov cl,str1l
	xor dx,dx
cycle2:
	pop ax
	mov ah,02h
	mov dx,ax
	int 21h
	loop cycle2
exit:
	mov ah,0
	int 16h
    mov ah,4ch
    int 21h
end main