	.file	"funciones.c"
	.text
	.globl	productosBodega
	.bss
	.align 32
	.type	productosBodega, @object
	.size	productosBodega, 3600
productosBodega:
	.zero	3600
	.globl	usuarios
	.align 32
	.type	usuarios, @object
	.size	usuarios, 700
usuarios:
	.zero	700
	.globl	indiceBodega
	.align 4
	.type	indiceBodega, @object
	.size	indiceBodega, 4
indiceBodega:
	.zero	4
	.globl	indiceUsuarios
	.data
	.align 4
	.type	indiceUsuarios, @object
	.size	indiceUsuarios, 4
indiceUsuarios:
	.long	1
	.globl	prodVacio
	.bss
	.align 32
	.type	prodVacio, @object
	.size	prodVacio, 72
prodVacio:
	.zero	72
	.globl	userVacio
	.align 32
	.type	userVacio, @object
	.size	userVacio, 70
userVacio:
	.zero	70
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"productos.txt"
.LC2:
	.string	"Error al abrir el archivo."
.LC3:
	.string	"\nProductos registrados:"
	.align 8
.LC4:
	.string	"Nombre: %s, Codigo: %d, Precio: %f\n"
.LC5:
	.string	"%d %d %s %s %s %f"
	.text
	.globl	mostrarBodega
	.type	mostrarBodega, @function
