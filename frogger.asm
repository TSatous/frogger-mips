#####################################################################
#Frogger MIPS assembly    TSatous
#####################################################################
	.eqv lime 0x00ff00
	.eqv blue 0x03a9f4
	.eqv gray 0x9e9e9e
	.eqv khaki 0xf0e68c
	.eqv black 0x000000
	.eqv white 0xffffff
	.eqv orange 0xff5722
	.eqv green 0x4caf50
	.eqv brown 0x8b4513
	.eqv wood 0xffd180
	.eqv darkgreen 0x2e7d32
	.eqv skin 0xffcdd2
	.eqv pink 0xe91e63
	.eqv purple 0x7e57c2
	.eqv red 0xff0000
	
	.eqv displayAddress 0x10008000
	.eqv scoreAddress 0x10009400
	.eqv goalAddress 0x10009800
	.eqv row1Address 0x10009c00
	.eqv row2Address 0x1000a000
	.eqv row3Address 0x1000a400
	.eqv safeAddress 0x1000a800
	.eqv row4Address 0x1000ac00
	.eqv row5Address 0x1000b000
	.eqv row6Address 0x1000b400
	.eqv startAddress 0x1000b800
	.eqv lifeAddress 0x1000bc00
	
	.eqv gameTick 16
	
	.eqv collisionAnimeFrames 30
	.eqv sinkAnimeFrames 60
	
