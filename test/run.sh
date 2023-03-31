echo "COMPILANDO .ASM"
nasm -f elf test.asm
echo "CREANDO OBJETO"
ld -m elf_i386 test.o -o test
echo "EJECUTANDO"
./test 
