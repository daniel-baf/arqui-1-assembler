echo "COMPILANDO .ASM"
nasm -f elf comexterno.asm
echo "CREANDO OBJETO"
ld -m elf_i386 comexterno.o -o comexterno
echo "EJECUTANDO"
./comexterno 
