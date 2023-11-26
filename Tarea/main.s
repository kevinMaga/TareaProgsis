	.file	"main.c"
	.text
	.section	.rodata
.LC0:
	.string	"a"
.LC1:
	.string	"usuarios.txt"
.LC2:
	.string	"Archivo vacio."
.LC3:
	.string	"%s %s %s %s\n"
.LC4:
	.string	"*Inicio de sesi\303\263n*"
.LC5:
	.string	"Ingrese su Usuario: "
.LC6:
	.string	"%s"
.LC7:
	.string	"Ingrese su Contrase\303\261a: "
.LC8:
	.string	"admin"
	.align 8
.LC9:
	.string	"*Bienvenido (ROL ADMINISTRADOR)*"
.LC10:
	.string	"*Menu*"
.LC11:
	.string	"1. Crear un usuario"
.LC12:
	.string	"2. Actualizar un usuario"
.LC13:
	.string	"3. Salir"
.LC14:
	.string	"Elija una opcion: "
.LC15:
	.string	"%d"
	.align 8
.LC16:
	.string	"\nIngrese el nombre de usuario a modificar:  "
.LC17:
	.string	" %s"
.LC18:
	.string	"bodeguero"
.LC19:
	.string	"*Bienvenido (ROL BODEGUERO)*"
.LC20:
	.string	"1. Crear un producto"
.LC21:
	.string	"2. Actualizar un producto"
.LC22:
	.string	"Escoja una opcion: "
	.align 8
.LC23:
	.string	"\nIngrese el codigo del producto a actualizar: "
.LC24:
	.string	" %d"
.LC25:
	.string	"vendedor"
.LC26:
	.string	"*Bienvenido (ROL VENDEDOR)*"
	.align 8
.LC27:
	.string	"Lista de productos existentes:"
	.align 8
.LC28:
	.string	"\nIngrese el codigo del producto a vender de la lista: "
	.align 8
.LC29:
	.string	"\302\277Realizara otra operaci\303\263n en el sistema?"
.LC30:
	.string	"1. Si"
.LC31:
	.string	"2. No"
.LC32:
	.string	"Escoja una opcion(1 o 2): "
.LC33:
	.string	"CLOUSE"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$240, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-208(%rbp), %rax
	movl	$1769366891, (%rax)
	movw	$110, 4(%rax)
	leaq	-208(%rbp), %rax
	addq	$20, %rax
	movl	$1769366891, (%rax)
	movw	$110, 4(%rax)
	leaq	-208(%rbp), %rax
	addq	$40, %rax
	movl	$3355185, (%rax)
	leaq	-208(%rbp), %rax
	addq	$60, %rax
	movl	$1768776801, (%rax)
	movw	$110, 4(%rax)
	leaq	.LC0(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -216(%rbp)
	cmpq	$0, -216(%rbp)
	jne	.L2
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
.L2:
	leaq	-208(%rbp), %rax
	leaq	60(%rax), %rdi
	leaq	-208(%rbp), %rax
	leaq	40(%rax), %rsi
	leaq	-208(%rbp), %rax
	leaq	20(%rax), %rcx
	leaq	-208(%rbp), %rdx
	movq	-216(%rbp), %rax
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-216(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movq	-208(%rbp), %rax
	movq	-200(%rbp), %rdx
	movq	%rax, usuarios(%rip)
	movq	%rdx, 8+usuarios(%rip)
	movq	-192(%rbp), %rax
	movq	-184(%rbp), %rdx
	movq	%rax, 16+usuarios(%rip)
	movq	%rdx, 24+usuarios(%rip)
	movq	-176(%rbp), %rax
	movq	-168(%rbp), %rdx
	movq	%rax, 32+usuarios(%rip)
	movq	%rdx, 40+usuarios(%rip)
	movq	-160(%rbp), %rax
	movq	-152(%rbp), %rdx
	movq	%rax, 48+usuarios(%rip)
	movq	%rdx, 56+usuarios(%rip)
	movl	-144(%rbp), %eax
	movl	%eax, 64+usuarios(%rip)
	movzwl	-140(%rbp), %eax
	movw	%ax, 68+usuarios(%rip)
	movl	$1, -220(%rbp)
.L9:
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-96(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	-48(%rbp), %rdx
	leaq	-96(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	validarUser@PLT
	movq	%rax, %rdx
	leaq	-138(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	leaq	-138(%rbp), %rax
	leaq	.LC8(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L3
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-232(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-232(%rbp), %eax
	cmpl	$1, %eax
	jne	.L4
	movl	$0, %eax
	call	registrarUsuario@PLT
	jmp	.L3
.L4:
	movl	-232(%rbp), %eax
	cmpl	$2, %eax
	jne	.L3
	movl	$0, %eax
	call	mostrarUsarios@PLT
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-128(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	updateUsuario@PLT
.L3:
	leaq	-138(%rbp), %rax
	leaq	.LC18(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L5
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-232(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-232(%rbp), %eax
	cmpl	$1, %eax
	jne	.L6
	movl	$0, %eax
	call	registrarProducto@PLT
	jmp	.L5
.L6:
	movl	-232(%rbp), %eax
	cmpl	$2, %eax
	jne	.L5
	movl	$0, %eax
	call	mostrarBodega@PLT
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-228(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-228(%rbp), %eax
	movl	%eax, %edi
	call	updateProducto@PLT
.L5:
	leaq	-138(%rbp), %rax
	leaq	.LC25(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L7
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	call	mostrarBodega@PLT
	leaq	.LC28(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-228(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-228(%rbp), %eax
	movl	%eax, %edi
	call	venderProducto@PLT
.L7:
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC30(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC31(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC32(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-224(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-224(%rbp), %eax
	cmpl	$2, %eax
	jne	.L8
	movl	$0, -220(%rbp)
	leaq	.LC33(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L8:
	cmpl	$0, -220(%rbp)
	jne	.L9
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L11
	call	__stack_chk_fail@PLT
.L11:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
