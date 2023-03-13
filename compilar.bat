@echo off
c:\GnuWin32\bin\bison -d bison.y
echo "Compilado en Bison"
c:\GnuWin32\bin\flex flex.l
echo "Compilado en Flex"
c:\MinGW\bin\gcc lex.yy.c bison.tab.c -o analizador
echo "Compilado en GCC"
echo "analizador.exe < caso.txt"
echo "__________________________________"
@echo.
analizador.exe < caso.txt
@echo.
echo "__________________________________"
echo "Analizador terminado"

del analizador.exe
del lex.yy.c
del bison.tab.c
del bison.tab.h
@echo.
echo "archivos.c eliminados :D"

pause
