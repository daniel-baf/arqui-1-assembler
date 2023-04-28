echo "COMPILANDO .ASM"
nasm -f elf64 hola64.asm
echo "CREANDO OBJETO"
ld hola64.o -o hola64.exe
echo "EJECUTANDO"
./hola64.exe