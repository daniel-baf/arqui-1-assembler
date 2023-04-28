echo "COMPILANDO .ASM"
nasm -f elf exp.asm
echo "CREANDO OBJETO"
ld -m elf_i386 exp.o -o exp.exe
echo "EJECUTANDO"
./exp.exe 2 3