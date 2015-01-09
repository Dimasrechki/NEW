.model small
.stack 100h
.data
msg1 db 13,10,'Vvedite stroku $'
msg2 db 13,10,'Result $'
msg3 db 'Vse sovpalo. Udalena stroka$' 
str1 db 20,21 dup('$')
str2 db 20,21 dup('$')
res db 20 dup ('$')
.code
main:
    mov ax,@data
    mov ds,ax
    mov es,ax
    cld      
    
    mov ah,9h
    lea dx,msg1
    int 21h    
    
    lea dx,str1
    mov ah,0Ah
    int 21h 
    
    mov ah,9h
    lea dx,msg1
    int 21h    
    
    mov ah,0Ah
    lea dx,str2
    int 21h
    
           
    xor cx,cx
    mov cl,str1[1]
    
    xor si,si
    xor di,di
    lea si,str1[2]
    lea di,str2[2] 
    xor bx,bx
    xor ax,ax
    
    cycle:     
        lodsb
        mov dl,cl
        mov cl,str2[1]
        repne scasb  
        jcxz met
        jmp mm:
        met: 
        mov res[bx],al
        inc bx
        mm:           
        mov cl,dl
    loop cycle 
  
    mov ah,9h
    
    cmp bl,0
    jne print_
    lea dx,msg3
    int 21h
    jmp exit_
print_:    
    lea dx,msg2
    int 21h
    lea dx,res
    int 21h
exit_:
    mov ah,4ch    
    int 21h