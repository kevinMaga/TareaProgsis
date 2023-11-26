#include <stdio.h>
#include "Funciones.h"
#include <time.h>
#include <string.h>
#include <stdlib.h>
#define CantidadUsuarios 10
#define CantidadProducto 50
#define rol_admin "admin"
#define rol_vendedor "vendedor"
#define rol_bodeguero "bodeguero"

struct Producto productosBodega[CantidadProducto];
struct Usuario usuarios[CantidadUsuarios];
int indiceBodega = 0;
int indiceUsuarios = 1;

struct Producto prodVacio;
struct Usuario userVacio;

//Funciones para la creacion de cada uno de los puntos a realizar 
//dependiendo del cargo del usuario
void mostrarBodega(){
  FILE *archivo = fopen("productos.txt", "r");
  if (archivo == NULL) {
      printf("Error al abrir el archivo.\n");
      exit(EXIT_FAILURE);
  }

  printf("\nProductos registrados:\n");
  struct Producto p;

  while (fscanf(archivo, "%d %d %s %s %s %f", &p.codigo, &p.bodega, p.nombre, p.marca, p.categoria, &p.precio) == 6) {
      printf("Nombre: %s, Codigo: %d, Precio: %f\n", p.nombre, p.codigo, p.precio);
  }

  fclose(archivo);
};
void sumarBodega(struct Producto p){
  for(int i=0;i<CantidadProducto;i++){
    if(productosBodega[i].codigo == prodVacio.codigo){
      productosBodega[i] = p;
      indiceBodega++;
      break;
    }
  }
  printf("Actualmente hay %d productos en la bodega\n",indiceBodega);
};
void restarBodega(struct Producto p){
  for(int i=0;i<CantidadProducto;i++){
    if(productosBodega[i].codigo == p.codigo){
      productosBodega[i] = prodVacio;
      indiceBodega--;
      break;
    }
  }
  printf("Actualmente hay %d productos en la bodega\n",indiceBodega);
}
void addUsuario(struct Usuario u){
  for(int i=0;i<CantidadUsuarios;i++){
    if(strcmp(usuarios[i].usuario,userVacio.usuario)==0){
      usuarios[i] = u;
      indiceUsuarios++;
      break;
    }
  }
  printf("Actualmente hay %d usuarios en el sistema\n",indiceUsuarios);
};

//Eliminar ususario
void deleteUsuario(struct Usuario u){
  for(int i=0;i<CantidadUsuarios;i++){
    if(strcmp(usuarios[i].usuario,u.usuario)==0){
      usuarios[i] = userVacio;
      indiceUsuarios--;
      break;
    }
  }
  printf("Actualmente hay %d usuarios en el sistema\n",indiceUsuarios);
};

//Valida usuario
char* validarUser(char usuario[20], char pswrd[20]){
  FILE *archivo = fopen("usuarios.txt", "r");
  if (archivo == NULL) {
      printf("Error al abrir el archivo de usuarios.\n");
      exit(EXIT_FAILURE);
  }

  struct Usuario u;

  while (fscanf(archivo, "%s %s %s %s", u.nombre, u.usuario, u.contra, u.rol) == 4) {
      if (strcmp(u.usuario, usuario) == 0 && strcmp(u.contra, pswrd) == 0) {
          fclose(archivo);
          if (strcmp(u.rol, "admin") == 0) {
                return rol_admin;
            } else if (strcmp(u.rol, "vendedor") == 0) {
                return rol_vendedor;
            } else {
                return rol_bodeguero;
            }
      }
  }

  fclose(archivo);

  printf("Error al iniciar sesion\n");
  exit(EXIT_FAILURE);
};

void venderProducto(int codeProducto)
{
  int i;
  for(i=0;i<CantidadProducto;i++){
    if(productosBodega[i].codigo==codeProducto){
      struct Venta v;
      printf("ingrese nombre del vendedor: ");
      scanf("%s",v.vendedor);
      printf("ingrese nombre del local: ");
      scanf(" %s",v.local);
      printf("ingrese precio del producto: ");
      fflush(stdin);
      scanf(" %f",&v.precio);
      v.fechaVenta = time(NULL);
      printf("VENTA EXITOSA\n");
      restarBodega(productosBodega[i]);

      // Abrir archivo
      FILE *archivo = fopen("ventas.txt", "a");
      if (archivo == NULL) {
          printf("Archivo vacio.\n");
          exit(EXIT_FAILURE);
      }
      // Escribir producto en el archivo
      fprintf(archivo, "%s %s %s %f\n",v.vendedor, v.local, ctime(&v.fechaVenta), v.precio);

      fclose(archivo);

      printf("Venta registrada exitosamente.\n");
    }
  }
}
// actualzacion de producto
void updateProducto(int codigo){
  FILE *archivo = fopen("productos.txt", "r");

  int i = 0;
  while (fscanf(archivo, "%d %d %s %s %s %f", &productosBodega[i].codigo, &productosBodega[i].bodega, productosBodega[i].nombre, productosBodega[i].marca, productosBodega[i].categoria, &productosBodega[i].precio) == 6) {
      i++;
  }
  fclose(archivo);
  int j;
  for(j=0;j<i;j++){
    if (productosBodega[j].codigo == codigo ){
      printf("ingrese nombre producto: \n");
      scanf("%s",productosBodega[j].nombre);
      printf("ingrese la categoria: \n");
      scanf(" %s",productosBodega[j].categoria);
      printf("ingrese la marca: \n");
      scanf(" %s",productosBodega[j].marca);
      printf("ingrese el precio: \n");
      scanf("%f",&productosBodega[j].precio);
      printf("ingrese la bodega 1 o 2: \n");
      scanf(" %d",&productosBodega[j].bodega);

      archivo = fopen("productos.txt", "w");
      if (archivo == NULL) {
          printf("error abrir archivo.\n");
          exit(EXIT_FAILURE);
      }

      for (int k = 0; k < i; k++) {
          fprintf(archivo, "%d %d %s %s %s %f\n", productosBodega[k].codigo, productosBodega[k].bodega, productosBodega[k].nombre, productosBodega[k].marca, productosBodega[k].categoria, productosBodega[k].precio);
      }

      fclose(archivo);

      printf("Producto actualizado exitosamente.\n");
      return;
    }
  }
}

