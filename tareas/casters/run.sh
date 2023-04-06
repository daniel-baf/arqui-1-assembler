echo "COMPILANDO .ASM"
nasm -f elf casters.asm
echo "CREANDO OBJETO"
ld -m elf_i386 casters.o -o casters.exe
echo "EJECUTANDO"
./casters.exe
