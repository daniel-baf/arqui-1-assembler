echo "COMPILANDO .ASM"
nasm -f elf readf.asm
echo "CREANDO OBJETO"
ld -m elf_i386 readf.o -o readf.exe
echo "EJECUTANDO"
./readf.exe