.data
	goalWater: .word
		blue,blue,blue,blue,
		blue,blue,blue,blue,
		blue,blue,blue,blue,
		blue,blue,blue,blue
	frog: .word 
		green,green,green,green,
		white,black,white,black,
		green,green,green,green,
		green,orange,orange,orange
	froga: .word 
		green,green,green,green,
		white,black,white,black,
		green,orange,orange,green
		green,orange,orange,green
	frogb: .word 
		green,red,red,green,
		red,black,white,red,
		red,orange,orange,red,
		green,red,red,orange
	frogc: .word 
		green,red,red,green,
		red,red,red,red,
		red,red,red,red,
		green,red,red,green
	frogd: .word 
		green,green,green,green,
		white,black,white,black,
		orange,green,green,green,
		green,orange,orange,orange
	logL: .word
		blue,brown,brown,brown,brown,brown,brown,brown,brown,brown,brown,blue,
		brown,brown,brown,brown,brown,brown,brown,brown,brown,brown,wood,wood,
		brown,brown,brown,brown,brown,brown,brown,brown,brown,brown,wood,wood,
		blue,brown,brown,brown,brown,brown,brown,brown,brown,brown,brown,blue
	logS: .word 
		blue,brown,brown,brown,brown,brown,brown,blue,
		brown,brown,brown,brown,brown,brown,wood,wood,
		brown,brown,brown,brown,brown,brown,wood,wood,
		blue,brown,brown,brown,brown,brown,brown,blue
	turtle: .word
		skin,blue,skin,blue,
		darkgreen,darkgreen,darkgreen,skin,
		darkgreen,darkgreen,darkgreen,blue,
		skin,blue,skin,blue
	turtlea: .word
		blue,white,white,blue,
		white,darkgreen,darkgreen,white,
		white,darkgreen,darkgreen,white,
		blue,white,white,blue
	turtleb: .word
		blue,blue,blue,blue,
		blue,white,blue,blue,
		blue,blue,blue,blue,
		blue,blue,blue,blue
	bus: .word
		pink,pink,pink,pink,pink,pink,pink,pink,pink,pink,pink,pink,
		pink,white,white,white,pink,blue,pink,white,white,pink,blue,white,
		pink,pink,pink,pink,pink,blue,pink,pink,pink,pink,blue,white,
		pink,black,black,pink,pink,blue,pink,pink,pink,black,blue,pink
	carp: .word
		gray,gray,gray,gray,
		purple,purple,purple,purple,
		white,white,purple,purple,
		black,purple,purple,black
	carb: .word
		gray,gray,gray,gray,
		blue,blue,blue,blue,
		white,white,blue,blue,
		black,blue,blue,black
	zero: .word
		black,white,white,black,
		white,black,white,white,
		white,white,black,white,
		black,white,white,black
	one: .word
		black,black,white,black,
		black,black,white,black,
		black,black,white,black,
		black,black,white,black
	two: .word
		black,white,white,black,
		black,black,black,white,
		black,black,white,black,
		black,white,white,white
	three: .word
		black,white,white,black,
		black,black,white,white,
		black,black,black,white,
		black,white,white,black
	four: .word
		white,black,black,white,
		white,black,black,white,
		white,white,white,white,
		black,black,black,white
	five: .word
		white,white,white,white,
		white,white,white,black,
		black,black,black,white,
		white,white,white,black
	six: .word
		white,black,black,black,
		white,white,white,black,
		white,black,black,white,
		black,white,white,black
	seven: .word
		white,white,white,white,
		white,black,black,white,
		black,black,black,white,
		black,black,black,white
	eight: .word
		black,white,white,black,
		white,white,white,white,
		white,black,black,white,
		black,white,white,black
	nine: .word
		black,white,white,black,
		white,black,black,white,
		black,white,white,white,
		black,black,black,white
	gameOverMessage: .word
		black,white,white,white,black,	black,white,white,black,black,	white,white,white,white,black,	white,white,white,white,black,	black,black,black,black,black,	black,white,white,black,black,	white,black,black,white,black,	white,white,white,white,black,	white,white,white,black,black,
		white,black,white,white,black,	white,black,black,white,black,	white,white,white,white,black,	white,white,white,black,black,	black,black,black,black,black,	white,black,black,white,black,	white,black,black,white,black,	white,white,white,black,black,	white,black,black,white,black,
		white,black,black,white,black,	white,white,white,white,black,	white,black,black,white,black,	white,black,black,black,black,	black,black,black,black,black,	white,black,black,white,black,	black,white,white,black,black,	white,black,black,black,black,	white,white,white,black,black,
		black,white,white,white,black,	white,black,black,white,black,	white,black,black,white,black,	white,white,white,white,black,	black,black,black,black,black,	black,white,white,black,black,	black,white,white,black,black,	white,white,white,white,black,	white,black,black,white,black
	anyKeyMessage: .word
		black,white,white,black,black,	white,black,black,white,black,	black,white,black,white,black,	black,black,black,black,black,	white,black,black,white,black,	white,white,white,white,black,	black,white,black,white,black,
		white,black,black,white,black,	white,white,black,white,black,	black,white,white,white,black,	black,black,black,black,black,	white,white,white,black,black,	white,white,white,black,black,	black,white,white,white,black,
		white,white,white,white,black,	white,black,white,white,black,	black,black,white,black,black,	black,black,black,black,black,	white,white,white,black,black,	white,black,black,black,black,	black,black,white,black,black,
		white,black,black,white,black,	white,black,black,white,black,	black,black,white,black,black,	black,black,black,black,black,	white,black,black,white,black,	white,white,white,white,black,	black,black,white,black,black
	toRetryMessage: .word
		black,white,white,white,black,	black,white,white,black,black,	black,black,black,black,black,	white,white,white,black,black,	white,white,white,white,black,	black,white,white,white,black,	white,white,white,black,black,	black,white,black,white,black,
		black,black,white,black,black,	white,black,black,white,black,	black,black,black,black,black,	white,black,black,white,black,	white,white,white,black,black,	black,black,white,black,black,	white,black,black,white,black,	black,white,white,white,black,
		black,black,white,black,black,	white,black,black,white,black,	black,black,black,black,black,	white,white,white,black,black,	white,black,black,black,black,	black,black,white,black,black,	white,white,white,black,black,	black,black,white,black,black,
		black,black,white,black,black,	black,white,white,black,black,	black,black,black,black,black,	white,black,black,white,black,	white,white,white,white,black,	black,black,white,black,black,	white,black,black,white,black,	black,black,white,black,black
	row0: .word 9,22,36,50
	row1: .word 8,36
	row2: .word 4,20,40,52
	row3: .word 0,4,8,20,24,28,44,48,52
	row4: .word 4,20,40,56
	row5: .word 8,32,48
	row6: .word 0,20,44
	row7: .word 0,5,10
	speed: .word 4,8,15,6,10,4
	numRowObjects: .word 2,4,9,4,3,3
	rowDirection: .word 1,-1,1,-1,1,-1
	
	score: .word 0,0,0
	life: .word 3
	goalRow: .word 2,15,29,43,57
	goalFill: .word 0,0,0,0,0
	numGoal: .word 0
	
	x: .word 28
	y: .word 8
	
	collision: .word 0
	collisionframe: .word 0
	
	sink: .word 0
	sinkframe: .word 0
	
	lastFrameTime: .word 0
	frameCounter: .word 0
	
	
	
