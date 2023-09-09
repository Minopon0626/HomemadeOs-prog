memcpy:
        ;
        ;
        ;
                                ;BP+8|バイト数
                                ;BP+6|コピー元
                                ;BP+4|コピー先
                                ;----|-------
        push bp                 ;BP+2|IP(戻り番地)
        mov bp, sp              ;BP+0|BP(元の値)
                                ;----|-------
        ;-----------------------
        ;【レジスタの保存】
        ;-----------------------
        push ecx
        push esi
        push edi

        ;-----------------------
        ; バイト単位でのコピー
        ;-----------------------
        cld                     ;DF = 0; //+方向
        mov edi, [ebp +  8]     ;EDI = コピー先;
        mov esi, [ebp + 12]     ;EDI = コピー元;
        mov ecx, [ebp + 16]     ;EDI = バイト数;
        ;テスト用変更点