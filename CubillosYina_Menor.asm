.data
mensaje1: .asciiz "Ingrese el primer n�mero: "
mensaje2: .asciiz "Ingrese el segundo n�mero: "
mensaje3: .asciiz "Ingrese el tercer n�mero: "
mensaje4: .asciiz "El n�mero menor es: "

.text
.globl main

main:
    # Pedir el primer n�mero
    li $v0, 4
    la $a0, mensaje1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0  # Almacenar el primer n�mero en $t0

    # Pedir el segundo n�mero
    li $v0, 4
    la $a0, mensaje2
    syscall
    li $v0, 5
    syscall
    move $t1, $v0  # Almacenar el segundo n�mero en $t1

    # Pedir el tercer n�mero
    li $v0, 4
    la $a0, mensaje3
    syscall
    li $v0, 5
    syscall
    move $t2, $v0  # Almacenar el tercer n�mero en $t2

    # Comparar los n�meros y encontrar el menor
    # Inicialmente, asumimos que el primer n�mero es el menor
    move $t3, $t0

    # Comparar con el segundo n�mero
    blt $t1, $t3, segundoMenor
    # Si llegamos aqu�, el primer n�mero sigue siendo el menor

    # Comparar con el tercer n�mero
    blt $t2, $t3, tercerMenor
    # Si llegamos aqu�, el primer n�mero sigue siendo el menor
    j imprimirResultado

segundoMenor:
    # El segundo n�mero es el menor hasta ahora
    move $t3, $t1
    # Comparar con el tercer n�mero
    blt $t2, $t3, tercerMenor
    j imprimirResultado

tercerMenor:
    # El tercer n�mero es el menor
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