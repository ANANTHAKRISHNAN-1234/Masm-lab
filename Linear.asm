ASSUME DS:DATA,CS:CODE
DATA SEGMENT
    MSG1 DB 10,13, "ENTER THE STRING:$"
    MSG2 DB 10,13, "ENTER THE KEY:$"
    MSG3 DB 10,13, "KEY FOUND!$"
    MSG4 DB 10,13, "KEY NOT FOUND$"
    N DB 09H DUP(?)
DATA ENDS
CODE SEGMENT
     START:MOV AX,DATA
           MOV DS,AX

           LEA SI,N

           LEA DX,MSG1
           MOV AH,09H
           INT 21H

           MOV CL,00H

      SCAN:MOV AH,01H
           INT 21H

           CMP AL,0DH
           JE ENDED
           MOV [SI],AL
           INC CL
           INC SI
           JMP SCAN

    ENDED:LEA DX,MSG2
          MOV AH,09H
          INT 21H

          MOV AH,01H
          INT 21H
          MOV BL,AL

    CHECK:DEC SI
          CMP [SI],BL
          JE FOUND
          DEC CL
          JNZ CHECK

          JMP NOTFOUND
        
    FOUND:LEA DX,MSG3
          MOV AH,09H
          INT 21H
          JMP FINISH
 NOTFOUND:LEA DX,MSG4
          MOV AH,09H
          INT 21H
   FINISH:MOV AH,4CH
          INT 21H
CODE ENDS
END START
