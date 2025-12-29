// kernel/kernel.c
// Shomski OS - simple C kernel

void print(const char* str) {
    volatile char* video = (volatile char*) 0xB8000;
    int i = 0;

    while (str[i] != 0) {
        video[i * 2] = str[i];      // character
        video[i * 2 + 1] = 0x07;    // light grey on black
        i++;
    }
}

void kernel_main() {
    print("Hello from Shomski OS kernel!");
    while (1) { }
}
