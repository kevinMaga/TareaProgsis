#include <stdio.h>
#include <time.h>
#include <string.h>
#include <stdlib.h>
#include "Funciones.h"
#define CantidadUsuarios 10
#define CantidadProducto 50
#define rol_admin "admin"
#define rol_vendedor "vendedor"
#define rol_bodeguero "bodeguero"

int main(void) {
  //Quemar el primer dato el cual es el administrador
  struct Usuario admin;
  strcpy(admin.nombre,"kevin");
  strcpy(admin.usuario,"kevin");
  strcpy(admin.contra,"123");
  strcpy(admin.rol,"admin");

  FILE *archivo = fopen("usuarios.txt", "a");
  if (archivo == NULL) {
      printf("Archivo vacio.\n");
      exit(EXIT_FAILURE);
  }

  // Escribir el admin en el archivo
  fprintf(archivo, "%s %s %s %s\n",admin.nombre, admin.usuario, admin.contra, admin.rol);

  fclose(archivo);
  // Agregar el usuario "Admin" al arreglo de usuarios
  usuarios[0] = admin;

  int entrada=1;
  do{
    //validacion de usuario
    printf("*Inicio de sesión*\n");
    char userIngreso[40],paswrdIngreso[40],rol[10];
    printf("Ingrese su Usuario: ");
    scanf("%s",userIngreso);
    printf("Ingrese su Contraseña: ");
    scanf("%s",paswrdIngreso);
    strcpy(rol,validarUser(userIngreso,paswrdIngreso));
    //Variables usadas en los metodos de cada rol
    int opcion;
    int codigoProducto;
    char usuario[20];
    //Mostrar menu de acuerdo al rol del usuario entrante
    //Menu del administrado
    if(strcmp(rol,"admin") == 0){
        printf("*Bienvenido (ROL ADMINISTRADOR)*\n");
        printf("*Menu*\n");
        printf("1. Crear un usuario\n");
        printf("2. Actualizar un usuario\n");
        printf("3. Salir\n");
        printf("Elija una opcion: ");
        scanf("%d",&opcion);
        if(opcion==1){
          registrarUsuario();
        }
        else if(opcion==2){
          mostrarUsarios();
          printf("\nIngrese el nombre de usuario a modificar:  ");
          scanf(" %s",usuario);
          updateUsuario(usuario);
        }
    }
      //Menu del bodeguero
    if(strcmp(rol,"bodeguero") == 0){
      printf("*Bienvenido (ROL BODEGUERO)*\n");
      printf("*Menu*\n");
      printf("1. Crear un producto\n");
      printf("2. Actualizar un producto\n");
      printf("3. Salir\n");
      printf("Escoja una opcion: ");
      scanf("%d",&opcion);
      if(opcion==1){
        registrarProducto();
      }
      else if(opcion==2){
        //metodo que muestra todos los productos
        mostrarBodega();
        printf("\nIngrese el codigo del producto a actualizar: ");
        scanf(" %d",&codigoProducto);
        updateProducto(codigoProducto);
      }
    }

    //Menu del vendedor
    if(strcmp(rol,"vendedor") == 0){
      printf("*Bienvenido (ROL VENDEDOR)*\n");
      printf("*Menu*\n");
      printf("Lista de productos existentes:");
      mostrarBodega();
      printf("\nIngrese el codigo del producto a vender de la lista: ");
      scanf(" %d",&codigoProducto);
      venderProducto(codigoProducto);
    }

    int opcReiniciar;
    printf("¿Realizara otra operación en el sistema?\n");
    printf("1. Si\n");
    printf("2. No\n");
    printf("Escoja una opcion(1 o 2): ");
    scanf("%d",&opcReiniciar);

    if(opcReiniciar==2){
      entrada=0;
      printf("CLOUSE");
    }

  }while(entrada!=0);
  return 0;
}
