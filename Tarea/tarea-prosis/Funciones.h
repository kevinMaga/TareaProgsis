#ifndef FUNCIONES_H
#define FUNCIONES_H
#include <time.h>
#define CantidadUsuarios 10
#define CantidadProducto 50
#define rol_admin "admin"
#define rol_vendedor "vendedor"
#define rol_bodeguero "bodeguero"



struct Producto{
  char nombre[20];
  char categoria[20];
  char marca[20];
  int codigo;
  float precio;
  int bodega;
};

struct Usuario{
  char nombre[20];
  char usuario[20];
  char contra[20];
  char rol[10];
};

extern struct Producto productosBodega[CantidadProducto];
extern struct Usuario usuarios[CantidadUsuarios];

struct Venta{
  char local[10];
  char vendedor[10];
  time_t fechaVenta;
  float precio;
};


void mostrarBodega();
void mostrarUsarios();
void venderProducto(int codeProducto);
void registrarProducto();
void updateProducto(int codigo);
void registrarUsuario();
void updateUsuario(char user[20]);
char* validarUser(char usuario[20], char pswrd[20]);



#endif
