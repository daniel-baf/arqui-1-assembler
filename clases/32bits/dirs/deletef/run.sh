echo "CREATE TMP FILE"
touch readme.txt
echo "COMPILANDO .ASM"
nasm -f elf deletef.asm
echo "CREANDO OBJETO"
ld -m elf_i386 deletef.o -o deletef.exe
echo "EJECUTANDO"
./deletef.exe