mostrarBodega:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jne	.L2
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
.L2:
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L3
.L4:
	movss	-16(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movq	%xmm1, %rcx
	movl	-20(%rbp), %edx
	leaq	-80(%rbp), %rax
	movq	%rcx, %xmm0
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
.L3:
	leaq	-80(%rbp), %rax
	leaq	40(%rax), %r8
	leaq	-80(%rbp), %rdi
	leaq	-80(%rbp), %rax
	leaq	68(%rax), %rcx
	leaq	-80(%rbp), %rax
	leaq	60(%rax), %rdx
	movq	-88(%rbp), %rax
	leaq	-80(%rbp), %rsi
	addq	$64, %rsi
	pushq	%rsi
	leaq	-80(%rbp), %rsi
	addq	$20, %rsi
	pushq	%rsi
	movq	%r8, %r9
	movq	%rdi, %r8
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	addq	$16, %rsp
	cmpl	$6, %eax
	je	.L4
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L5
	call	__stack_chk_fail@PLT
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	mostrarBodega, .-mostrarBodega
	.section	.rodata
	.align 8
.LC6:
	.string	"Actualmente hay %d productos en la bodega\n"
	.text
	.globl	sumarBodega
	.type	sumarBodega, @function
sumarBodega:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movl	$0, -20(%rbp)
	jmp	.L7
.L10:
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	60+productosBodega(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	60+prodVacio(%rip), %eax
	cmpl	%eax, %edx
	jne	.L8
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	productosBodega(%rip), %rax
	movq	16(%rbp), %rcx
	movq	24(%rbp), %rbx
	movq	%rcx, (%rdx,%rax)
	movq	%rbx, 8(%rdx,%rax)
	movq	32(%rbp), %rcx
	movq	40(%rbp), %rbx
	movq	%rcx, 16(%rdx,%rax)
	movq	%rbx, 24(%rdx,%rax)
	movq	48(%rbp), %rcx
	movq	56(%rbp), %rbx
	movq	%rcx, 32(%rdx,%rax)
	movq	%rbx, 40(%rdx,%rax)
	movq	64(%rbp), %rcx
	movq	72(%rbp), %rbx
	movq	%rcx, 48(%rdx,%rax)
	movq	%rbx, 56(%rdx,%rax)
	movq	80(%rbp), %rcx
	movq	%rcx, 64(%rdx,%rax)
	movl	indiceBodega(%rip), %eax
	addl	$1, %eax
	movl	%eax, indiceBodega(%rip)
	jmp	.L9
.L8:
	addl	$1, -20(%rbp)
.L7:
	cmpl	$49, -20(%rbp)
	jle	.L10
.L9:
	movl	indiceBodega(%rip), %eax
	movl	%eax, %esi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	sumarBodega, .-sumarBodega
	.globl	restarBodega
	.type	restarBodega, @function
restarBodega:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movl	$0, -20(%rbp)
	jmp	.L12
.L15:
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	60+productosBodega(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	76(%rbp), %eax
	cmpl	%eax, %edx
	jne	.L13
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	productosBodega(%rip), %rax
	movq	prodVacio(%rip), %rcx
	movq	8+prodVacio(%rip), %rbx
	movq	%rcx, (%rdx,%rax)
	movq	%rbx, 8(%rdx,%rax)
	movq	16+prodVacio(%rip), %rcx
	movq	24+prodVacio(%rip), %rbx
	movq	%rcx, 16(%rdx,%rax)
	movq	%rbx, 24(%rdx,%rax)
	movq	32+prodVacio(%rip), %rcx
	movq	40+prodVacio(%rip), %rbx
	movq	%rcx, 32(%rdx,%rax)
	movq	%rbx, 40(%rdx,%rax)
	movq	48+prodVacio(%rip), %rcx
	movq	56+prodVacio(%rip), %rbx
	movq	%rcx, 48(%rdx,%rax)
	movq	%rbx, 56(%rdx,%rax)
	movq	64+prodVacio(%rip), %rcx
	movq	%rcx, 64(%rdx,%rax)
	movl	indiceBodega(%rip), %eax
	subl	$1, %eax
	movl	%eax, indiceBodega(%rip)
	jmp	.L14
.L13:
	addl	$1, -20(%rbp)
.L12:
	cmpl	$49, -20(%rbp)
	jle	.L15
.L14:
	movl	indiceBodega(%rip), %eax
	movl	%eax, %esi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	restarBodega, .-restarBodega
	.section	.rodata
	.align 8
.LC7:
	.string	"Actualmente hay %d usuarios en el sistema\n"
	.text
	.globl	addUsuario
	.type	addUsuario, @function
addUsuario:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movl	$0, -20(%rbp)
	jmp	.L17
.L20:
	movl	-20(%rbp), %eax
	cltq
	imulq	$70, %rax, %rax
	leaq	16(%rax), %rdx
	leaq	usuarios(%rip), %rax
	addq	%rdx, %rax
	addq	$4, %rax
	leaq	20+userVacio(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L18
	movl	-20(%rbp), %eax
	cltq
	imulq	$70, %rax, %rax
	leaq	usuarios(%rip), %rdx
	movq	16(%rbp), %rcx
	movq	24(%rbp), %rbx
	movq	%rcx, (%rax,%rdx)
	movq	%rbx, 8(%rax,%rdx)
	movq	32(%rbp), %rcx
	movq	40(%rbp), %rbx
	movq	%rcx, 16(%rax,%rdx)
	movq	%rbx, 24(%rax,%rdx)
	movq	48(%rbp), %rcx
	movq	56(%rbp), %rbx
	movq	%rcx, 32(%rax,%rdx)
	movq	%rbx, 40(%rax,%rdx)
	movq	64(%rbp), %rcx
	movq	72(%rbp), %rbx
	movq	%rcx, 48(%rax,%rdx)
	movq	%rbx, 56(%rax,%rdx)
	movl	80(%rbp), %ecx
	movl	%ecx, 64(%rax,%rdx)
	movzwl	84(%rbp), %ecx
	movw	%cx, 68(%rax,%rdx)
	movl	indiceUsuarios(%rip), %eax
	addl	$1, %eax
	movl	%eax, indiceUsuarios(%rip)
	jmp	.L19
.L18:
	addl	$1, -20(%rbp)
.L17:
	cmpl	$9, -20(%rbp)
	jle	.L20
.L19:
	movl	indiceUsuarios(%rip), %eax
	movl	%eax, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	addUsuario, .-addUsuario
	.globl	deleteUsuario
	.type	deleteUsuario, @function
deleteUsuario:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movl	$0, -20(%rbp)
	jmp	.L22
.L25:
	movl	-20(%rbp), %eax
	cltq
	imulq	$70, %rax, %rax
	leaq	16(%rax), %rdx
	leaq	usuarios(%rip), %rax
	addq	%rdx, %rax
	leaq	4(%rax), %rdx
	leaq	36(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L23
	movl	-20(%rbp), %eax
	cltq
	imulq	$70, %rax, %rax
	leaq	usuarios(%rip), %rdx
	movq	userVacio(%rip), %rcx
	movq	8+userVacio(%rip), %rbx
	movq	%rcx, (%rax,%rdx)
	movq	%rbx, 8(%rax,%rdx)
	movq	16+userVacio(%rip), %rcx
	movq	24+userVacio(%rip), %rbx
	movq	%rcx, 16(%rax,%rdx)
	movq	%rbx, 24(%rax,%rdx)
	movq	32+userVacio(%rip), %rcx
	movq	40+userVacio(%rip), %rbx
	movq	%rcx, 32(%rax,%rdx)
	movq	%rbx, 40(%rax,%rdx)
	movq	48+userVacio(%rip), %rcx
	movq	56+userVacio(%rip), %rbx
	movq	%rcx, 48(%rax,%rdx)
	movq	%rbx, 56(%rax,%rdx)
	movl	64+userVacio(%rip), %ecx
	movl	%ecx, 64(%rax,%rdx)
	movzwl	68+userVacio(%rip), %ecx
	movw	%cx, 68(%rax,%rdx)
	movl	indiceUsuarios(%rip), %eax
	subl	$1, %eax
	movl	%eax, indiceUsuarios(%rip)
	jmp	.L24
.L23:
	addl	$1, -20(%rbp)
.L22:
	cmpl	$9, -20(%rbp)
	jle	.L25
.L24:
	movl	indiceUsuarios(%rip), %eax
	movl	%eax, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	deleteUsuario, .-deleteUsuario
	.section	.rodata
.LC8:
	.string	"usuarios.txt"
	.align 8
.LC9:
	.string	"Error al abrir el archivo de usuarios."
.LC10:
	.string	"admin"
.LC11:
	.string	"vendedor"
.LC12:
	.string	"bodeguero"
.LC13:
	.string	"%s %s %s %s"
.LC14:
	.string	"Error al iniciar sesion"
	.text
	.globl	validarUser
	.type	validarUser, @function
validarUser:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movq	%rdi, -104(%rbp)
	movq	%rsi, -112(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jne	.L28
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
.L32:
	movq	-104(%rbp), %rax
	leaq	-80(%rbp), %rdx
	addq	$20, %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L28
	movq	-112(%rbp), %rax
	leaq	-80(%rbp), %rdx
	addq	$40, %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L28
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	leaq	-80(%rbp), %rax
	addq	$60, %rax
	leaq	.LC10(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L29
	leaq	.LC10(%rip), %rax
	jmp	.L33
.L29:
	leaq	-80(%rbp), %rax
	addq	$60, %rax
	leaq	.LC11(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L31
	leaq	.LC11(%rip), %rax
	jmp	.L33
.L31:
	leaq	.LC12(%rip), %rax
	jmp	.L33
.L28:
	leaq	-80(%rbp), %rax
	leaq	60(%rax), %rdi
	leaq	-80(%rbp), %rax
	leaq	40(%rax), %rsi
	leaq	-80(%rbp), %rax
	leaq	20(%rax), %rcx
	leaq	-80(%rbp), %rdx
	movq	-88(%rbp), %rax
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC13(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	cmpl	$4, %eax
	je	.L32
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
.L33:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L34
	call	__stack_chk_fail@PLT
.L34:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	validarUser, .-validarUser
	.section	.rodata
.LC15:
	.string	"ingrese nombre del vendedor: "
.LC16:
	.string	"%s"
.LC17:
	.string	"ingrese nombre del local: "
.LC18:
	.string	" %s"
.LC19:
	.string	"ingrese precio del producto: "
.LC20:
	.string	" %f"
.LC21:
	.string	"VENTA EXITOSA"
.LC22:
	.string	"a"
.LC23:
	.string	"ventas.txt"
.LC24:
	.string	"Archivo vacio."
.LC25:
	.string	"%s %s %s %f\n"
	.align 8
.LC26:
	.string	"Venta registrada exitosamente."
	.text
	.globl	venderProducto
	.type	venderProducto, @function
venderProducto:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$88, %rsp
	.cfi_offset 3, -24
	movl	%edi, -84(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	$0, -76(%rbp)
	jmp	.L36
.L39:
	movl	-76(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	60+productosBodega(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	%eax, -84(%rbp)
	jne	.L37
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-64(%rbp), %rax
	addq	$10, %rax
	movq	%rax, %rsi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	stdin(%rip), %rax
	movq	%rax, %rdi
	call	fflush@PLT
	leaq	-64(%rbp), %rax
	addq	$32, %rax
	movq	%rax, %rsi
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, %edi
	call	time@PLT
	movq	%rax, -40(%rbp)
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	subq	$8, %rsp
	movl	-76(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	productosBodega(%rip), %rax
	pushq	64(%rdx,%rax)
	pushq	56(%rdx,%rax)
	pushq	48(%rdx,%rax)
	pushq	40(%rdx,%rax)
	pushq	32(%rdx,%rax)
	pushq	24(%rdx,%rax)
	pushq	16(%rdx,%rax)
	pushq	8(%rdx,%rax)
	pushq	(%rdx,%rax)
	call	restarBodega
	addq	$80, %rsp
	leaq	.LC22(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -72(%rbp)
	cmpq	$0, -72(%rbp)
	jne	.L38
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
.L38:
	movss	-32(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movq	%xmm1, %rbx
	leaq	-64(%rbp), %rax
	addq	$24, %rax
	movq	%rax, %rdi
	call	ctime@PLT
	movq	%rax, %rcx
	leaq	-64(%rbp), %rdx
	leaq	-64(%rbp), %rax
	leaq	10(%rax), %rsi
	movq	-72(%rbp), %rax
	movq	%rbx, %xmm0
	movq	%rcx, %r8
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	leaq	.LC25(%rip), %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	call	fprintf@PLT
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L37:
	addl	$1, -76(%rbp)
.L36:
	cmpl	$49, -76(%rbp)
	jle	.L39
	nop
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	je	.L40
	call	__stack_chk_fail@PLT
.L40:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	venderProducto, .-venderProducto
	.section	.rodata
.LC27:
	.string	"ingrese nombre producto: "
.LC28:
	.string	"ingrese la categoria: "
.LC29:
	.string	"ingrese la marca: "
.LC30:
	.string	"ingrese el precio: "
.LC31:
	.string	"%f"
.LC32:
	.string	"ingrese la bodega 1 o 2: "
.LC33:
	.string	" %d"
.LC34:
	.string	"w"
.LC35:
	.string	"error abrir archivo."
.LC36:
	.string	"%d %d %s %s %s %f\n"
	.align 8
.LC37:
	.string	"Producto actualizado exitosamente."
	.text
	.globl	updateProducto
	.type	updateProducto, @function
updateProducto:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	leaq	.LC0(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -8(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L42
.L43:
	addl	$1, -20(%rbp)
.L42:
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	64(%rax), %rdx
	leaq	productosBodega(%rip), %rax
	leaq	(%rdx,%rax), %rdi
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	16(%rax), %rdx
	leaq	productosBodega(%rip), %rax
	addq	%rdx, %rax
	leaq	4(%rax), %rsi
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	32(%rax), %rdx
	leaq	productosBodega(%rip), %rax
	addq	%rdx, %rax
	leaq	8(%rax), %r9
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	productosBodega(%rip), %rdx
	leaq	(%rax,%rdx), %r8
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	64(%rax), %rdx
	leaq	productosBodega(%rip), %rax
	addq	%rdx, %rax
	leaq	4(%rax), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	48(%rax), %rdx
	leaq	productosBodega(%rip), %rax
	addq	%rdx, %rax
	leaq	12(%rax), %rdx
	movq	-8(%rbp), %rax
	pushq	%rdi
	pushq	%rsi
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	addq	$16, %rsp
	cmpl	$6, %eax
	je	.L43
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movl	$0, -16(%rbp)
	jmp	.L44
.L50:
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	60+productosBodega(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	%eax, -36(%rbp)
	jne	.L45
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	productosBodega(%rip), %rdx
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC28(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	16(%rax), %rdx
	leaq	productosBodega(%rip), %rax
	addq	%rdx, %rax
	addq	$4, %rax
	movq	%rax, %rsi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	32(%rax), %rdx
	leaq	productosBodega(%rip), %rax
	addq	%rdx, %rax
	addq	$8, %rax
	movq	%rax, %rsi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC30(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	64(%rax), %rdx
	leaq	productosBodega(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC31(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC32(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	64(%rax), %rdx
	leaq	productosBodega(%rip), %rax
	addq	%rdx, %rax
	addq	$4, %rax
	movq	%rax, %rsi
	leaq	.LC33(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC34(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L46
	leaq	.LC35(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
.L46:
	movl	$0, -12(%rbp)
	jmp	.L47
.L48:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	64+productosBodega(%rip), %rax
	movss	(%rdx,%rax), %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movq	%xmm1, %rsi
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	16(%rax), %rdx
	leaq	productosBodega(%rip), %rax
	addq	%rdx, %rax
	leaq	4(%rax), %rdi
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	32(%rax), %rdx
	leaq	productosBodega(%rip), %rax
	addq	%rdx, %rax
	leaq	8(%rax), %r9
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	productosBodega(%rip), %rdx
	leaq	(%rax,%rdx), %r8
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	68+productosBodega(%rip), %rax
	movl	(%rdx,%rax), %ecx
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	60+productosBodega(%rip), %rax
	movl	(%rdx,%rax), %edx
	movq	-8(%rbp), %rax
	subq	$8, %rsp
	pushq	%rdi
	movq	%rsi, %xmm0
	leaq	.LC36(%rip), %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	call	fprintf@PLT
	addq	$16, %rsp
	addl	$1, -12(%rbp)
.L47:
	movl	-12(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L48
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	leaq	.LC37(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L41
.L45:
	addl	$1, -16(%rbp)
.L44:
	movl	-16(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L50
.L41:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	updateProducto, .-updateProducto
	.section	.rodata
.LC38:
	.string	"ingrese bodega del producto: "
.LC39:
	.string	"ingrese nombre del producto: "
	.align 8
.LC40:
	.string	"ingrese categoria del producto: "
.LC41:
	.string	"ingrese marca del producto: "
.LC42:
	.string	"ingrese codigo del producto: "
.LC43:
	.string	"%d %s %s %s %d %f\n"
	.align 8
.LC44:
	.string	"Producto registrado exitosamente."
.LC45:
	.string	"La bodega esta llena."
	.text
	.globl	registrarProducto
	.type	registrarProducto, @function
registrarProducto:
.LFB14:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	indiceBodega(%rip), %eax
	cmpl	$49, %eax
	jg	.L52
	leaq	.LC38(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-80(%rbp), %rax
	addq	$68, %rax
	movq	%rax, %rsi
	leaq	.LC33(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC39(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC40(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-80(%rbp), %rax
	addq	$20, %rax
	movq	%rax, %rsi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC41(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-80(%rbp), %rax
	addq	$40, %rax
	movq	%rax, %rsi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC42(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-80(%rbp), %rax
	addq	$60, %rax
	movq	%rax, %rsi
	leaq	.LC33(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-80(%rbp), %rax
	addq	$64, %rax
	movq	%rax, %rsi
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	subq	$8, %rsp
	pushq	-16(%rbp)
	pushq	-24(%rbp)
	pushq	-32(%rbp)
	pushq	-40(%rbp)
	pushq	-48(%rbp)
	pushq	-56(%rbp)
	pushq	-64(%rbp)
	pushq	-72(%rbp)
	pushq	-80(%rbp)
	call	sumarBodega
	addq	$80, %rsp
	leaq	.LC22(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jne	.L53
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
.L53:
	movss	-16(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movq	%xmm1, %rsi
	movl	-20(%rbp), %edi
	movl	-12(%rbp), %edx
	leaq	-80(%rbp), %rax
	leaq	40(%rax), %r9
	leaq	-80(%rbp), %rax
	leaq	20(%rax), %r8
	leaq	-80(%rbp), %rcx
	movq	-88(%rbp), %rax
	subq	$8, %rsp
	pushq	%rdi
	movq	%rsi, %xmm0
	leaq	.LC43(%rip), %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	call	fprintf@PLT
	addq	$16, %rsp
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	leaq	.LC44(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L56
.L52:
	leaq	.LC45(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L56:
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L55
	call	__stack_chk_fail@PLT
.L55:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	registrarProducto, .-registrarProducto
	.section	.rodata
.LC46:
	.string	"ingrese nombre: "
.LC47:
	.string	"ingrese usuario: "
.LC48:
	.string	"ingrese contrase\303\261a: "
	.align 8
.LC49:
	.string	"ingrese su rol(vendedor, admin o bodeguero): "
.LC50:
	.string	"%s %s %s %s\n"
	.align 8
.LC51:
	.string	"Usuario registrado exitosamente."
	.text
	.globl	registrarUsuario
	.type	registrarUsuario, @function
registrarUsuario:
.LFB15:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$104, %rsp
	.cfi_offset 3, -24
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	leaq	.LC46(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-96(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC47(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-96(%rbp), %rax
	addq	$20, %rax
	movq	%rax, %rsi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC48(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-96(%rbp), %rax
	addq	$40, %rax
	movq	%rax, %rsi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC49(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-96(%rbp), %rax
	addq	$60, %rax
	movq	%rax, %rsi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	subq	$8, %rsp
	subq	$72, %rsp
	movq	%rsp, %rax
	movq	-96(%rbp), %rcx
	movq	-88(%rbp), %rbx
	movq	%rcx, (%rax)
	movq	%rbx, 8(%rax)
	movq	-80(%rbp), %rcx
	movq	-72(%rbp), %rbx
	movq	%rcx, 16(%rax)
	movq	%rbx, 24(%rax)
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %rbx
	movq	%rcx, 32(%rax)
	movq	%rbx, 40(%rax)
	movq	-48(%rbp), %rcx
	movq	-40(%rbp), %rbx
	movq	%rcx, 48(%rax)
	movq	%rbx, 56(%rax)
	movl	-32(%rbp), %edx
	movl	%edx, 64(%rax)
	movzwl	-28(%rbp), %edx
	movw	%dx, 68(%rax)
	call	addUsuario
	addq	$80, %rsp
	leaq	.LC22(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -104(%rbp)
	cmpq	$0, -104(%rbp)
	jne	.L58
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
.L58:
	leaq	-96(%rbp), %rax
	leaq	60(%rax), %rdi
	leaq	-96(%rbp), %rax
	leaq	40(%rax), %rsi
	leaq	-96(%rbp), %rax
	leaq	20(%rax), %rcx
	leaq	-96(%rbp), %rdx
	movq	-104(%rbp), %rax
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC50(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	leaq	.LC51(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	nop
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	je	.L59
	call	__stack_chk_fail@PLT
.L59:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	registrarUsuario, .-registrarUsuario
	.section	.rodata
.LC52:
	.string	"Que desea actualizar: "
	.align 8
.LC53:
	.string	"1. Nombre \n 2. Usuario \n 3. Contrase\303\261a "
.LC54:
	.string	"%d"
.LC55:
	.string	"ingrese nombre nuevo: "
.LC56:
	.string	"ingrese usuario nuevo: "
.LC57:
	.string	"ingrese contrase\303\261a nueva: "
.LC58:
	.string	"Opcion incorrecta "
	.align 8
.LC59:
	.string	"Usuario actualizado exitosamente."
	.text
	.globl	updateUsuario
	.type	updateUsuario, @function
updateUsuario:
.LFB16:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -16(%rbp)
	movl	$0, -28(%rbp)
	jmp	.L61
.L62:
	addl	$1, -28(%rbp)
.L61:
	movl	-28(%rbp), %eax
	cltq
	imulq	$70, %rax, %rax
	leaq	48(%rax), %rdx
	leaq	usuarios(%rip), %rax
	addq	%rdx, %rax
	leaq	12(%rax), %rdi
	movl	-28(%rbp), %eax
	cltq
	imulq	$70, %rax, %rax
	leaq	32(%rax), %rdx
	leaq	usuarios(%rip), %rax
	addq	%rdx, %rax
	leaq	8(%rax), %rsi
	movl	-28(%rbp), %eax
	cltq
	imulq	$70, %rax, %rax
	leaq	16(%rax), %rdx
	leaq	usuarios(%rip), %rax
	addq	%rdx, %rax
	leaq	4(%rax), %rcx
	movl	-28(%rbp), %eax
	cltq
	imulq	$70, %rax, %rax
	leaq	usuarios(%rip), %rdx
	addq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC13(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	cmpl	$4, %eax
	je	.L62
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movl	$0, -24(%rbp)
	jmp	.L63
.L73:
	movl	-24(%rbp), %eax
	cltq
	imulq	$70, %rax, %rax
	leaq	16(%rax), %rdx
	leaq	usuarios(%rip), %rax
	addq	%rdx, %rax
	leaq	4(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L64
	leaq	.LC52(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC53(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC54(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-32(%rbp), %eax
	cmpl	$1, %eax
	jne	.L65
	leaq	.LC55(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-24(%rbp), %eax
	cltq
	imulq	$70, %rax, %rax
	leaq	usuarios(%rip), %rdx
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	jmp	.L66
.L65:
	movl	-32(%rbp), %eax
	cmpl	$2, %eax
	jne	.L67
	leaq	.LC56(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-24(%rbp), %eax
	cltq
	imulq	$70, %rax, %rax
	leaq	16(%rax), %rdx
	leaq	usuarios(%rip), %rax
	addq	%rdx, %rax
	addq	$4, %rax
	movq	%rax, %rsi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	jmp	.L66
.L67:
	movl	-32(%rbp), %eax
	cmpl	$3, %eax
	jne	.L68
	leaq	.LC57(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-24(%rbp), %eax
	cltq
	imulq	$70, %rax, %rax
	leaq	32(%rax), %rdx
	leaq	usuarios(%rip), %rax
	addq	%rdx, %rax
	addq	$8, %rax
	movq	%rax, %rsi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	jmp	.L66
.L68:
	leaq	.LC58(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L66:
	leaq	.LC34(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L69
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
.L69:
	movl	$0, -20(%rbp)
	jmp	.L70
.L71:
	movl	-20(%rbp), %eax
	cltq
	imulq	$70, %rax, %rax
	leaq	48(%rax), %rdx
	leaq	usuarios(%rip), %rax
	addq	%rdx, %rax
	leaq	12(%rax), %rdi
	movl	-20(%rbp), %eax
	cltq
	imulq	$70, %rax, %rax
	leaq	32(%rax), %rdx
	leaq	usuarios(%rip), %rax
	addq	%rdx, %rax
	leaq	8(%rax), %rsi
	movl	-20(%rbp), %eax
	cltq
	imulq	$70, %rax, %rax
	leaq	16(%rax), %rdx
	leaq	usuarios(%rip), %rax
	addq	%rdx, %rax
	leaq	4(%rax), %rcx
	movl	-20(%rbp), %eax
	cltq
	imulq	$70, %rax, %rax
	leaq	usuarios(%rip), %rdx
	addq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC50(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	addl	$1, -20(%rbp)
.L70:
	movl	-20(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L71
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	leaq	.LC59(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L60
.L64:
	addl	$1, -24(%rbp)
.L63:
	movl	-24(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L73
.L60:
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L74
	call	__stack_chk_fail@PLT
.L74:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	updateUsuario, .-updateUsuario
	.section	.rodata
.LC60:
	.string	"\nUsuarios registrados:"
	.align 8
.LC61:
	.string	"Nombre: %s, Usuario: %s, Rol: %s\n"
	.text
	.globl	mostrarUsarios
	.type	mostrarUsarios, @function
mostrarUsarios:
.LFB17:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jne	.L76
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
.L76:
	leaq	.LC60(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L77
.L78:
	leaq	-80(%rbp), %rax
	leaq	60(%rax), %rcx
	leaq	-80(%rbp), %rax
	leaq	20(%rax), %rdx
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC61(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L77:
	leaq	-80(%rbp), %rax
	leaq	60(%rax), %rdi
	leaq	-80(%rbp), %rax
	leaq	40(%rax), %rsi
	leaq	-80(%rbp), %rax
	leaq	20(%rax), %rcx
	leaq	-80(%rbp), %rdx
	movq	-88(%rbp), %rax
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC13(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	cmpl	$4, %eax
	je	.L78
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L79
	call	__stack_chk_fail@PLT
.L79:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	mostrarUsarios, .-mostrarUsarios
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
