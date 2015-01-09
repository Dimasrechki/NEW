.model small
.stack
.data
mes_vvod db 13,10,'Vvedite stroku: $'
mes_rez db 13,10,'Rezult: $'

buf1 db 20
len1 db 0
str1 db 20 dup('$')
buf2 db 20
len2 db 0
str2 db 20 dup('$')

.code
;ASSUME ds:@data,es:@data
main:
mov ax,@data
mov ds,ax
mov es,ax
xor ax,ax
 CLD
lea dx,mes_vvod
mov ah,09h
int 21h

lea dx,buf1
mov ah,0ah
int 21h


lea dx,mes_vvod
mov ah,09h
int 21h

lea dx,buf2
mov ah,0ah
int 21h

lea di,str1
lea si,str2

xor ax,ax
xor dx,dx
xor cx,cx
mov cl,len1

lea dx,mes_rez
mov ah,09h
int 21h

cycle1:
	jcxz exit
	repne cmpsb
	jne cycle1   
	dec si
	lodsb
	mov dx,ax
	mov ah,02h
	int 21h
	jmp cycle1
	
exit:
	mov ax,4c00h
	int 21h
end main

