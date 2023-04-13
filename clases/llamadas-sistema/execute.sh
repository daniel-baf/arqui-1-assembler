echo "COMPILANDO .ASM"
nasm -f elf execute.asm
echo "CREANDO OBJETO"
ld -m elf_i386 execute.o -o execute.exe
echo "EJECUTANDO"
./execute.exe
