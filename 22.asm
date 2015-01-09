.model small
.stack 
.data
	mess db "Vvedite stroku: ",0Dh,0Ah,'$'
	pryzok db "",0Dh,0Ah,'$'
  	str1ml db 200 
	str1l	DB	'$'
	str1	DB	200 dup('$')
	str2	DB	200 dup('$')
.code  
ASSUME DS:@data, es:@data
main:   
    mov ax,@data
    mov ds,ax
	mov es,ax
	xor ax,ax
	xor bx,bx
	mov bh,2
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
	lea di,str2
	xor ax,ax
cycle1:
	lods str1
	cmp al,'A'
	jb m1
	cmp al,'Z'
	ja m1
	loop cycle1
	jmp vyvod
m1:
	cmp al,'a'
	jb m2
	cmp al,'z'
	ja m2
	loop cycle1
	jmp vyvod
m2:
	stos str2
	loop cycle1
vyvod:
	lea dx,str2
	mov ah,9
	int 21h
	mov ah,0
	int 16h
    mov ah,4ch
    int 21h
end main