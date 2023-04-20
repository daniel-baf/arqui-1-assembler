echo "COMPILANDO .ASM"
nasm -f elf marco.asm
echo "CREANDO OBJETO"
ld -m elf_i386 marco.o -o marco.exe
echo "EJECUTANDO"
./marco.exe