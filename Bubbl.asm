assume cs:code,ds:data
data segment

        msg1 db 10,13,"Enter the no of elements : $"
        msg2 db 10,13,"Enter the numers : $"
        msg3 db 10,13,"Sorted array is : $"
        n db ?
        n1 db 09h dup(?)
data ends
code segment
        start: mov ax,data
               mov ds,ax

               ;Printing "Enter the limit"
               lea dx,msg1
               mov ah,09h
               int 21h

               mov ah,01h
               int 21h
               sub al,30h
               mov n,al

               mov cl,n

               ;Printing "Enter the numbers"
               lea dx,msg2
               mov ah,09h
               int 21h

               lea si,n1

          read:mov ah,01h
               int 21h
               sub al,30h
               mov [si],al
               inc si
               dec cl
               jnz read

               mov cl,n
         loop1:      
               mov ch,n
               sub ch,01h
               lea si,n1
         loop2:
               mov dl,[si]
               cmp dl,[si+1]
               jg swap
               jmp swapped

          swap:
               xchg dl,[si+1]
               mov [si],dl

       swapped:inc si
               dec ch
               jnz loop2

               dec cl
               jnz loop1

               ;Printing "Sorted Array is"
               lea dx,msg3
               mov ah,09h
               int 21h


               ;printing Array
               lea si,n1
               mov cl,n
         print:
               mov dl,[si]
               add dl,30h
               mov ah,02h
               int 21h
               mov dl,' '
               mov ah,02h
               int 21h
               inc si
               dec cl
               jnz print

               mov ah,4ch
               int 21h

code ends
end start