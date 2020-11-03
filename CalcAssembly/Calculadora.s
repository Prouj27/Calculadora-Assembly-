.text
		
main: 		add $sp,$sp,-24
		sw $s1,0($sp)
		sw $s2,4($sp)
		sw $s3,8($sp)
		sw $s4,12($sp)
		sw $a0,16($sp)
		sw $ra,20($sp)     	
		add $s1,$zero,1
		add $s2,$zero,2
		add $s3,$zero,3
  		add $s4,$zero,4			
		li $v0,4
   		la $a0,bemvindo
   		syscall
while:		li $v0,4
   		la $a0,txt
   		syscall
		li $v0,5
   		syscall 
	 	beq $v0,$zero,fim
		li $v0,4
   		la $a0,operacoes
   		syscall
   		li $v0,5
   		syscall 
		beq $v0,$s1,soma 
   	        beq $v0,$s2,subtrair  
   		beq $v0,$s3,multiplicar 
  	        beq $v0,$s4,dividir 
		j while  
subtrair:       add $t5,$zero,0
   		add $t6,$zero,0
   		add $t7,$zero,0 
   		li $v0,4
   		la $a0,novovalor 
   		syscall
   		li $v0,5
   		syscall	
   		add $t5,$v0,$zero
   		li $v0,4
   		la $a0,novovalor
   		syscall
   		li $v0,5
   		syscall  
   		add $t6,$v0,$zero
   		sub $t7, $t5,$t6
   		li $v0, 1
   		move $a0, $t7
   		syscall	
		j while
soma:	        add $t5,$zero,0
   		add $t6,$zero,0
   		add $t7,$zero,0
  		li $v0,4
   		la $a0,novovalor
   		syscall
   		li $v0,5
   		syscall
   		add $t5,$v0,$zero
   		li $v0,4
   		la $a0,novovalor 
   		syscall
   		li $v0,5
   		syscall
   		add $t6,$v0,$zero
   		add $t7, $t5,$t6
   		li $v0, 1
   		move $a0, $t7
   		syscall
   		j while
dividir:	add $t5,$zero,0
   		add $t6,$zero,0
   		add $t7,$zero,0 
   		li $v0,4
  	        la $a0,novovalor
   		syscall	
   		li $v0,5
   		syscall
   		add $t5,$v0,$zero
   		li $v0,4
   		la $a0,novovalor
   		syscall
   		li $v0,5
   		syscall  
   		add $t6,$v0,$zero
   		div $t7, $t5,$t6
   		li $v0, 1
   		move $a0, $t7
   		syscall
   		j while
multiplicar:	add $t5,$zero,0
   		add $t6,$zero,0
   		add $t7,$zero,0 
  		li $v0,4
   		la $a0,novovalor 
   		syscall
   		li $v0,5
   		syscall
   		add $t5,$v0,$zero
   		li $v0,4
   		la $a0,novovalor 
   		syscall
   		li $v0,5
   		syscall 
   		add $t6,$v0,$zero
   		mul $t7, $t5,$t6
   		li $v0, 1
   		move $a0, $t7
   		syscall 	
		j while
fim: 		li $v0,4
   		la $a0,desativado
   		syscall
		lw $ra,20($sp)
		lw $a0,16($sp)
		lw $s4,12($sp)
		lw $s3,8($sp)
		lw $s2,4($sp)
		lw $s1,0($sp)
		add $sp,$sp,24	
		jr $ra
.data

bemvindo:	.asciiz "Olá bem vindo a calculadora, esse programa só trabalha com números inteiros e positivos, resultando em 0 ou em valor errado se a entrada ou resultado final for quebrado ou negativo."
operacoes:	.asciiz "\nEscolha uma opcao:\n1 pra Somar\n2 pra Subtrair\n3 pra Multiplicar\n4 pra Dividir\n"
novovalor:	.asciiz "\nAdicione um valor:"
txt:  		.asciiz "\n\n1-Para ligar a calculadora 0-Para desativar\n"
desativado:	.asciiz "Desativado"     

	
   

   
