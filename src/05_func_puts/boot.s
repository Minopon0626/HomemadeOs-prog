        BOOT_LOAD equ 0x7c00        ;ブートプログラムのロード位置

        ORG     BOOT_LOAD           ;ロードアドレスをアセンブラに指示

;****************************************************************
;  マクロ
;****************************************************************
%include "../include/macro.s"

;****************************************************************
;  エントリポイント
;****************************************************************
entry:
    jmp ipl                         ;IPLへジャンプ

    ;-------------------------------
    ;【BPB(BIOS Parameter Block)】
    ;-------------------------------
    times   90 - ($ - $$) db 0x90   ;

    ;-------------------------------
    ;【IPL(Initial Program Loader)】
    ;-------------------------------
ipl:
    cli                             ; // 割込み禁止

    mov ax, 0x0000                  ; AX = 0x0000
    mov ds, ax                      ; DS = 0x0000
    mov es, ax                      ; ES = 0x0000
    mov ss, ax                      ; SS = 0x0000
    mov sp, BOOT_LOAD               ; SP = 0x7C00

    sti                             ; // 割込み許可
    mov [BOOT.DRIVE], dl

    ;-------------------------------
    ; 文字列を表示
    ;-------------------------------

    cdecl putc, .s0                ; puts(. s0);

    ;-------------------------------
    ; 処理の終了
    ;-------------------------------
    jmp $                           ;while(1); //(無限ループ)


    ;-------------------------------
    ; データ
    ;-------------------------------

.s0 db "Booting...", 0x0A, 0x0D, 0  ;puts関数に対してローカルラベルにDB疑似命令で文字列を定義

ALIGN 2, db 0
BOOT:                               ;ブートドライブに関する情報
.DRIVE: dw 0                        ;ドライブ番号

;***********************************
; モジュール
;***********************************

%include "../modules/real/putc.s"

;***********************************
;   ブートフラグ(先頭512バイトの終了)
;***********************************
    times 510 - ($ - $$) db 0x00
    db 0x55, 0xAA