echo "COMPILANDO .ASM"
nasm -f elf64 triang-area.asm -l triang-area.lst
echo "CREANDO OBJETO"
gcc -m64 triang-area.o -o triang-area.exe -no-pie
./triang-area.exe