.text
main:
# draw upper region
	li $a0, displayAddress
	li $a1, black
	li $a2, 6
	jal drawRectangle
# draw game over
	lw $t0, life
	bgtz $t0, drawScore
	li $a0, displayAddress
	la $a1, life
	li $a2, 1
	la $a3, gameOverMessage
	li $t0, 45
	jal drawObjects
	addi $a0, $a0, 1280
	la $a1, life
	la $a3, anyKeyMessage
	li $t0, 35
	jal drawObjects
	addi $a0, $a0, 1280
	la $a1, life
	la $a3, toRetryMessage
	li $t0, 40
	jal drawObjects
# draw score
drawScore:
	li $t0, 4
	li $t3, 0
	la $t4, score
	la $a1, row7
	li $a2, 1
	scoreLoop:
		li $a0, scoreAddress
		lw $t2, 0($t4)
		la $a3, zero
		beq $t2, 0, drawInteger
		la $a3, one
		beq $t2, 1, drawInteger
		la $a3, two
		beq $t2, 2, drawInteger
		la $a3, three
		beq $t2, 3, drawInteger
		la $a3, four
		beq $t2, 4, drawInteger
		la $a3, five
		beq $t2, 5, drawInteger
		la $a3, six
		beq $t2, 6, drawInteger
		la $a3, seven
		beq $t2, 7, drawInteger
		la $a3, eight
		beq $t2, 8, drawInteger
		la $a3, nine
	drawInteger:
		jal drawObjects
		addi $t3, $t3, 1
		addi $t4, $t4, 4
		blt $t3, 3, scoreLoop	
# draw goal region
	li $a0, goalAddress
	li $a1, khaki
	li $a2, 1
	jal drawRectangle
# draw goal water
	li $a0, goalAddress
	la $a1, row0
	li $a2, 4
	la $a3, goalWater
	li $t0, 4
	jal drawObjects
# draw goal frog
	lw $t0, numGoal
	beqz $t0, drawWaterRegion
	li $t2, 0
	la $t3, goalFill 
	drawGoalFrogLoop:
		li $a0, goalAddress
		la $a1, goalRow
		add $a1, $a1, $t2 
		li $a2, 1
		la $a3, frogd
		li $t0, 4
		lw $t4, 0($t3)
		beqz $t4, nextFrog
		jal drawObjects
		nextFrog:
			addi $t2, $t2, 4
			addi $t3, $t3, 4
			blt $t2, 20, drawGoalFrogLoop
# draw water region
drawWaterRegion:	
	li $a0, row1Address
	li $a1, blue
	li $a2, 3
	jal drawRectangle
# draw row1
	li $a0, row1Address
	la $a1, row1
	li $a2, 2
	la $a3, logL
	li $t0, 12
	jal drawObjects
# draw row2
	li $a0, row2Address
	la $a1, row2
	li $a2, 4
	la $a3, logS
	li $t0, 8
	jal drawObjects
# draw row3
	li $a0, row3Address
	la $a1, row3
	li $a2, 9
	la $a3, turtle
	li $t0, 4
	jal drawObjects
# draw safe region
	li $a0, safeAddress
	li $a1, khaki
	li $a2, 1
	jal drawRectangle
# draw road region
	li $a0, row4Address
	li $a1, gray
	li $a2, 3
	jal drawRectangle
# draw row4
	li $a0, row4Address
	la $a1, row4
	li $a2, 4
	la $a3, carp
	li $t0, 4
	jal drawObjects
# draw row5
	li $a0, row5Address
	la $a1, row5
	li $a2, 3
	la $a3, bus
	li $t0, 12
	jal drawObjects
# draw row6
	li $a0, row6Address
	la $a1, row6
	li $a2, 3
	la $a3, carb
	li $t0, 4
	jal drawObjects
# draw start region
	li $a0, startAddress
	li $a1, khaki
	li $a2, 1
	jal drawRectangle
# draw live region
	li $a0, lifeAddress
	li $a1, black
	li $a2, 1
	jal drawRectangle
# draw lives
	lw $t0, life
	blez $t0, frogRow
	li $a0, lifeAddress
	la $a1, row7
	lw $a2, life
	la $a3, frog
	li $t0, 4
	jal drawObjects
