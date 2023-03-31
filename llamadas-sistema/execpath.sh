echo "COMPILANDO .ASM"
nasm -f elf execpath.asm
echo "CREANDO OBJETO"
ld -m elf_i386 execpath.o -o execpath
echo "EJECUTANDO"
./execpath 
