echo "COMPILANDO .ASM"
nasm -f elf app.asm
echo "CREANDO OBJETO"
ld -m elf_i386 app.o -o app.exe
echo "EJECUTANDO"
./app.exe