frogRow:
	lw $t1, y
	li $a0, goalAddress
	beq $t1, 0, selectFrog
	li $a0, row1Address
	beq $t1, 1, selectFrog
	li $a0, row2Address
	beq $t1, 2, selectFrog
	li $a0, row3Address
	beq $t1, 3, selectFrog
	li $a0, safeAddress
	beq $t1, 4, selectFrog
	li $a0, row4Address
	beq $t1, 5, selectFrog
	li $a0, row5Address
	beq $t1, 6, selectFrog
	li $a0, row6Address
	beq $t1, 7, selectFrog
	li $a0, startAddress
	selectFrog:
		la $a1, x
		li $a2, 0
		li $t0, 4
		
		lw $t2, collision
		beq $t2, 1, drawFrogDeath
		la $a3, frog
		j drawFrog
	drawFrogDeath:
		lw $t1, collisionframe
		beq $t1, 0, drawFrogA
		beq $t1, 1, drawFrogB
		la $a3, frogc
		j drawFrog
	drawFrogA:
		la $a3, froga
		j drawFrog
	drawFrogB:
		la $a3, frogb
	drawFrog:
		jal drawObjects
# copy buffer to display
display:
	la $t0, 0x10040000
	la $t1, displayAddress
	li $t2, 0
	copyBufferLoop:
		lw $t3, 0($t1)
		sw $t3, 0($t0)
		addi $t0, $t0, 4
		addi $t1, $t1, 4
		addi $t2, $t2, 1
		blt $t2, 4096, copyBufferLoop
# sleep
waitNextFrame:
	lw $s0, lastFrameTime
	li $v0, 30
	waitNextFrameLoop:
		syscall
		sub $s1, $a0, $s0
		li $s2, gameTick
		bltu $s1, $s2, waitNextFrameLoop
		sw $a0, lastFrameTime
		lw $s0, frameCounter
		addi $s0, $s0, 1
		sw $s0, frameCounter
# check goal
	lw $t0, y
	bnez $t0, detectCollision
	# collision with water
	lw $a0, x
	la $a1, row0
	li $a2, 4
	li $a3, 4
	jal detectRoadCollision
	lw $t0, collision
	bnez $t0, deathAnimation
 	# collision with frog goal
	li $t0, 0
	blt $a0, 9, detectFrogCollision
	addi $t0, $t0, 1
	blt $a0, 22, detectFrogCollision
	addi $t0, $t0, 1
	blt $a0, 36, detectFrogCollision
	addi $t0, $t0, 1
	blt $a0, 50, detectFrogCollision
	addi $t0, $t0, 1
detectFrogCollision:
	sll $t0, $t0, 2
	la $t1, goalFill
	add $t1, $t1, $t0
	lw $t2, 0($t1)
	li $t0, 1
	beqz $t2, addScore
	sw $t0, collision
	j deathAnimation
addScore:
	sw $t0, 0($t1)
	li $t0, 28 # reset frog pos
	sw $t0, x
	li $t0, 8
	sw $t0, y
	lw $t0, numGoal # update num goal
	addi $t0, $t0, 1
	la $t1, score
	lw $t2, 8($t1) # update 1th
	addi $t2, $t2, 1
	sw $t2, 8($t1)
	blt $t2, 10, updateGoal
	sw $zero, 8($t1)
	lw $t2, 4($t1) # update 10th
	addi $t2, $t2, 1
	sw $t2, 4($t1)
	blt $t2, 10, updateGoal
	sw $zero, 4($t1)
	lw $t2, 0($t1) # update 100th
	addi $t2, $t2, 1
	sw $t2, 0($t1)
updateGoal:
	bge $t0, 5, resetGoal
	sw $t0, numGoal
	j moveRows
resetGoal:
	sw $zero, numGoal
	sw $zero, goalFill
	sw $zero, goalFill+4
	sw $zero, goalFill+8
	sw $zero, goalFill+12
	sw $zero, goalFill+16
	j moveRows
# detect collisions
detectCollision:
	lw $a0, x
	lw $t1, y
	beq $t1, 1, row1collision
	beq $t1, 2, row2collision
	beq $t1, 3, row3collision
	beq $t1, 5, row4collision
	beq $t1, 6, row5collision
	beq $t1, 7, row6collision
	j deathAnimation
	
row1collision:
	la $a1, row1
	li $a2, 2
	li $a3, 12
	jal detectWaterCollision
	j deathAnimation
row2collision:
	la $a1, row2
	li $a2, 4
	li $a3, 8
	jal detectWaterCollision
	j deathAnimation
row3collision:
	la $a1, row3
	li $a2, 9
	li $a3, 4
	jal detectWaterCollision
	j deathAnimation
