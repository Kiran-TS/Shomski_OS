; Shomski OS Bootloader
; BIOS loads us at 0x7C00

BITS 16
ORG 0x7C00

start:
    cli
    xor ax, ax        ; AX = 0
    mov ds, ax        ; DS = 0 (IMPORTANT)
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00
    sti

    mov si, message

.print:
    lodsb
    or al, al
    jz hang
    mov ah, 0x0E
    int 0x10
    jmp .print

hang:
    cli
    hlt

message db "Shomski OS bootloader running...", 0

times 510-($-$$) db 0
dw 0xAA55

