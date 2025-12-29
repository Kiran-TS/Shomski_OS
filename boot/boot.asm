; Shomski OS Bootloader
; BIOS loads us at 0x7C00

BITS 16
ORG 0x7C00

start:
    cli
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00
    sti

    ; Load kernel (sector 2) to 0x1000
    mov ah, 0x02        ; BIOS read sectors
    mov al, 1           ; number of sectors
    mov ch, 0
    mov cl, 2           ; sector 2
    mov dh, 0
    mov dl, 0
    mov bx, 0x1000
    int 0x13

    jmp 0x0000:0x1000   ; jump to kernel

times 510-($-$$) db 0
dw 0xAA55

