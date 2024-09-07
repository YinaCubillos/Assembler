.data
mensaje1: .asciiz "Ingrese el primer número: "
mensaje2: .asciiz "Ingrese el segundo número: "
mensaje3: .asciiz "Ingrese el tercer número: "
mensaje4: .asciiz "El número menor es: "

.text
.globl main

main:
    # Pedir el primer número
    li $v0, 4
    la $a0, mensaje1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0  # Almacenar el primer número en $t0

    # Pedir el segundo número
    li $v0, 4
    la $a0, mensaje2
    syscall
    li $v0, 5
    syscall
    move $t1, $v0  # Almacenar el segundo número en $t1

    # Pedir el tercer número
    li $v0, 4
    la $a0, mensaje3
    syscall
    li $v0, 5
    syscall
    move $t2, $v0  # Almacenar el tercer número en $t2

    # Comparar los números y encontrar el menor
    # Inicialmente, asumimos que el primer número es el menor
    move $t3, $t0

    # Comparar con el segundo número
    blt $t1, $t3, segundoMenor
    # Si llegamos aquí, el primer número sigue siendo el menor

    # Comparar con el tercer número
    blt $t2, $t3, tercerMenor
    # Si llegamos aquí, el primer número sigue siendo el menor
    j imprimirResultado

segundoMenor:
    # El segundo número es el menor hasta ahora
    move $t3, $t1
    # Comparar con el tercer número
    blt $t2, $t3, tercerMenor
    j imprimirResultado

tercerMenor:
    # El tercer número es el menor
    move $t3, $t2

imprimirResultado:
    # Imprimir el mensaje de resultado
    li $v0, 4
    la $a0, mensaje4
    syscall
    li $v0, 1
    move $a0, $t3
    syscall

    # Terminar el programa
    li $v0, 10
    syscall