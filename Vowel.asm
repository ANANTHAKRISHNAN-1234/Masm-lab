ASSUME DS:DATA,CS:CODE
DATA SEGMENT
    MSG1 DB 10,13, "ENTER THE STRING:$"
    MSG2 DB 10,13, "THE NUMBER OF VOWELS ARE:$"
    VOWEL DB 'a','A','e','E','i','I','o','O','u','U','$'
    DATABUF DB 100 DUP('$')
DATA ENDS
CODE SEGMENT
    START: MOV AX,DATA
           MOV DS,AX
           LEA DX,MSG1
           MOV AH,09H
           INT 21H

           LEA DX,DATABUF
           MOV AH,0AH
           INT 21H
           MOV SI,DX

           LEA DX,MSG2
           MOV AH, 09H
           INT 21H

           MOV BL,00H
     CHECK:LEA DI,VOWEL
           MOV CX,0AH
           MOV AL,[SI]
     CONT: CMP AL,[DI]
           JE FOUND
           INC DI
           LOOP CONT
           JMP NEXT

    FOUND:INC BL

     NEXT:INC SI
          CMP [SI],0AH
          JNE CHECK

          MOV DL,BL
          ADD DL,30H
          MOV AH,02H
          INT 21H

          MOV AH,4CH
          INT 21H
CODE ENDS
END START