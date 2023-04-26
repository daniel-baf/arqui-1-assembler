echo "COMPILANDO .ASM"
nasm -f elf loop.asm
echo "CREANDO OBJETO"
ld -m elf_i386 loop.o -o loop.exe
echo "EJECUTANDO"
./loop.exe
