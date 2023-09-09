Test:   mov cx, 0   ;for (short int CX = 0; CX < 5; CX++)
.L:     cmp cx, 5   ;{
        jge .E      ;
        ...         ;様々な処理
        inc cx      ;
        jmp .L      ;
.E:                 ;}