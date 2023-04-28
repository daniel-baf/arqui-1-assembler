echo "COMPILANDO .ASM"
nasm -f elf exaConcat.asm
echo "CREANDO OBJETO"
ld -m elf_i386 exaConcat.o -o exaConcat.exe
echo "EJECUTANDO"
./exaConcat.exe
