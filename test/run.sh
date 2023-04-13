echo "COMPILANDO .ASM"
nasm -f elf testing.asm
echo "CREANDO OBJETO"
ld -m elf_i386 testing.o -o testing.exe
echo "EJECUTANDO"
./testing.exe 
