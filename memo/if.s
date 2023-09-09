Test:   cmp ax, 3   ;if( AX < 3 )
        jae .False  ;{
.True:  mov bx, 2   ;   BX = 2;
        jmp .End    ;}
                    ;else
.False              ;{
        mov bx, 1   ;   BX  = 1;
.End                ;}