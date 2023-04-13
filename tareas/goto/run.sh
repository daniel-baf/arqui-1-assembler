echo "COMPILANDO .ASM"
nasm -f elf goto.asm
echo "CREANDO OBJETO"
ld -m elf_i386 goto.o -o goto.exe
echo "EJECUTANDO"
./goto.exe