row4collision:
	la $a1, row4
	li $a2, 4
	li $a3, 4
	jal detectRoadCollision
	j deathAnimation
row5collision:
	la $a1, row5
	li $a2, 3
	li $a3, 12
	jal detectRoadCollision
	j deathAnimation
row6collision:
	la $a1, row6
	li $a2, 3
	li $a3, 4
	jal detectRoadCollision
# death animation
deathAnimation:
	lw $t0, collision
	beqz $t0, moveRows
	li $t1, collisionAnimeFrames
	lw $t2, frameCounter
	div $t2, $t1
	mfhi $t2
	bnez $t2, frogRow
	lw $t0, collisionframe
	addi $t0, $t0, 1
	sw $t0, collisionframe
	blt $t0, 3, frogRow
	sw $zero, collision
	sw $zero, collisionframe
	li $t0, 28 # reset frog pos
	sw $t0, x
	li $t0, 8
	sw $t0, y
	lw $t0, life # update life
	subi $t0, $t0, 1
	sw $t0, life
	j main
# move rows
moveRows:
	li $t0, 0
	la $t1, speed
	la $t2, numRowObjects
	la $t3, rowDirection
	la $s0, row1
	moveRowLoop: # t1 times
		lw $t4, 0($t1)
		lw $t5, frameCounter
		div $t5, $t4
		mfhi $t5
		beqz $t5, moveObjects
		lw $t5, 0($t2)
		sll $t5, $t5, 2
		add $s0, $s0, $t5
		j nextRow
		moveObjects:	
			li $t6, 0
			lw $t7, 0($t2)
			lw $t8, 0($t3)
			li $t9, 0
			bgtz $t8, shiftRightLoop
			shiftLeftLoop:
				lw $s1, 0($s0)
				subi $s1, $s1, 1
				bgez $s1, keepLeft
				li $s1, 63 # underflow
				keepLeft:	
					sw $s1, 0($s0)
					addi $t9, $t9, 1
					addi $s0, $s0, 4
				blt $t9, $t7, shiftLeftLoop
				j nextRow
			shiftRightLoop:
				lw $s1, 0($s0)
				addi $s1, $s1, 1
				blt $s1, 64, keepRight
				li $s1, 0 # overflow
				keepRight:	
					sw $s1, 0($s0)
					addi $t9, $t9, 1
					addi $s0, $s0, 4
				blt $t9, $t7, shiftRightLoop
		nextRow:
			addi $t0, $t0, 1
			addi $t1, $t1, 4
			addi $t2, $t2, 4
			addi $t3, $t3, 4
		blt $t0, 6, moveRowLoop
# key input
	lw $t8, 0xffff0000
	beq $t8, 1, waitReset
floating:
	lw $t0, y
	beq $t0, 1, floatRow1
	beq $t0, 2, floatRow2
	beq $t0, 3, floatRow3
	j main
floatRow1:
	lw $t0, speed
	lw $t1, frameCounter
	div $t1, $t0
	mfhi $t1
	bnez $t1, main
	lw $t0, x
	bge $t0, 60, main
	addi $t0, $t0, 1
	sw $t0, x
	j main
floatRow2:
	lw $t0, speed + 4
	lw $t1, frameCounter
	div $t1, $t0
	mfhi $t1
	bnez $t1, main
	lw $t0, x
	blez $t0, main
	subi $t0, $t0, 1
	sw $t0, x
	j main
floatRow3:
	lw $t0, speed + 8
	lw $t1, frameCounter
	div $t1, $t0
	mfhi $t1
	bnez $t1, main
	lw $t0, x
	bge $t0, 60, main
	addi $t0, $t0, 1
	sw $t0, x
	j main
waitReset:
	lw $t9, life
	blez $t9, reset
	j keyboard_input
reset:	
	sw $zero, score
	sw $zero, score + 4
	sw $zero, score + 8
	sw $zero, numGoal
	sw $zero, goalFill
	sw $zero, goalFill + 4
	sw $zero, goalFill + 8
	sw $zero, goalFill + 12
	sw $zero, goalFill + 16
	li $t0, 3
	sw $t0, life
	j main
keyboard_input:
	lw $t2, 0xffff0004
	beq $t2, 0x61, respond_to_A
	beq $t2, 0x64, respond_to_D
	beq $t2, 0x73, respond_to_S
	beq $t2, 0x77, respond_to_W
	j main
