.model small
.stack 100h
.data

menu    db ,0dh,0ah,"***** Welcome to my Profile *****",0dh,0ah  
        db "Enter 1 for your profile",0dh,0ah
        db "Enter 2 to perform your given operation",0dh,0ah
        db "Enter 3 for exit",0dh,0ah        
        db "Please Enter Your choice",0dh,0ah,'$'
        
msg1    dw ,10,13, " please enter your name:  $"
msg2    dw ,10,13, " please enter your roll no:$"
msg3    dw ,10,13, " please enter your class & section:$"
msg4    dw ,10,13, " please enter your date of birth:$" 
out1    dw ,10,13, " your name:  $" 
out2    dw ,10,13, " your roll no:$"
out3    dw ,10,13, " your class & section:$"
out4    dw ,10,13, " your date of birth:$"      
        
        
en5     db ,0dh,0ah,"Addition operation",0dh,0ah,'$' 


num1    db ,0dh,0ah,"Enter Your First Number",0dh,0ah,'$'
num2    db ,0dh,0ah,"Enter your second number",0dh,0ah,'$'   

result  db ,0dh,0ah,"Your answer is ",0dh,0ah,'$' 
cont    db ,0dh,0ah,"do you want to continue?",0dh,0ah,'$'
ex      db ,0dh,0ah,"Program end",0dh,0ah,'$'
    
         
          en1 db 60 dup(?) 
          en2 db 60 dup(?)
          en3 db 60 dup(?)
          en4 db 60 dup(?)
          
          op1 db ?
          op2 db ?
          operand db ?
          con db ? 
          reslt db ?
.code
.startup
start:

mov ax,@data
mov ds,ax

mov ah,09h
mov dx,offset menu
int 21h 

mov ah,01h 
int 21h
cmp al,'1'
je Entry
je start

cmp al,'2'
je op
je start

cmp al,'3'
je exit



Entry: 

mov ah,09h
mov dx, offset msg1
int 21h

mov si,offset en1

input:
mov ah,1
int 21h 
cmp al,13
je disp
mov [si],al
inc si
jmp input

disp:
lea dx,out1
mov ah,09
int 21h

mov [si],'$'
mov di,offset en1
mov dl,13
mov ah,2
int 21h
mov dl,10
mov ah,2
int 21h
again:
cmp [di],'$'
je last
cmp [di],32
je next
mov dl,[di]
mov ah,2
int 21h
inc di
jmp again

next:
mov dl,13
mov ah,2
int 21h
mov dl,10
mov ah,2
int 21h
inc di
jmp again

last: 
mov ah,09h
mov dx,offset msg2
int 21h

mov si,offset en2

input1:
mov ah,1
int 21h 
cmp al,13
je disp1
mov [si],al
inc si
jmp input1

disp1:
lea dx,out2
mov ah,09
int 21h

mov [si],'$'
mov di,offset en2
mov dl,13
mov ah,2
int 21h

mov dl,10
mov ah,2
int 21h

again1:
cmp [di],'$'
je last1
cmp [di],32
je next1
mov dl,[di]
mov ah,2
int 21h
inc di
jmp again1

next1:
mov dl,13
mov ah,2
int 21h
mov dl,10
mov ah,2
int 21h
inc di
jmp again1

last1:         
mov ah,09h
mov dx,offset msg3
int 21h  

mov si,offset en3

input2:
mov ah,1
int 21h 
cmp al,13
je disp2
mov [si],al
inc si
jmp input2

disp2:
lea dx,out3
mov ah,09
int 21h

mov [si],'$'
mov di,offset en3
mov dl,13
mov ah,2
int 21h

mov dl,10
mov ah,2
int 21h

again2:
cmp [di],'$'
je last2
cmp [di],32
je next2
mov dl,[di]
mov ah,2
int 21h
inc di
jmp again2

next2:
mov dl,13
mov ah,2
int 21h
mov dl,10
mov ah,2
int 21h
inc di
jmp again2

last2:         
mov ah,09h
mov dx,offset msg4
int 21h


mov si,offset en4

input3:
mov ah,1
int 21h 
cmp al,13
je disp3
mov [si],al
inc si
jmp input3

disp3:
lea dx,out4
mov ah,09
int 21h

mov [si],'$'
mov di,offset en4
mov dl,13
mov ah,2
int 21h

mov dl,10
mov ah,2
int 21h

again3:
cmp [di],'$'
je last3
cmp [di],32
je next3
mov dl,[di]
mov ah,2
int 21h
inc di
jmp again3

next3:
mov dl,13
mov ah,2
int 21h
mov dl,10
mov ah,2
int 21h
inc di
jmp again3

last3:         
mov ah,09h
mov dx,offset cont
int 21h

mov ah,01h
int 21h 

mov con,al
mov al,con
cmp al,'y'
je start
cmp al,'n'
je exit

exit:
mov ah,09h
mov dx,offset ex
int 21h 
.exit


op:
mov ah,09h
mov dx,offset en5
int 21h


mov ah,09h
mov dx,offset num1
int 21h

mov ah,01h
int 21h
mov bh,al

mov ah,09h
mov dx,offset num2
int 21h

mov ah,01h
int 21h
mov bl,al

mov ah,09h
mov dx,offset result
int 21h

sub bl,30h
sub bh,30h
     
add bh,bl 
add bh,30h
    
mov dl,bh
mov ah,02
int 21h  

mov ah,09h
mov dx,offset cont
int 21h

mov ah,01h
int 21h 

mov con,al
mov al,con
cmp al,'y'
je start
cmp al,'n'
je exit

exit1:
mov ah,09h
mov dx,offset ex
int 21h 
.exit
end


 



ret