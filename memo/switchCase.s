Test:   cmp ax, 10      ;switch(AX)
        je .C10         ;
        cmp ax, 15      ;
        je .C15         ;
        cmp ax, 18      ;
        je .C18         ;
        jmp .D          ;
.C10:                   ;{
        mov bx, 1       ;case 10:
        jmp .E          ;       BX = 1;
.C15:                   ;       break;
        mov bx, 2       ;case 15:
        jmp .E          ;       BX = 2;
.C18:                   ;       break;
        mov bx, 3       ;case 18:
        jmp .E          ;       BX = 3;
.D:                     ;       break;
        mov bx, 4       ;default:
        jmp .E          ;       BX = 4
.E:                     ;       break;
                        ;}