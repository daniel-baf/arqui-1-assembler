echo "COMPILANDO .ASM"
nasm -f elf busqueda.asm
echo "CREANDO OBJETO"
ld -m elf_i386 busqueda.o -o busqueda.exe
echo "EJECUTANDO"
./busqueda.exe
echo "---------- FILE ----------"
cat  readme.txt