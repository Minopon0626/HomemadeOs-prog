memcpy:
        ;---------------------------
        ;【スタックフレームの構築】
        ;---------------------------
                                    ;-----|---------
                                    ;BP+ 8|バイト数
                                    ;BP+ 6|アドレス1
                                    ;BP+ 4|アドレス0
                                    ;-----|---------
        push bp                     ;BP+ 2|IP(戻り番地)
        mov bp, sp                  ;BP+ 0|BP(元の値)
                                    ;-----|---------
        ;---------------------------
        ;【レジスタの保存】
        ;---------------------------
        push bx
        push cx
        push dx
        push si
        push di

        ;----------------------------
        ; 【引数の取得】
        ;----------------------------
        cld                         ;DFクリア(+方向)
        mov si, [bp + 4]            ;アドレス0
        mov di, [bp + 6]            ;アドレス1
        mov cx, [bp + 8]            ;バイト数

        ;----------------------------
        ; バイト単位での比較
        ;----------------------------