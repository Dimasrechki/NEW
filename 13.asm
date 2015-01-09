.model small
.stack
.data
	num1 db 2,5,3,0
	len1 = $ - num1
	num2 db 7
	rezult db len1 dup(0)
.code
start:	
	mov ax,@data
	mov ds,ax
	xor si,si
	xor dx,dx
	mov cx,len1
summ:
	mov al,num1[si]
	mul num2
	aam
	adc al,dl
	aaa
	mov dl,ah
	mov rezult[si],al
	inc si
	loop summ
	mov cx,si
	dec si
print:	
	mov dl,rezult[si]
	add dl,'0'
	mov ah,2
	int 21h
	dec si
	loop print
	mov ah,0
	int 16h
	mov ah,4Ch
	int 21h
end start