# move frog
respond_to_A:
	lw $t0, x
	blt $t0, 4, forceLeft
	subi $t0, $t0, 4
	sw $t0, x
	j main
forceLeft:
	sw $zero, x
	j main
respond_to_D:
	lw $t0, x
	bgt $t0, 56, forceRight
	addi $t0, $t0, 4
	sw $t0, x
	j main
forceRight:
	li $t0, 60
	sw $t0, x
	j main
respond_to_S:
	lw $t0, y
	beq $t0, 8, main
	addi $t0, $t0, 1
	sw $t0, y
	j main
respond_to_W:
	lw $t0, y
	beqz $t0, main
	subi $t0, $t0, 1
	sw $t0, y
	
	j main
	
drawRectangle: # a0: row address, a1: color, a2: rows
	sll $s0, $a2, 10
	add $s0, $s0, $a0
	drawRectangleLoop:
		sw $a1, 0($a0)
		addi $a0, $a0, 4
		blt $a0, $s0, drawRectangleLoop
	jr $ra
	 
drawObjects: # a0: row address, a1: object pos(dotwise), a2: num onject, a3: object image, t0: object width(dotwise)
	li $s0, 0
	drawObjectLoop: # a2 times
		li $s1, 0
		add $s2, $zero, $a3 # load object image
		lw $s3, 0($a1) # load object pos
		sll $s3, $s3, 2
		add $s3, $s3, $a0
		addi $s7, $a0, 256 # row end
		li $s4, 0
		li $t9, 0 #is overflow
		drawObjectRowLoop: # 4 times
			li $s5, 0
			drawOnjectColumnLoop: # t0 times
				lw $s6, 0($s2) # load color
				blt $s3, $s7, noOverflow
				subi $s3, $s3, 256 # overflow
				li $t9, 1
				noOverflow:
					sw $s6, 0($s3)
				addi $s2, $s2, 4
				addi $s3, $s3, 4
				addi $s5, $s5, 1
				blt $s5, $t0, drawOnjectColumnLoop
			addi $s1, $s1, 1
			addi $s3, $s3, 256
			beqz $t9, shiftObjectRow
			addi $s3, $s3, 256
			li $t9, 0
			shiftObjectRow:
				sll $t1, $t0, 2
				sub $s3, $s3, $t1
				addi $s7, $s7, 256 # row end
			blt $s1, 4, drawObjectRowLoop
		addi $a1, $a1, 4
		addi $s0, $s0, 1
		blt $s0, $a2, drawObjectLoop
	jr $ra
	
detectRoadCollision: # a0: frogX, a1: object pos(dotwise), a2: num onject, a3: object width(dotwise)
	li $s0, 0
	detectRowCollisionLoop: # a2 times
		lw $s1, 0($a1)
		blt $a0, $s1, detectRoadLeftCollision
		add $s1, $s1, $a3
		blt $a0, $s1, roadCollide
		j nextRoadObject
		detectRoadLeftCollision:
			subi $s2, $s1, 4
			bgt $a0, $s2, roadCollide #collide left
			add $s1, $s1, $a3
			blt $s1, 64, nextRoadObject
			subi $s1, $s1, 64
			ble $a0, $s1, roadCollide
			j nextRoadObject
		roadCollide:
			li $s1, 1
			sw $s1, collision
			jr $ra
		nextRoadObject:
			addi $s0, $s0, 1
			addi $a1, $a1, 4
		blt $s0, $a2, detectRowCollisionLoop
	jr $ra
	
detectWaterCollision: # a0: frogX, a1: object pos(dotwise), a2: num onject, a3: object width(dotwise)
	li $s0, 0
	detectWaterCollisionLoop: # a2 times
		lw $s1, 0($a1)
		blt $a0, $s1, detectWaterLeftCollision
		add $s1, $s1, $a3
		blt $a0, $s1, waterSafe
		j nextWaterObject
		detectWaterLeftCollision:
			subi $s2, $s1, 4
			bgt $a0, $s2, waterSafe
			add $s1, $s1, $a3
			blt $s1, 64, nextWaterObject
			subi $s1, $s1, 64
			ble $a0, $s1, waterSafe
			j nextWaterObject
		waterSafe:
			jr $ra
		nextWaterObject:
			addi $s0, $s0, 1
			addi $a1, $a1, 4
		blt $s0, $a2, detectWaterCollisionLoop
	li $s1, 1
	sw $s1, collision
	jr $ra
	
Exit:
	li $v0, 10 # terminate the program gracefully
	syscall

