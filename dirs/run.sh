echo "COMPILANDO .ASM"
nasm -f elf makef.asm
echo "CREANDO OBJETO"
ld -m elf_i386 makef.o -o makef
echo "EJECUTANDO"
./makef 
