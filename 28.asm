.model small 
.stack 
.data 
CR equ 0Dh
LF equ 0Ah 
EOS equ '$'
crlf db CR, LF, EOS
a db 2,0,2 dup(0)
b db 2,0,2 dup(0)
c db 1 dup(0)
res db 2 dup(0), EOS
prmpt db 'vvedite 4islo 1: ', EOS
prmpt2 db 'vvedite 4islo 2: ', EOS
prmpt3 db 'summa: ', EOS
.code 
myproc proc near
	push bp
	mov bp,sp
	mov al, [bp+4]
	add al, [bp+6]
	sub al, 96
	mov [c], al
	mov sp,bp
	pop bp
	ret
endp myproc
start: 
	mov ax, @data 
	mov ds, ax 
				
	lea dx, prmpt
	mov ah, 9
	int 21h
	
	mov ah, 0Ah
	lea dx, a
	int 21h
	
	lea dx, crlf
	mov ah, 9
	int 21h
	
	lea dx, prmpt2
	mov ah, 9
	int 21h
	
	mov ah, 0Ah
	lea dx, b
	int 21h
	
	lea dx, crlf
	mov ah, 9
	int 21h
	
	xor ax, ax
	mov al, [a+2]
	push ax
	mov al, [b+2]	
	push ax
	call myproc
		
	mov al, [c]
	aam
	add ah, 48
	mov [res], ah
	add al, 48
	mov [res+1], al	
		
	lea dx, prmpt3
	mov ah, 9
	int 21h
	
	lea dx, res
	mov ah, 9
	int 21h
		
	mov ah, 4ch
	int 21h
end start