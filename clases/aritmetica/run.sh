echo "COMPILANDO .ASM"
nasm -f elf arith.asm
echo "CREANDO OBJETO"
ld -m elf_i386 arith.o -o arith
echo "EJECUTANDO"
./arith 
