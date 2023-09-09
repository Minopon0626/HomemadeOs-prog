;関数func_16の作成
;C言語風呼び出し
;int func_16(int x, int y)
;引数1 = x, 引数2 = y, 返り値1
func_16:
    ;-----------------------------------------
    ;【スタックフレームの構築】
    ;-----------------------------------------
                            ;  +6|引数2
                            ;  +4|引数1
                            ;  +2|IP(戻り番地)
    push bp                 ;BP+0|BP(元の値)
    mov bp, sp              ; ---+------------
    sub sp, 2               ;-2|short i;
    push 0                  ;-4|short j=0;

    ;-----------------------------------------
    ;【処理の開始】
    ;-----------------------------------------
    mov [bp - 2], word 10   ;i = 10;
    mov [bp - 4], word 20   ;j = 20;

    mov ax, [bp + 4]        ;引数1にアクセス
    mov ax, [bp + 6]        ;引数2にアクセス

    mov ax, 1               ;return 1

    ;-----------------------------------------
    ;【スタックフレームの破棄】
    ;-----------------------------------------
    mov sp, bp              ;
    pop bp

    ret