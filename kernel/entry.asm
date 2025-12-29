BITS 16
ORG 0x1000

start:
    cli
    xor ax, ax
    mov ds, ax
    mov es, ax

    mov si, message

.print:
    lodsb
    or al, al
    jz hang
    mov ah, 0x0E
    int 0x10
    jmp .print

hang:
    hlt
    jmp hang

message db "Kernel loaded successfully!", 0

