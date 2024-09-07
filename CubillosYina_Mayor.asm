.data
mensaje1: .asciiz "Ingresa el primer número: "
mensaje2: .asciiz "Ingresa el segundo número: "
mensaje3: .asciiz "Ingresa el tercer número: "
result: .asciiz "El número mayor es: "

.text
.globl main

main:
    # Solicitar entrada de datos
    li $v0, 4
    la $a0, mensaje1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0  # Guardar el primer número en $t0

    li $v0, 4
    la $a0, mensaje2
    syscall
    li $v0, 5
    syscall
    move $t1, $v0  # Guardar el segundo número en $t1

    li $v0, 4
    la $a0, mensaje3
    syscall
    li $v0, 5
    syscall
    move $t2, $v0  # Guardar el tercer número en $t2

    # Comparar los números
    # Si $t0 > $t1, saltar a etiqueta1
    bgt $t0, $t1, etiqueta1
    move $t3, $t1  # $t1 es el mayor hasta ahora
    j etiqueta2

etiqueta1:
    move $t3, $t0  # $t0 es el mayor hasta ahora

etiqueta2:
    # Comparar con el tercer número
    bgt $t3, $t2, etiqueta3
    move $t3, $t2  # $t2 es el mayor

etiqueta3:
    # Mostrar el resultado
    li $v0, 4
    la $a0, result
    syscall
    move $a0, $t3
    li $v0, 1
    syscall

    # Salir del programa
    li $v0, 10
    syscall
