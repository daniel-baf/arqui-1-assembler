echo "COMPILANDO .ASM"
nasm -f elf64 float.asm -l float.lst
echo "CREANDO OBJETO"
gcc -m64 float.o -o float.exe -no-pie
./float.exe