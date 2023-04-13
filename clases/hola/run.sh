echo "COMPILANDO .ASM"
nasm -f elf hola.asm
echo "CREANDO OBJETO"
ld -m elf_i386 hola.o -o hola.exe
echo "EJECUTANDO"
./hola.exe
