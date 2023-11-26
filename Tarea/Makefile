OBJS = main.o funciones.o
DECLARAR = main.c funciones.h Funciones.h
DECLARO = funciones.c funciones.h Funciones.h
BINARY = programa

CFLAGS = -g -Wall

all: programa

programa: $(OBJS)
	gcc -o $(BINARY) $(OBJS)

main.o: $(DECLARAR)
	gcc $(CFLAGS) -c main.c

funciones.o: $(DECLARO)
	gcc $(CFLAGS) -c funciones.c

main.s: $(DECLARAR)
	gcc -S -o $(CFLAGS) main.s main.c

main.s: $(DECLARO)
        gcc -S -o $(CFLAGS) funciones.s funciones.c

disassemble: main.o
    objdump -d -S main.o > main.s

disassemble: funciones.o
    objdump -d -S funciones.o > funciones.s

