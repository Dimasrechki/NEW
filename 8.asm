.model small
.stack
.data
x dw 5432
str1 db 'Greater$'
str2 db 'Less$'
str3 db 'Equal$'
.code
start:
    mov ax,@data
    mov ds,ax
    mov bp,10
    mov bx,0
    mov ax,x
	mov cx,4
loop1:
    mov dx,0
    div bp
	cmp cx,2
	jbe met1
	add bh,dl
	loop loop1
	jmp print
met1:
	add bl,dl
	loop loop1
print:
    mov ah,9
    cmp bl,bh
    jae m1
    mov dl,offset str2
    int 21h
    jmp m3
m1: cmp bl,bh
    ja m2
    mov dl,offset str3
    int 21h
    jmp m3
m2: mov dl,offset str1
    int 21h
m3: mov ah,0
    int 16h 
    mov ah,4Ch
    int 21h
end start