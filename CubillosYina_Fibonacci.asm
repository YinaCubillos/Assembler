.data
mensaje1: .asciiz "Ingrese la cantidad de números de la serie de Fibonacci: "
mensaje2: .asciiz "La serie de Fibonacci es: "
mensaje3: .asciiz "La suma de los números de la serie es: "

.text
.globl main

main:
    # Pedir la cantidad de números
    li $v0, 4
    la $a0, mensaje1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0  # Cantidad de números en $t0

    # Inicializar variables para la serie
    li $t1, 0  # Primer número (0)
    li $t2, 1  # Segundo número (1)
    li $t3, 0  # Acumulador para la suma

    # Imprimir el mensaje de la serie
    li $v0, 4
    la $a0, mensaje2
    syscall

    # Generar y mostrar la serie
    loop:
        # Imprimir el número actual
        li $v0, 1
        move $a0, $t1
        syscall
        
        # Sumar el número actual al acumulador
        add $t3, $t3, $t1

        # Calcular el siguiente número de la serie
        add $t4, $t1, $t2
        move $t1, $t2
        move $t2, $t4

        # Imprimir una coma si no es el último número
	li $v0, 4
	li $a0, ','
     

        # Decrementar el contador
        addi $t0, $t0, -1

        # Verificar si se han generado todos los números
        bne $t0, $zero, loop

    # Imprimir un salto de línea
    li $v0, 11
    li $a0, '\n'
    syscall

    # Imprimir el mensaje de la suma
    li $v0, 4
    la $a0, mensaje3
    syscall

    # Imprimir la suma
    li $v0, 1
    move $a0, $t3
    syscall

    # Terminar el programa
    li $v0, 10
    syscall