// registro de productos
void registrarProducto()
{
  if(indiceBodega<CantidadProducto){
    struct Producto p;
    printf("ingrese bodega del producto: ");
    scanf(" %d",&p.bodega);
    printf("ingrese nombre del producto: ");
    scanf("%s",p.nombre);
    printf("ingrese categoria del producto: ");
    scanf(" %s",p.categoria);
    printf("ingrese marca del producto: ");
    scanf(" %s",p.marca);
    printf("ingrese codigo del producto: ");
    scanf(" %d",&p.codigo);
    printf("ingrese precio del producto: ");
    scanf(" %f",&p.precio);
    sumarBodega(p);
    // Abrir archivo
    FILE *archivo = fopen("productos.txt", "a");
    if (archivo == NULL) {
        printf("Archivo vacio.\n");
        exit(EXIT_FAILURE);
    }

    // Escribir producto en el archivo
    fprintf(archivo, "%d %s %s %s %d %f\n", p.bodega, p.nombre, p.categoria,p.marca, p.codigo, p.precio);

    fclose(archivo);

    printf("Producto registrado exitosamente.\n");
  }
  else{
    printf("La bodega esta llena.");
  }

};
// registro de usuarios nuevos
void registrarUsuario()
{
  struct Usuario u;
  printf("ingrese nombre: ");
  scanf("%s",u.nombre);
  printf("ingrese usuario: ");
  scanf(" %s",u.usuario);
  printf("ingrese contraseña: ");
  scanf(" %s",u.contra);
  printf("ingrese su rol(vendedor, admin o bodeguero): ");
  scanf(" %s",u.rol);
  addUsuario(u);
  
  // Abrir archivo
  FILE *archivo = fopen("usuarios.txt", "a");
  if (archivo == NULL) {
      printf("Archivo vacio.\n");
      exit(EXIT_FAILURE);
  }
  // nuevo usuario en archivo
  fprintf(archivo, "%s %s %s %s\n",u.nombre, u.usuario, u.contra, u.rol);

  fclose(archivo);

  printf("Usuario registrado exitosamente.\n");
};
// actualizacion de usuario
void updateUsuario(char user[20])
{
  FILE *archivo = fopen("usuarios.txt", "r");
  int i = 0;
  while (fscanf(archivo, "%s %s %s %s", usuarios[i].nombre, usuarios[i].usuario, usuarios[i].contra, usuarios[i].rol) == 4) {
      i++;
  }
  fclose(archivo);
  for(int j=0;j<i;j++){
    if(strcmp(usuarios[j].usuario,user)==0){
      int opcion;
      printf("Que desea actualizar: ");
      printf("1. Nombre \n 2. Usuario \n 3. Contraseña \n");
      scanf("%d",&opcion);

      if(opcion == 1){
        printf("ingrese nombre nuevo: ");
        scanf("%s",usuarios[j].nombre);
      }
      else if(opcion == 2){
        printf("ingrese usuario nuevo: ");
        scanf("%s",usuarios[j].usuario);
      }
      else if(opcion == 3){
        printf("ingrese contraseña nueva: ");
        scanf("%s",usuarios[j].contra);
      }
      else{
        printf("Opcion incorrecta ");
      }

      archivo = fopen("usuarios.txt", "w");
      if (archivo == NULL) {
          printf("Error al abrir el archivo de usuarios.\n");
          exit(EXIT_FAILURE);
      }

      for (int k = 0; k < i; k++) {
          fprintf(archivo, "%s %s %s %s\n", usuarios[k].nombre, usuarios[k].usuario, usuarios[k].contra, usuarios[k].rol);
      }

      fclose(archivo);
      printf("Usuario actualizado exitosamente.\n");
      return;
    }
  }
};
void mostrarUsarios(){
  FILE *archivo = fopen("usuarios.txt", "r");
  if (archivo == NULL) {
      printf("Error al abrir el archivo de usuarios.\n");
      exit(EXIT_FAILURE);
  }
  printf("\nUsuarios registrados:\n");
  struct Usuario usuario;
  while (fscanf(archivo, "%s %s %s %s", usuario.nombre, usuario.usuario, usuario.contra, usuario.rol) == 4) {
      printf("Nombre: %s, Usuario: %s, Rol: %s\n", usuario.nombre, usuario.usuario, usuario.rol);
  }
  fclose(archivo);
}
