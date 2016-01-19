.text
#ifdef OPENSSL_FIPSCANISTER
# include <openssl/fipssyms.h>
#endif

#if !defined(__vxworks) || defined(__pic__)
.option	pic2
#endif
.set	noat
.align	5
.ent	_mips_AES_encrypt
_mips_AES_encrypt:
	.frame	$29,0,$31
	.set	reorder
	lw	$12,0($6)
	lw	$13,4($6)
	lw	$14,8($6)
	lw	$15,12($6)
	lw	$30,240($6)
	add $3,$6,16

	xor	$8,$12
	xor	$9,$13
	xor	$10,$14
	xor	$11,$15

	sub	$30,1
	srl	$1,$9,6
.Loop_enc:
	srl	$2,$10,6
	srl	$24,$11,6
	srl	$25,$8,6
	and	$1,0x3fc
	and	$2,0x3fc
	and	$24,0x3fc
	and	$25,0x3fc
	add $1,$7
	add $2,$7
	add $24,$7
	add $25,$7
	lwl	$12,2($1)		# Te1[s1>>16]
	lwl	$13,2($2)		# Te1[s2>>16]
	lwl	$14,2($24)		# Te1[s3>>16]
	lwl	$15,2($25)		# Te1[s0>>16]
	lwr	$12,3($1)		# Te1[s1>>16]
	lwr	$13,3($2)		# Te1[s2>>16]
	lwr	$14,3($24)		# Te1[s3>>16]
	lwr	$15,3($25)		# Te1[s0>>16]

	srl	$1,$10,14
	srl	$2,$11,14
	srl	$24,$8,14
	srl	$25,$9,14
	and	$1,0x3fc
	and	$2,0x3fc
	and	$24,0x3fc
	and	$25,0x3fc
	add $1,$7
	add $2,$7
	add $24,$7
	add $25,$7
	lwl	$16,1($1)		# Te2[s2>>8]
	lwl	$17,1($2)		# Te2[s3>>8]
	lwl	$18,1($24)		# Te2[s0>>8]
	lwl	$19,1($25)		# Te2[s1>>8]
	lwr	$16,2($1)		# Te2[s2>>8]
	lwr	$17,2($2)		# Te2[s3>>8]
	lwr	$18,2($24)		# Te2[s0>>8]
	lwr	$19,2($25)		# Te2[s1>>8]

	srl	$1,$11,22
	srl	$2,$8,22
	srl	$24,$9,22
	srl	$25,$10,22
	and	$1,0x3fc
	and	$2,0x3fc
	and	$24,0x3fc
	and	$25,0x3fc
	add $1,$7
	add $2,$7
	add $24,$7
	add $25,$7
	lwl	$20,0($1)		# Te3[s3]
	lwl	$21,0($2)		# Te3[s0]
	lwl	$22,0($24)		# Te3[s1]
	lwl	$23,0($25)		# Te3[s2]
	lwr	$20,1($1)		# Te3[s3]
	lwr	$21,1($2)		# Te3[s0]
	lwr	$22,1($24)		# Te3[s1]
	lwr	$23,1($25)		# Te3[s2]

	sll	$1,$8,2
	sll	$2,$9,2
	sll	$24,$10,2
	sll	$25,$11,2
	and	$1,0x3fc
	and	$2,0x3fc
	and	$24,0x3fc
	and	$25,0x3fc
	add $1,$7
	add $2,$7
	add $24,$7
	add $25,$7
	xor	$12,$16
	xor	$13,$17
	xor	$14,$18
	xor	$15,$19
	lw	$16,0($1)		# Te0[s0>>24]
	lw	$17,0($2)		# Te0[s1>>24]
	lw	$18,0($24)		# Te0[s2>>24]
	lw	$19,0($25)		# Te0[s3>>24]

	lw	$8,0($3)
	lw	$9,4($3)
	lw	$10,8($3)
	lw	$11,12($3)

	xor	$12,$20
	xor	$13,$21
	xor	$14,$22
	xor	$15,$23

	xor	$12,$16
	xor	$13,$17
	xor	$14,$18
	xor	$15,$19

	sub	$30,1
	add $3,16
	xor	$8,$12
	xor	$9,$13
	xor	$10,$14
	xor	$11,$15
	.set	noreorder
	bnez	$30,.Loop_enc
	srl	$1,$9,6

	.set	reorder
	srl	$2,$10,6
	srl	$24,$11,6
	srl	$25,$8,6
	and	$1,0x3fc
	and	$2,0x3fc
	and	$24,0x3fc
	and	$25,0x3fc
	add $1,$7
	add $2,$7
	add $24,$7
	add $25,$7
	lbu	$12,2($1)		# Te4[s1>>16]
	lbu	$13,2($2)		# Te4[s2>>16]
	lbu	$14,2($24)		# Te4[s3>>16]
	lbu	$15,2($25)		# Te4[s0>>16]

	srl	$1,$10,14
	srl	$2,$11,14
	srl	$24,$8,14
	srl	$25,$9,14
	and	$1,0x3fc
	and	$2,0x3fc
	and	$24,0x3fc
	and	$25,0x3fc
	add $1,$7
	add $2,$7
	add $24,$7
	add $25,$7
	lbu	$16,2($1)		# Te4[s2>>8]
	lbu	$17,2($2)		# Te4[s3>>8]
	lbu	$18,2($24)		# Te4[s0>>8]
	lbu	$19,2($25)		# Te4[s1>>8]

	sll	$1,$8,2
	sll	$2,$9,2
	sll	$24,$10,2
	sll	$25,$11,2
	and	$1,0x3fc
	and	$2,0x3fc
	and	$24,0x3fc
	and	$25,0x3fc
	add $1,$7
	add $2,$7
	add $24,$7
	add $25,$7
	lbu	$20,2($1)		# Te4[s0>>24]
	lbu	$21,2($2)		# Te4[s1>>24]
	lbu	$22,2($24)		# Te4[s2>>24]
	lbu	$23,2($25)		# Te4[s3>>24]

	srl	$1,$11,22
	srl	$2,$8,22
	srl	$24,$9,22
	srl	$25,$10,22
	and	$1,0x3fc
	and	$2,0x3fc
	and	$24,0x3fc
	and	$25,0x3fc

	sll	$12,$12,8
	sll	$13,$13,8
	sll	$14,$14,8
	sll	$15,$15,8

	sll	$16,$16,16
	sll	$17,$17,16
	sll	$18,$18,16
	sll	$19,$19,16

	xor	$12,$16
	xor	$13,$17
	xor	$14,$18
	xor	$15,$19

	add $1,$7
	add $2,$7
	add $24,$7
	add $25,$7
	lbu	$16,2($1)		# Te4[s3]
	lbu	$17,2($2)		# Te4[s0]
	lbu	$18,2($24)		# Te4[s1]
	lbu	$19,2($25)		# Te4[s2]

	#sll	$20,$20,0
	#sll	$21,$21,0
	#sll	$22,$22,0
	#sll	$23,$23,0

	lw	$8,0($3)
	lw	$9,4($3)
	lw	$10,8($3)
	lw	$11,12($3)

	xor	$12,$20
	xor	$13,$21
	xor	$14,$22
	xor	$15,$23

	sll	$16,$16,24
	sll	$17,$17,24
	sll	$18,$18,24
	sll	$19,$19,24

	xor	$12,$16
	xor	$13,$17
	xor	$14,$18
	xor	$15,$19

	xor	$8,$12
	xor	$9,$13
	xor	$10,$14
	xor	$11,$15

	jr	$31
.end	_mips_AES_encrypt

.align	5
.globl	AES_encrypt
.ent	AES_encrypt
AES_encrypt:
	.frame	$29,64,$31
	.mask	3237937152,-4
	.set	noreorder
	sub $29,64
	sw	$31,64-1*4($29)
	sw	$30,64-2*4($29)
	sw	$23,64-3*4($29)
	sw	$22,64-4*4($29)
	sw	$21,64-5*4($29)
	sw	$20,64-6*4($29)
	sw	$19,64-7*4($29)
	sw	$18,64-8*4($29)
	sw	$17,64-9*4($29)
	sw	$16,64-10*4($29)
	.cplocal	$7
	.cpsetup	$25,$0,AES_encrypt
	.set	reorder
	la	$7,AES_Te		# PIC-ified 'load address'

	lwl	$8,0+3($4)
	lwl	$9,4+3($4)
	lwl	$10,8+3($4)
	lwl	$11,12+3($4)
	lwr	$8,0+0($4)
	lwr	$9,4+0($4)
	lwr	$10,8+0($4)
	lwr	$11,12+0($4)

	bal	_mips_AES_encrypt

	swr	$8,0+0($5)
	swr	$9,4+0($5)
	swr	$10,8+0($5)
	swr	$11,12+0($5)
	swl	$8,0+3($5)
	swl	$9,4+3($5)
	swl	$10,8+3($5)
	swl	$11,12+3($5)

	.set	noreorder
	lw	$31,64-1*4($29)
	lw	$30,64-2*4($29)
	lw	$23,64-3*4($29)
	lw	$22,64-4*4($29)
	lw	$21,64-5*4($29)
	lw	$20,64-6*4($29)
	lw	$19,64-7*4($29)
	lw	$18,64-8*4($29)
	lw	$17,64-9*4($29)
	lw	$16,64-10*4($29)
	jr	$31
	add $29,64
.end	AES_encrypt
.align	5
.ent	_mips_AES_decrypt
_mips_AES_decrypt:
	.frame	$29,0,$31
	.set	reorder
	lw	$12,0($6)
	lw	$13,4($6)
	lw	$14,8($6)
	lw	$15,12($6)
	lw	$30,240($6)
	add $3,$6,16

	xor	$8,$12
	xor	$9,$13
	xor	$10,$14
	xor	$11,$15

	sub	$30,1
	srl	$1,$11,6
.Loop_dec:
	srl	$2,$8,6
	srl	$24,$9,6
	srl	$25,$10,6
	and	$1,0x3fc
	and	$2,0x3fc
	and	$24,0x3fc
	and	$25,0x3fc
	add $1,$7
	add $2,$7
	add $24,$7
	add $25,$7
	lwl	$12,2($1)		# Td1[s3>>16]
	lwl	$13,2($2)		# Td1[s0>>16]
	lwl	$14,2($24)		# Td1[s1>>16]
	lwl	$15,2($25)		# Td1[s2>>16]
	lwr	$12,3($1)		# Td1[s3>>16]
	lwr	$13,3($2)		# Td1[s0>>16]
	lwr	$14,3($24)		# Td1[s1>>16]
	lwr	$15,3($25)		# Td1[s2>>16]

	srl	$1,$10,14
	srl	$2,$11,14
	srl	$24,$8,14
	srl	$25,$9,14
	and	$1,0x3fc
	and	$2,0x3fc
	and	$24,0x3fc
	and	$25,0x3fc
	add $1,$7
	add $2,$7
	add $24,$7
	add $25,$7
	lwl	$16,1($1)		# Td2[s2>>8]
	lwl	$17,1($2)		# Td2[s3>>8]
	lwl	$18,1($24)		# Td2[s0>>8]
	lwl	$19,1($25)		# Td2[s1>>8]
	lwr	$16,2($1)		# Td2[s2>>8]
	lwr	$17,2($2)		# Td2[s3>>8]
	lwr	$18,2($24)		# Td2[s0>>8]
	lwr	$19,2($25)		# Td2[s1>>8]

	srl	$1,$9,22
	srl	$2,$10,22
	srl	$24,$11,22
	srl	$25,$8,22
	and	$1,0x3fc
	and	$2,0x3fc
	and	$24,0x3fc
	and	$25,0x3fc
	add $1,$7
	add $2,$7
	add $24,$7
	add $25,$7
	lwl	$20,0($1)		# Td3[s1]
	lwl	$21,0($2)		# Td3[s2]
	lwl	$22,0($24)		# Td3[s3]
	lwl	$23,0($25)		# Td3[s0]
	lwr	$20,1($1)		# Td3[s1]
	lwr	$21,1($2)		# Td3[s2]
	lwr	$22,1($24)		# Td3[s3]
	lwr	$23,1($25)		# Td3[s0]

	sll	$1,$8,2
	sll	$2,$9,2
	sll	$24,$10,2
	sll	$25,$11,2
	and	$1,0x3fc
	and	$2,0x3fc
	and	$24,0x3fc
	and	$25,0x3fc
	add $1,$7
	add $2,$7
	add $24,$7
	add $25,$7

	xor	$12,$16
	xor	$13,$17
	xor	$14,$18
	xor	$15,$19


	lw	$16,0($1)		# Td0[s0>>24]
	lw	$17,0($2)		# Td0[s1>>24]
	lw	$18,0($24)		# Td0[s2>>24]
	lw	$19,0($25)		# Td0[s3>>24]

	lw	$8,0($3)
	lw	$9,4($3)
	lw	$10,8($3)
	lw	$11,12($3)

	xor	$12,$20
	xor	$13,$21
	xor	$14,$22
	xor	$15,$23

	xor	$12,$16
	xor	$13,$17
	xor	$14,$18
	xor	$15,$19

	sub	$30,1
	add $3,16
	xor	$8,$12
	xor	$9,$13
	xor	$10,$14
	xor	$11,$15
	.set	noreorder
	bnez	$30,.Loop_dec
	srl	$1,$11,6

	.set	reorder
	lw	$16,1024($7)		# prefetch Td4
	lw	$17,1024+32($7)
	lw	$18,1024+64($7)
	lw	$19,1024+96($7)
	lw	$20,1024+128($7)
	lw	$21,1024+160($7)
	lw	$22,1024+192($7)
	lw	$23,1024+224($7)

	srl	$1,$11,8
	srl	$2,$8,8
	srl	$24,$9,8
	srl	$25,$10,8
	and	$1,0xff
	and	$2,0xff
	and	$24,0xff
	and	$25,0xff
	add $1,$7
	add $2,$7
	add $24,$7
	add $25,$7
	lbu	$12,1024($1)		# Td4[s3>>16]
	lbu	$13,1024($2)		# Td4[s0>>16]
	lbu	$14,1024($24)		# Td4[s1>>16]
	lbu	$15,1024($25)		# Td4[s2>>16]

	srl	$1,$10,16
	srl	$2,$11,16
	srl	$24,$8,16
	srl	$25,$9,16
	and	$1,0xff
	and	$2,0xff
	and	$24,0xff
	and	$25,0xff
	add $1,$7
	add $2,$7
	add $24,$7
	add $25,$7
	lbu	$16,1024($1)		# Td4[s2>>8]
	lbu	$17,1024($2)		# Td4[s3>>8]
	lbu	$18,1024($24)		# Td4[s0>>8]
	lbu	$19,1024($25)		# Td4[s1>>8]

	and	$1,$8,0xff
	and	$2,$9,0xff
	and	$24,$10,0xff
	and	$25,$11,0xff
	add $1,$7
	add $2,$7
	add $24,$7
	add $25,$7
	lbu	$20,1024($1)		# Td4[s0>>24]
	lbu	$21,1024($2)		# Td4[s1>>24]
	lbu	$22,1024($24)		# Td4[s2>>24]
	lbu	$23,1024($25)		# Td4[s3>>24]

	srl	$1,$9,24
	srl	$2,$10,24
	srl	$24,$11,24
	srl	$25,$8,24

	sll	$12,$12,8
	sll	$13,$13,8
	sll	$14,$14,8
	sll	$15,$15,8

	sll	$16,$16,16
	sll	$17,$17,16
	sll	$18,$18,16
	sll	$19,$19,16

	xor	$12,$16
	xor	$13,$17
	xor	$14,$18
	xor	$15,$19

	add $1,$7
	add $2,$7
	add $24,$7
	add $25,$7
	lbu	$16,1024($1)		# Td4[s1]
	lbu	$17,1024($2)		# Td4[s2]
	lbu	$18,1024($24)		# Td4[s3]
	lbu	$19,1024($25)		# Td4[s0]

	#sll	$20,$20,0
	#sll	$21,$21,0
	#sll	$22,$22,0
	#sll	$23,$23,0

	lw	$8,0($3)
	lw	$9,4($3)
	lw	$10,8($3)
	lw	$11,12($3)

	sll	$16,$16,24
	sll	$17,$17,24
	sll	$18,$18,24
	sll	$19,$19,24


	xor	$12,$20
	xor	$13,$21
	xor	$14,$22
	xor	$15,$23

	xor	$12,$16
	xor	$13,$17
	xor	$14,$18
	xor	$15,$19

	xor	$8,$12
	xor	$9,$13
	xor	$10,$14
	xor	$11,$15

	jr	$31
.end	_mips_AES_decrypt

.align	5
.globl	AES_decrypt
.ent	AES_decrypt
AES_decrypt:
	.frame	$29,64,$31
	.mask	3237937152,-4
	.set	noreorder
	sub $29,64
	sw	$31,64-1*4($29)
	sw	$30,64-2*4($29)
	sw	$23,64-3*4($29)
	sw	$22,64-4*4($29)
	sw	$21,64-5*4($29)
	sw	$20,64-6*4($29)
	sw	$19,64-7*4($29)
	sw	$18,64-8*4($29)
	sw	$17,64-9*4($29)
	sw	$16,64-10*4($29)
	.cplocal	$7
	.cpsetup	$25,$0,AES_decrypt
	.set	reorder
	la	$7,AES_Td		# PIC-ified 'load address'

	lwl	$8,0+3($4)
	lwl	$9,4+3($4)
	lwl	$10,8+3($4)
	lwl	$11,12+3($4)
	lwr	$8,0+0($4)
	lwr	$9,4+0($4)
	lwr	$10,8+0($4)
	lwr	$11,12+0($4)

	bal	_mips_AES_decrypt

	swr	$8,0+0($5)
	swr	$9,4+0($5)
	swr	$10,8+0($5)
	swr	$11,12+0($5)
	swl	$8,0+3($5)
	swl	$9,4+3($5)
	swl	$10,8+3($5)
	swl	$11,12+3($5)

	.set	noreorder
	lw	$31,64-1*4($29)
	lw	$30,64-2*4($29)
	lw	$23,64-3*4($29)
	lw	$22,64-4*4($29)
	lw	$21,64-5*4($29)
	lw	$20,64-6*4($29)
	lw	$19,64-7*4($29)
	lw	$18,64-8*4($29)
	lw	$17,64-9*4($29)
	lw	$16,64-10*4($29)
	jr	$31
	add $29,64
.end	AES_decrypt
.align	5
.ent	_mips_AES_set_encrypt_key
_mips_AES_set_encrypt_key:
	.frame	$29,0,$31
	.set	noreorder
	beqz	$4,.Lekey_done
	li	$2,-1
	beqz	$6,.Lekey_done
	add $3,$7,1024+256

	.set	reorder
	lwl	$8,0+3($4)	# load 128 bits
	lwl	$9,4+3($4)
	lwl	$10,8+3($4)
	lwl	$11,12+3($4)
	li	$1,128
	lwr	$8,0+0($4)
	lwr	$9,4+0($4)
	lwr	$10,8+0($4)
	lwr	$11,12+0($4)
	.set	noreorder
	beq	$5,$1,.L128bits
	li	$30,10

	.set	reorder
	lwl	$12,16+3($4)	# load 192 bits
	lwl	$13,20+3($4)
	li	$1,192
	lwr	$12,16+0($4)
	lwr	$13,20+0($4)
	.set	noreorder
	beq	$5,$1,.L192bits
	li	$30,8

	.set	reorder
	lwl	$14,24+3($4)	# load 256 bits
	lwl	$15,28+3($4)
	li	$1,256
	lwr	$14,24+0($4)
	lwr	$15,28+0($4)
	.set	noreorder
	beq	$5,$1,.L256bits
	li	$30,7

	b	.Lekey_done
	li	$2,-2

.align	4
.L128bits:
	.set	reorder
	srl	$1,$11,16
	srl	$2,$11,8
	and	$1,0xff
	and	$2,0xff
	and	$24,$11,0xff
	srl	$25,$11,24
	add $1,$7
	add $2,$7
	add $24,$7
	add $25,$7
	lbu	$1,1024($1)
	lbu	$2,1024($2)
	lbu	$24,1024($24)
	lbu	$25,1024($25)

	sw	$8,0($6)
	sw	$9,4($6)
	sw	$10,8($6)
	sw	$11,12($6)
	sub	$30,1
	add $6,16

	sll	$1,$1,8
	#sll	$2,$2,0
	sll	$24,$24,24
	sll	$25,$25,16

	xor	$8,$1
	lw	$1,0($3)
	xor	$8,$2
	xor	$8,$24
	xor	$8,$25
	xor	$8,$1

	xor	$9,$8
	xor	$10,$9
	xor	$11,$10

	.set	noreorder
	bnez	$30,.L128bits
	add $3,4

	sw	$8,0($6)
	sw	$9,4($6)
	sw	$10,8($6)
	li	$30,10
	sw	$11,12($6)
	li	$2,0
	sw	$30,80($6)
	b	.Lekey_done
	sub $6,10*16

.align	4
.L192bits:
	.set	reorder
	srl	$1,$13,16
	srl	$2,$13,8
	and	$1,0xff
	and	$2,0xff
	and	$24,$13,0xff
	srl	$25,$13,24
	add $1,$7
	add $2,$7
	add $24,$7
	add $25,$7
	lbu	$1,1024($1)
	lbu	$2,1024($2)
	lbu	$24,1024($24)
	lbu	$25,1024($25)

	sw	$8,0($6)
	sw	$9,4($6)
	sw	$10,8($6)
	sw	$11,12($6)
	sw	$12,16($6)
	sw	$13,20($6)
	sub	$30,1
	add $6,24

	sll	$1,$1,8
	#sll	$2,$2,0
	sll	$24,$24,24
	sll	$25,$25,16

	xor	$8,$1
	lw	$1,0($3)
	xor	$8,$2
	xor	$8,$24
	xor	$8,$25
	xor	$8,$1

	xor	$9,$8
	xor	$10,$9
	xor	$11,$10
	xor	$12,$11
	xor	$13,$12

	.set	noreorder
	bnez	$30,.L192bits
	add $3,4

	sw	$8,0($6)
	sw	$9,4($6)
	sw	$10,8($6)
	li	$30,12
	sw	$11,12($6)
	li	$2,0
	sw	$30,48($6)
	b	.Lekey_done
	sub $6,12*16

.align	4
.L256bits:
	.set	reorder
	srl	$1,$15,16
	srl	$2,$15,8
	and	$1,0xff
	and	$2,0xff
	and	$24,$15,0xff
	srl	$25,$15,24
	add $1,$7
	add $2,$7
	add $24,$7
	add $25,$7
	lbu	$1,1024($1)
	lbu	$2,1024($2)
	lbu	$24,1024($24)
	lbu	$25,1024($25)

	sw	$8,0($6)
	sw	$9,4($6)
	sw	$10,8($6)
	sw	$11,12($6)
	sw	$12,16($6)
	sw	$13,20($6)
	sw	$14,24($6)
	sw	$15,28($6)
	sub	$30,1

	sll	$1,$1,8
	#sll	$2,$2,0
	sll	$24,$24,24
	sll	$25,$25,16

	xor	$8,$1
	lw	$1,0($3)
	xor	$8,$2
	xor	$8,$24
	xor	$8,$25
	xor	$8,$1

	xor	$9,$8
	xor	$10,$9
	xor	$11,$10
	beqz	$30,.L256bits_done

	srl	$1,$11,24
	srl	$2,$11,16
	srl	$24,$11,8
	and	$25,$11,0xff
	and	$2,0xff
	and	$24,0xff
	add $1,$7
	add $2,$7
	add $24,$7
	add $25,$7
	lbu	$1,1024($1)
	lbu	$2,1024($2)
	lbu	$24,1024($24)
	lbu	$25,1024($25)
	sll	$1,24
	sll	$2,16
	sll	$24,8

	xor	$12,$1
	xor	$12,$2
	xor	$12,$24
	xor	$12,$25

	xor	$13,$12
	xor	$14,$13
	xor	$15,$14

	add $6,32
	.set	noreorder
	b	.L256bits
	add $3,4

.L256bits_done:
	sw	$8,32($6)
	sw	$9,36($6)
	sw	$10,40($6)
	li	$30,14
	sw	$11,44($6)
	li	$2,0
	sw	$30,48($6)
	sub $6,12*16

.Lekey_done:
	jr	$31
	nop
.end	_mips_AES_set_encrypt_key

.globl	AES_set_encrypt_key
.ent	AES_set_encrypt_key
AES_set_encrypt_key:
	.frame	$29,32,$31
	.mask	3221225472,-4
	.set	noreorder
	sub $29,32
	sw	$31,32-1*4($29)
	sw	$30,32-2*4($29)
	.cplocal	$7
	.cpsetup	$25,$0,AES_set_encrypt_key
	.set	reorder
	la	$7,AES_Te		# PIC-ified 'load address'

	bal	_mips_AES_set_encrypt_key

	.set	noreorder
	move	$4,$2
	lw	$31,32-1*4($29)
	lw	$30,32-2*4($29)
	jr	$31
	add $29,32
.end	AES_set_encrypt_key
.align	5
.globl	AES_set_decrypt_key
.ent	AES_set_decrypt_key
AES_set_decrypt_key:
	.frame	$29,32,$31
	.mask	3221225472,-4
	.set	noreorder
	sub $29,32
	sw	$31,32-1*4($29)
	sw	$30,32-2*4($29)
	.cplocal	$7
	.cpsetup	$25,$0,AES_set_decrypt_key
	.set	reorder
	la	$7,AES_Te		# PIC-ified 'load address'

	bal	_mips_AES_set_encrypt_key

	bltz	$2,.Ldkey_done

	sll	$1,$30,4
	add $4,$6,0
	add $5,$6,$1
.align	4
.Lswap:
	lw	$8,0($4)
	lw	$9,4($4)
	lw	$10,8($4)
	lw	$11,12($4)
	lw	$12,0($5)
	lw	$13,4($5)
	lw	$14,8($5)
	lw	$15,12($5)
	sw	$8,0($5)
	sw	$9,4($5)
	sw	$10,8($5)
	sw	$11,12($5)
	add $4,16
	sub $5,16
	sw	$12,-16($4)
	sw	$13,-12($4)
	sw	$14,-8($4)
	sw	$15,-4($4)
	bne	$4,$5,.Lswap

	lw	$8,16($6)		# modulo-scheduled
	lui	$2,0x8080
	sub	$30,1
	or	$2,0x8080
	sll	$30,2
	add $6,16
	lui	$25,0x1b1b
	nor	$24,$0,$2
	or	$25,0x1b1b
.align	4
.Lmix:
	and	$1,$8,$2
	and	$9,$8,$24
	srl	$10,$1,7
	addu	$9,$9		# tp2<<1
	subu	$1,$10
	and	$1,$25
	xor	$9,$1

	and	$1,$9,$2
	and	$10,$9,$24
	srl	$11,$1,7
	addu	$10,$10		# tp4<<1
	subu	$1,$11
	and	$1,$25
	xor	$10,$1

	and	$1,$10,$2
	and	$11,$10,$24
	srl	$12,$1,7
	addu	$11,$11		# tp8<<1
	subu	$1,$12
	and	$1,$25
	xor	$11,$1

	xor	$12,$11,$8
	xor	$15,$11,$10
	xor	$13,$12,$9
	xor	$14,$12,$10

	sll	$8,$14,16
	 xor	$15,$9
	srl	$9,$14,16
	xor	$15,$8
	sll	$8,$12,8
	xor	$15,$9
	srl	$9,$12,24
	xor	$15,$8
	sll	$8,$13,24
	xor	$15,$9
	srl	$9,$13,8
	xor	$15,$8
	lw	$8,4($6)		# modulo-scheduled
	xor	$15,$9
	sub	$30,1
	sw	$15,0($6)
	add $6,4
	bnez	$30,.Lmix

	li	$2,0
.Ldkey_done:
	.set	noreorder
	move	$4,$2
	lw	$31,32-1*4($29)
	lw	$30,32-2*4($29)
	jr	$31
	add $29,32
.end	AES_set_decrypt_key
.rdata
.align	6
AES_Te:
.byte	0xc6,0x63,0x63,0xa5,	0xf8,0x7c,0x7c,0x84	# Te0
.byte	0xee,0x77,0x77,0x99,	0xf6,0x7b,0x7b,0x8d
.byte	0xff,0xf2,0xf2,0x0d,	0xd6,0x6b,0x6b,0xbd
.byte	0xde,0x6f,0x6f,0xb1,	0x91,0xc5,0xc5,0x54
.byte	0x60,0x30,0x30,0x50,	0x02,0x01,0x01,0x03
.byte	0xce,0x67,0x67,0xa9,	0x56,0x2b,0x2b,0x7d
.byte	0xe7,0xfe,0xfe,0x19,	0xb5,0xd7,0xd7,0x62
.byte	0x4d,0xab,0xab,0xe6,	0xec,0x76,0x76,0x9a
.byte	0x8f,0xca,0xca,0x45,	0x1f,0x82,0x82,0x9d
.byte	0x89,0xc9,0xc9,0x40,	0xfa,0x7d,0x7d,0x87
.byte	0xef,0xfa,0xfa,0x15,	0xb2,0x59,0x59,0xeb
.byte	0x8e,0x47,0x47,0xc9,	0xfb,0xf0,0xf0,0x0b
.byte	0x41,0xad,0xad,0xec,	0xb3,0xd4,0xd4,0x67
.byte	0x5f,0xa2,0xa2,0xfd,	0x45,0xaf,0xaf,0xea
.byte	0x23,0x9c,0x9c,0xbf,	0x53,0xa4,0xa4,0xf7
.byte	0xe4,0x72,0x72,0x96,	0x9b,0xc0,0xc0,0x5b
.byte	0x75,0xb7,0xb7,0xc2,	0xe1,0xfd,0xfd,0x1c
.byte	0x3d,0x93,0x93,0xae,	0x4c,0x26,0x26,0x6a
.byte	0x6c,0x36,0x36,0x5a,	0x7e,0x3f,0x3f,0x41
.byte	0xf5,0xf7,0xf7,0x02,	0x83,0xcc,0xcc,0x4f
.byte	0x68,0x34,0x34,0x5c,	0x51,0xa5,0xa5,0xf4
.byte	0xd1,0xe5,0xe5,0x34,	0xf9,0xf1,0xf1,0x08
.byte	0xe2,0x71,0x71,0x93,	0xab,0xd8,0xd8,0x73
.byte	0x62,0x31,0x31,0x53,	0x2a,0x15,0x15,0x3f
.byte	0x08,0x04,0x04,0x0c,	0x95,0xc7,0xc7,0x52
.byte	0x46,0x23,0x23,0x65,	0x9d,0xc3,0xc3,0x5e
.byte	0x30,0x18,0x18,0x28,	0x37,0x96,0x96,0xa1
.byte	0x0a,0x05,0x05,0x0f,	0x2f,0x9a,0x9a,0xb5
.byte	0x0e,0x07,0x07,0x09,	0x24,0x12,0x12,0x36
.byte	0x1b,0x80,0x80,0x9b,	0xdf,0xe2,0xe2,0x3d
.byte	0xcd,0xeb,0xeb,0x26,	0x4e,0x27,0x27,0x69
.byte	0x7f,0xb2,0xb2,0xcd,	0xea,0x75,0x75,0x9f
.byte	0x12,0x09,0x09,0x1b,	0x1d,0x83,0x83,0x9e
.byte	0x58,0x2c,0x2c,0x74,	0x34,0x1a,0x1a,0x2e
.byte	0x36,0x1b,0x1b,0x2d,	0xdc,0x6e,0x6e,0xb2
.byte	0xb4,0x5a,0x5a,0xee,	0x5b,0xa0,0xa0,0xfb
.byte	0xa4,0x52,0x52,0xf6,	0x76,0x3b,0x3b,0x4d
.byte	0xb7,0xd6,0xd6,0x61,	0x7d,0xb3,0xb3,0xce
.byte	0x52,0x29,0x29,0x7b,	0xdd,0xe3,0xe3,0x3e
.byte	0x5e,0x2f,0x2f,0x71,	0x13,0x84,0x84,0x97
.byte	0xa6,0x53,0x53,0xf5,	0xb9,0xd1,0xd1,0x68
.byte	0x00,0x00,0x00,0x00,	0xc1,0xed,0xed,0x2c
.byte	0x40,0x20,0x20,0x60,	0xe3,0xfc,0xfc,0x1f
.byte	0x79,0xb1,0xb1,0xc8,	0xb6,0x5b,0x5b,0xed
.byte	0xd4,0x6a,0x6a,0xbe,	0x8d,0xcb,0xcb,0x46
.byte	0x67,0xbe,0xbe,0xd9,	0x72,0x39,0x39,0x4b
.byte	0x94,0x4a,0x4a,0xde,	0x98,0x4c,0x4c,0xd4
.byte	0xb0,0x58,0x58,0xe8,	0x85,0xcf,0xcf,0x4a
.byte	0xbb,0xd0,0xd0,0x6b,	0xc5,0xef,0xef,0x2a
.byte	0x4f,0xaa,0xaa,0xe5,	0xed,0xfb,0xfb,0x16
.byte	0x86,0x43,0x43,0xc5,	0x9a,0x4d,0x4d,0xd7
.byte	0x66,0x33,0x33,0x55,	0x11,0x85,0x85,0x94
.byte	0x8a,0x45,0x45,0xcf,	0xe9,0xf9,0xf9,0x10
.byte	0x04,0x02,0x02,0x06,	0xfe,0x7f,0x7f,0x81
.byte	0xa0,0x50,0x50,0xf0,	0x78,0x3c,0x3c,0x44
.byte	0x25,0x9f,0x9f,0xba,	0x4b,0xa8,0xa8,0xe3
.byte	0xa2,0x51,0x51,0xf3,	0x5d,0xa3,0xa3,0xfe
.byte	0x80,0x40,0x40,0xc0,	0x05,0x8f,0x8f,0x8a
.byte	0x3f,0x92,0x92,0xad,	0x21,0x9d,0x9d,0xbc
.byte	0x70,0x38,0x38,0x48,	0xf1,0xf5,0xf5,0x04
.byte	0x63,0xbc,0xbc,0xdf,	0x77,0xb6,0xb6,0xc1
.byte	0xaf,0xda,0xda,0x75,	0x42,0x21,0x21,0x63
.byte	0x20,0x10,0x10,0x30,	0xe5,0xff,0xff,0x1a
.byte	0xfd,0xf3,0xf3,0x0e,	0xbf,0xd2,0xd2,0x6d
.byte	0x81,0xcd,0xcd,0x4c,	0x18,0x0c,0x0c,0x14
.byte	0x26,0x13,0x13,0x35,	0xc3,0xec,0xec,0x2f
.byte	0xbe,0x5f,0x5f,0xe1,	0x35,0x97,0x97,0xa2
.byte	0x88,0x44,0x44,0xcc,	0x2e,0x17,0x17,0x39
.byte	0x93,0xc4,0xc4,0x57,	0x55,0xa7,0xa7,0xf2
.byte	0xfc,0x7e,0x7e,0x82,	0x7a,0x3d,0x3d,0x47
.byte	0xc8,0x64,0x64,0xac,	0xba,0x5d,0x5d,0xe7
.byte	0x32,0x19,0x19,0x2b,	0xe6,0x73,0x73,0x95
.byte	0xc0,0x60,0x60,0xa0,	0x19,0x81,0x81,0x98
.byte	0x9e,0x4f,0x4f,0xd1,	0xa3,0xdc,0xdc,0x7f
.byte	0x44,0x22,0x22,0x66,	0x54,0x2a,0x2a,0x7e
.byte	0x3b,0x90,0x90,0xab,	0x0b,0x88,0x88,0x83
.byte	0x8c,0x46,0x46,0xca,	0xc7,0xee,0xee,0x29
.byte	0x6b,0xb8,0xb8,0xd3,	0x28,0x14,0x14,0x3c
.byte	0xa7,0xde,0xde,0x79,	0xbc,0x5e,0x5e,0xe2
.byte	0x16,0x0b,0x0b,0x1d,	0xad,0xdb,0xdb,0x76
.byte	0xdb,0xe0,0xe0,0x3b,	0x64,0x32,0x32,0x56
.byte	0x74,0x3a,0x3a,0x4e,	0x14,0x0a,0x0a,0x1e
.byte	0x92,0x49,0x49,0xdb,	0x0c,0x06,0x06,0x0a
.byte	0x48,0x24,0x24,0x6c,	0xb8,0x5c,0x5c,0xe4
.byte	0x9f,0xc2,0xc2,0x5d,	0xbd,0xd3,0xd3,0x6e
.byte	0x43,0xac,0xac,0xef,	0xc4,0x62,0x62,0xa6
.byte	0x39,0x91,0x91,0xa8,	0x31,0x95,0x95,0xa4
.byte	0xd3,0xe4,0xe4,0x37,	0xf2,0x79,0x79,0x8b
.byte	0xd5,0xe7,0xe7,0x32,	0x8b,0xc8,0xc8,0x43
.byte	0x6e,0x37,0x37,0x59,	0xda,0x6d,0x6d,0xb7
.byte	0x01,0x8d,0x8d,0x8c,	0xb1,0xd5,0xd5,0x64
.byte	0x9c,0x4e,0x4e,0xd2,	0x49,0xa9,0xa9,0xe0
.byte	0xd8,0x6c,0x6c,0xb4,	0xac,0x56,0x56,0xfa
.byte	0xf3,0xf4,0xf4,0x07,	0xcf,0xea,0xea,0x25
.byte	0xca,0x65,0x65,0xaf,	0xf4,0x7a,0x7a,0x8e
.byte	0x47,0xae,0xae,0xe9,	0x10,0x08,0x08,0x18
.byte	0x6f,0xba,0xba,0xd5,	0xf0,0x78,0x78,0x88
.byte	0x4a,0x25,0x25,0x6f,	0x5c,0x2e,0x2e,0x72
.byte	0x38,0x1c,0x1c,0x24,	0x57,0xa6,0xa6,0xf1
.byte	0x73,0xb4,0xb4,0xc7,	0x97,0xc6,0xc6,0x51
.byte	0xcb,0xe8,0xe8,0x23,	0xa1,0xdd,0xdd,0x7c
.byte	0xe8,0x74,0x74,0x9c,	0x3e,0x1f,0x1f,0x21
.byte	0x96,0x4b,0x4b,0xdd,	0x61,0xbd,0xbd,0xdc
.byte	0x0d,0x8b,0x8b,0x86,	0x0f,0x8a,0x8a,0x85
.byte	0xe0,0x70,0x70,0x90,	0x7c,0x3e,0x3e,0x42
.byte	0x71,0xb5,0xb5,0xc4,	0xcc,0x66,0x66,0xaa
.byte	0x90,0x48,0x48,0xd8,	0x06,0x03,0x03,0x05
.byte	0xf7,0xf6,0xf6,0x01,	0x1c,0x0e,0x0e,0x12
.byte	0xc2,0x61,0x61,0xa3,	0x6a,0x35,0x35,0x5f
.byte	0xae,0x57,0x57,0xf9,	0x69,0xb9,0xb9,0xd0
.byte	0x17,0x86,0x86,0x91,	0x99,0xc1,0xc1,0x58
.byte	0x3a,0x1d,0x1d,0x27,	0x27,0x9e,0x9e,0xb9
.byte	0xd9,0xe1,0xe1,0x38,	0xeb,0xf8,0xf8,0x13
.byte	0x2b,0x98,0x98,0xb3,	0x22,0x11,0x11,0x33
.byte	0xd2,0x69,0x69,0xbb,	0xa9,0xd9,0xd9,0x70
.byte	0x07,0x8e,0x8e,0x89,	0x33,0x94,0x94,0xa7
.byte	0x2d,0x9b,0x9b,0xb6,	0x3c,0x1e,0x1e,0x22
.byte	0x15,0x87,0x87,0x92,	0xc9,0xe9,0xe9,0x20
.byte	0x87,0xce,0xce,0x49,	0xaa,0x55,0x55,0xff
.byte	0x50,0x28,0x28,0x78,	0xa5,0xdf,0xdf,0x7a
.byte	0x03,0x8c,0x8c,0x8f,	0x59,0xa1,0xa1,0xf8
.byte	0x09,0x89,0x89,0x80,	0x1a,0x0d,0x0d,0x17
.byte	0x65,0xbf,0xbf,0xda,	0xd7,0xe6,0xe6,0x31
.byte	0x84,0x42,0x42,0xc6,	0xd0,0x68,0x68,0xb8
.byte	0x82,0x41,0x41,0xc3,	0x29,0x99,0x99,0xb0
.byte	0x5a,0x2d,0x2d,0x77,	0x1e,0x0f,0x0f,0x11
.byte	0x7b,0xb0,0xb0,0xcb,	0xa8,0x54,0x54,0xfc
.byte	0x6d,0xbb,0xbb,0xd6,	0x2c,0x16,0x16,0x3a

.byte	0x63, 0x7c, 0x77, 0x7b, 0xf2, 0x6b, 0x6f, 0xc5	# Te4
.byte	0x30, 0x01, 0x67, 0x2b, 0xfe, 0xd7, 0xab, 0x76
.byte	0xca, 0x82, 0xc9, 0x7d, 0xfa, 0x59, 0x47, 0xf0
.byte	0xad, 0xd4, 0xa2, 0xaf, 0x9c, 0xa4, 0x72, 0xc0
.byte	0xb7, 0xfd, 0x93, 0x26, 0x36, 0x3f, 0xf7, 0xcc
.byte	0x34, 0xa5, 0xe5, 0xf1, 0x71, 0xd8, 0x31, 0x15
.byte	0x04, 0xc7, 0x23, 0xc3, 0x18, 0x96, 0x05, 0x9a
.byte	0x07, 0x12, 0x80, 0xe2, 0xeb, 0x27, 0xb2, 0x75
.byte	0x09, 0x83, 0x2c, 0x1a, 0x1b, 0x6e, 0x5a, 0xa0
.byte	0x52, 0x3b, 0xd6, 0xb3, 0x29, 0xe3, 0x2f, 0x84
.byte	0x53, 0xd1, 0x00, 0xed, 0x20, 0xfc, 0xb1, 0x5b
.byte	0x6a, 0xcb, 0xbe, 0x39, 0x4a, 0x4c, 0x58, 0xcf
.byte	0xd0, 0xef, 0xaa, 0xfb, 0x43, 0x4d, 0x33, 0x85
.byte	0x45, 0xf9, 0x02, 0x7f, 0x50, 0x3c, 0x9f, 0xa8
.byte	0x51, 0xa3, 0x40, 0x8f, 0x92, 0x9d, 0x38, 0xf5
.byte	0xbc, 0xb6, 0xda, 0x21, 0x10, 0xff, 0xf3, 0xd2
.byte	0xcd, 0x0c, 0x13, 0xec, 0x5f, 0x97, 0x44, 0x17
.byte	0xc4, 0xa7, 0x7e, 0x3d, 0x64, 0x5d, 0x19, 0x73
.byte	0x60, 0x81, 0x4f, 0xdc, 0x22, 0x2a, 0x90, 0x88
.byte	0x46, 0xee, 0xb8, 0x14, 0xde, 0x5e, 0x0b, 0xdb
.byte	0xe0, 0x32, 0x3a, 0x0a, 0x49, 0x06, 0x24, 0x5c
.byte	0xc2, 0xd3, 0xac, 0x62, 0x91, 0x95, 0xe4, 0x79
.byte	0xe7, 0xc8, 0x37, 0x6d, 0x8d, 0xd5, 0x4e, 0xa9
.byte	0x6c, 0x56, 0xf4, 0xea, 0x65, 0x7a, 0xae, 0x08
.byte	0xba, 0x78, 0x25, 0x2e, 0x1c, 0xa6, 0xb4, 0xc6
.byte	0xe8, 0xdd, 0x74, 0x1f, 0x4b, 0xbd, 0x8b, 0x8a
.byte	0x70, 0x3e, 0xb5, 0x66, 0x48, 0x03, 0xf6, 0x0e
.byte	0x61, 0x35, 0x57, 0xb9, 0x86, 0xc1, 0x1d, 0x9e
.byte	0xe1, 0xf8, 0x98, 0x11, 0x69, 0xd9, 0x8e, 0x94
.byte	0x9b, 0x1e, 0x87, 0xe9, 0xce, 0x55, 0x28, 0xdf
.byte	0x8c, 0xa1, 0x89, 0x0d, 0xbf, 0xe6, 0x42, 0x68
.byte	0x41, 0x99, 0x2d, 0x0f, 0xb0, 0x54, 0xbb, 0x16

.byte	0x01,0x00,0x00,0x00,	0x02,0x00,0x00,0x00	# rcon
.byte	0x04,0x00,0x00,0x00,	0x08,0x00,0x00,0x00
.byte	0x10,0x00,0x00,0x00,	0x20,0x00,0x00,0x00
.byte	0x40,0x00,0x00,0x00,	0x80,0x00,0x00,0x00
.byte	0x1B,0x00,0x00,0x00,	0x36,0x00,0x00,0x00

.align	6
AES_Td:
.byte	0x51,0xf4,0xa7,0x50,	0x7e,0x41,0x65,0x53	# Td0
.byte	0x1a,0x17,0xa4,0xc3,	0x3a,0x27,0x5e,0x96
.byte	0x3b,0xab,0x6b,0xcb,	0x1f,0x9d,0x45,0xf1
.byte	0xac,0xfa,0x58,0xab,	0x4b,0xe3,0x03,0x93
.byte	0x20,0x30,0xfa,0x55,	0xad,0x76,0x6d,0xf6
.byte	0x88,0xcc,0x76,0x91,	0xf5,0x02,0x4c,0x25
.byte	0x4f,0xe5,0xd7,0xfc,	0xc5,0x2a,0xcb,0xd7
.byte	0x26,0x35,0x44,0x80,	0xb5,0x62,0xa3,0x8f
.byte	0xde,0xb1,0x5a,0x49,	0x25,0xba,0x1b,0x67
.byte	0x45,0xea,0x0e,0x98,	0x5d,0xfe,0xc0,0xe1
.byte	0xc3,0x2f,0x75,0x02,	0x81,0x4c,0xf0,0x12
.byte	0x8d,0x46,0x97,0xa3,	0x6b,0xd3,0xf9,0xc6
.byte	0x03,0x8f,0x5f,0xe7,	0x15,0x92,0x9c,0x95
.byte	0xbf,0x6d,0x7a,0xeb,	0x95,0x52,0x59,0xda
.byte	0xd4,0xbe,0x83,0x2d,	0x58,0x74,0x21,0xd3
.byte	0x49,0xe0,0x69,0x29,	0x8e,0xc9,0xc8,0x44
.byte	0x75,0xc2,0x89,0x6a,	0xf4,0x8e,0x79,0x78
.byte	0x99,0x58,0x3e,0x6b,	0x27,0xb9,0x71,0xdd
.byte	0xbe,0xe1,0x4f,0xb6,	0xf0,0x88,0xad,0x17
.byte	0xc9,0x20,0xac,0x66,	0x7d,0xce,0x3a,0xb4
.byte	0x63,0xdf,0x4a,0x18,	0xe5,0x1a,0x31,0x82
.byte	0x97,0x51,0x33,0x60,	0x62,0x53,0x7f,0x45
.byte	0xb1,0x64,0x77,0xe0,	0xbb,0x6b,0xae,0x84
.byte	0xfe,0x81,0xa0,0x1c,	0xf9,0x08,0x2b,0x94
.byte	0x70,0x48,0x68,0x58,	0x8f,0x45,0xfd,0x19
.byte	0x94,0xde,0x6c,0x87,	0x52,0x7b,0xf8,0xb7
.byte	0xab,0x73,0xd3,0x23,	0x72,0x4b,0x02,0xe2
.byte	0xe3,0x1f,0x8f,0x57,	0x66,0x55,0xab,0x2a
.byte	0xb2,0xeb,0x28,0x07,	0x2f,0xb5,0xc2,0x03
.byte	0x86,0xc5,0x7b,0x9a,	0xd3,0x37,0x08,0xa5
.byte	0x30,0x28,0x87,0xf2,	0x23,0xbf,0xa5,0xb2
.byte	0x02,0x03,0x6a,0xba,	0xed,0x16,0x82,0x5c
.byte	0x8a,0xcf,0x1c,0x2b,	0xa7,0x79,0xb4,0x92
.byte	0xf3,0x07,0xf2,0xf0,	0x4e,0x69,0xe2,0xa1
.byte	0x65,0xda,0xf4,0xcd,	0x06,0x05,0xbe,0xd5
.byte	0xd1,0x34,0x62,0x1f,	0xc4,0xa6,0xfe,0x8a
.byte	0x34,0x2e,0x53,0x9d,	0xa2,0xf3,0x55,0xa0
.byte	0x05,0x8a,0xe1,0x32,	0xa4,0xf6,0xeb,0x75
.byte	0x0b,0x83,0xec,0x39,	0x40,0x60,0xef,0xaa
.byte	0x5e,0x71,0x9f,0x06,	0xbd,0x6e,0x10,0x51
.byte	0x3e,0x21,0x8a,0xf9,	0x96,0xdd,0x06,0x3d
.byte	0xdd,0x3e,0x05,0xae,	0x4d,0xe6,0xbd,0x46
.byte	0x91,0x54,0x8d,0xb5,	0x71,0xc4,0x5d,0x05
.byte	0x04,0x06,0xd4,0x6f,	0x60,0x50,0x15,0xff
.byte	0x19,0x98,0xfb,0x24,	0xd6,0xbd,0xe9,0x97
.byte	0x89,0x40,0x43,0xcc,	0x67,0xd9,0x9e,0x77
.byte	0xb0,0xe8,0x42,0xbd,	0x07,0x89,0x8b,0x88
.byte	0xe7,0x19,0x5b,0x38,	0x79,0xc8,0xee,0xdb
.byte	0xa1,0x7c,0x0a,0x47,	0x7c,0x42,0x0f,0xe9
.byte	0xf8,0x84,0x1e,0xc9,	0x00,0x00,0x00,0x00
.byte	0x09,0x80,0x86,0x83,	0x32,0x2b,0xed,0x48
.byte	0x1e,0x11,0x70,0xac,	0x6c,0x5a,0x72,0x4e
.byte	0xfd,0x0e,0xff,0xfb,	0x0f,0x85,0x38,0x56
.byte	0x3d,0xae,0xd5,0x1e,	0x36,0x2d,0x39,0x27
.byte	0x0a,0x0f,0xd9,0x64,	0x68,0x5c,0xa6,0x21
.byte	0x9b,0x5b,0x54,0xd1,	0x24,0x36,0x2e,0x3a
.byte	0x0c,0x0a,0x67,0xb1,	0x93,0x57,0xe7,0x0f
.byte	0xb4,0xee,0x96,0xd2,	0x1b,0x9b,0x91,0x9e
.byte	0x80,0xc0,0xc5,0x4f,	0x61,0xdc,0x20,0xa2
.byte	0x5a,0x77,0x4b,0x69,	0x1c,0x12,0x1a,0x16
.byte	0xe2,0x93,0xba,0x0a,	0xc0,0xa0,0x2a,0xe5
.byte	0x3c,0x22,0xe0,0x43,	0x12,0x1b,0x17,0x1d
.byte	0x0e,0x09,0x0d,0x0b,	0xf2,0x8b,0xc7,0xad
.byte	0x2d,0xb6,0xa8,0xb9,	0x14,0x1e,0xa9,0xc8
.byte	0x57,0xf1,0x19,0x85,	0xaf,0x75,0x07,0x4c
.byte	0xee,0x99,0xdd,0xbb,	0xa3,0x7f,0x60,0xfd
.byte	0xf7,0x01,0x26,0x9f,	0x5c,0x72,0xf5,0xbc
.byte	0x44,0x66,0x3b,0xc5,	0x5b,0xfb,0x7e,0x34
.byte	0x8b,0x43,0x29,0x76,	0xcb,0x23,0xc6,0xdc
.byte	0xb6,0xed,0xfc,0x68,	0xb8,0xe4,0xf1,0x63
.byte	0xd7,0x31,0xdc,0xca,	0x42,0x63,0x85,0x10
.byte	0x13,0x97,0x22,0x40,	0x84,0xc6,0x11,0x20
.byte	0x85,0x4a,0x24,0x7d,	0xd2,0xbb,0x3d,0xf8
.byte	0xae,0xf9,0x32,0x11,	0xc7,0x29,0xa1,0x6d
.byte	0x1d,0x9e,0x2f,0x4b,	0xdc,0xb2,0x30,0xf3
.byte	0x0d,0x86,0x52,0xec,	0x77,0xc1,0xe3,0xd0
.byte	0x2b,0xb3,0x16,0x6c,	0xa9,0x70,0xb9,0x99
.byte	0x11,0x94,0x48,0xfa,	0x47,0xe9,0x64,0x22
.byte	0xa8,0xfc,0x8c,0xc4,	0xa0,0xf0,0x3f,0x1a
.byte	0x56,0x7d,0x2c,0xd8,	0x22,0x33,0x90,0xef
.byte	0x87,0x49,0x4e,0xc7,	0xd9,0x38,0xd1,0xc1
.byte	0x8c,0xca,0xa2,0xfe,	0x98,0xd4,0x0b,0x36
.byte	0xa6,0xf5,0x81,0xcf,	0xa5,0x7a,0xde,0x28
.byte	0xda,0xb7,0x8e,0x26,	0x3f,0xad,0xbf,0xa4
.byte	0x2c,0x3a,0x9d,0xe4,	0x50,0x78,0x92,0x0d
.byte	0x6a,0x5f,0xcc,0x9b,	0x54,0x7e,0x46,0x62
.byte	0xf6,0x8d,0x13,0xc2,	0x90,0xd8,0xb8,0xe8
.byte	0x2e,0x39,0xf7,0x5e,	0x82,0xc3,0xaf,0xf5
.byte	0x9f,0x5d,0x80,0xbe,	0x69,0xd0,0x93,0x7c
.byte	0x6f,0xd5,0x2d,0xa9,	0xcf,0x25,0x12,0xb3
.byte	0xc8,0xac,0x99,0x3b,	0x10,0x18,0x7d,0xa7
.byte	0xe8,0x9c,0x63,0x6e,	0xdb,0x3b,0xbb,0x7b
.byte	0xcd,0x26,0x78,0x09,	0x6e,0x59,0x18,0xf4
.byte	0xec,0x9a,0xb7,0x01,	0x83,0x4f,0x9a,0xa8
.byte	0xe6,0x95,0x6e,0x65,	0xaa,0xff,0xe6,0x7e
.byte	0x21,0xbc,0xcf,0x08,	0xef,0x15,0xe8,0xe6
.byte	0xba,0xe7,0x9b,0xd9,	0x4a,0x6f,0x36,0xce
.byte	0xea,0x9f,0x09,0xd4,	0x29,0xb0,0x7c,0xd6
.byte	0x31,0xa4,0xb2,0xaf,	0x2a,0x3f,0x23,0x31
.byte	0xc6,0xa5,0x94,0x30,	0x35,0xa2,0x66,0xc0
.byte	0x74,0x4e,0xbc,0x37,	0xfc,0x82,0xca,0xa6
.byte	0xe0,0x90,0xd0,0xb0,	0x33,0xa7,0xd8,0x15
.byte	0xf1,0x04,0x98,0x4a,	0x41,0xec,0xda,0xf7
.byte	0x7f,0xcd,0x50,0x0e,	0x17,0x91,0xf6,0x2f
.byte	0x76,0x4d,0xd6,0x8d,	0x43,0xef,0xb0,0x4d
.byte	0xcc,0xaa,0x4d,0x54,	0xe4,0x96,0x04,0xdf
.byte	0x9e,0xd1,0xb5,0xe3,	0x4c,0x6a,0x88,0x1b
.byte	0xc1,0x2c,0x1f,0xb8,	0x46,0x65,0x51,0x7f
.byte	0x9d,0x5e,0xea,0x04,	0x01,0x8c,0x35,0x5d
.byte	0xfa,0x87,0x74,0x73,	0xfb,0x0b,0x41,0x2e
.byte	0xb3,0x67,0x1d,0x5a,	0x92,0xdb,0xd2,0x52
.byte	0xe9,0x10,0x56,0x33,	0x6d,0xd6,0x47,0x13
.byte	0x9a,0xd7,0x61,0x8c,	0x37,0xa1,0x0c,0x7a
.byte	0x59,0xf8,0x14,0x8e,	0xeb,0x13,0x3c,0x89
.byte	0xce,0xa9,0x27,0xee,	0xb7,0x61,0xc9,0x35
.byte	0xe1,0x1c,0xe5,0xed,	0x7a,0x47,0xb1,0x3c
.byte	0x9c,0xd2,0xdf,0x59,	0x55,0xf2,0x73,0x3f
.byte	0x18,0x14,0xce,0x79,	0x73,0xc7,0x37,0xbf
.byte	0x53,0xf7,0xcd,0xea,	0x5f,0xfd,0xaa,0x5b
.byte	0xdf,0x3d,0x6f,0x14,	0x78,0x44,0xdb,0x86
.byte	0xca,0xaf,0xf3,0x81,	0xb9,0x68,0xc4,0x3e
.byte	0x38,0x24,0x34,0x2c,	0xc2,0xa3,0x40,0x5f
.byte	0x16,0x1d,0xc3,0x72,	0xbc,0xe2,0x25,0x0c
.byte	0x28,0x3c,0x49,0x8b,	0xff,0x0d,0x95,0x41
.byte	0x39,0xa8,0x01,0x71,	0x08,0x0c,0xb3,0xde
.byte	0xd8,0xb4,0xe4,0x9c,	0x64,0x56,0xc1,0x90
.byte	0x7b,0xcb,0x84,0x61,	0xd5,0x32,0xb6,0x70
.byte	0x48,0x6c,0x5c,0x74,	0xd0,0xb8,0x57,0x42

.byte	0x52, 0x09, 0x6a, 0xd5, 0x30, 0x36, 0xa5, 0x38	# Td4
.byte	0xbf, 0x40, 0xa3, 0x9e, 0x81, 0xf3, 0xd7, 0xfb
.byte	0x7c, 0xe3, 0x39, 0x82, 0x9b, 0x2f, 0xff, 0x87
.byte	0x34, 0x8e, 0x43, 0x44, 0xc4, 0xde, 0xe9, 0xcb
.byte	0x54, 0x7b, 0x94, 0x32, 0xa6, 0xc2, 0x23, 0x3d
.byte	0xee, 0x4c, 0x95, 0x0b, 0x42, 0xfa, 0xc3, 0x4e
.byte	0x08, 0x2e, 0xa1, 0x66, 0x28, 0xd9, 0x24, 0xb2
.byte	0x76, 0x5b, 0xa2, 0x49, 0x6d, 0x8b, 0xd1, 0x25
.byte	0x72, 0xf8, 0xf6, 0x64, 0x86, 0x68, 0x98, 0x16
.byte	0xd4, 0xa4, 0x5c, 0xcc, 0x5d, 0x65, 0xb6, 0x92
.byte	0x6c, 0x70, 0x48, 0x50, 0xfd, 0xed, 0xb9, 0xda
.byte	0x5e, 0x15, 0x46, 0x57, 0xa7, 0x8d, 0x9d, 0x84
.byte	0x90, 0xd8, 0xab, 0x00, 0x8c, 0xbc, 0xd3, 0x0a
.byte	0xf7, 0xe4, 0x58, 0x05, 0xb8, 0xb3, 0x45, 0x06
.byte	0xd0, 0x2c, 0x1e, 0x8f, 0xca, 0x3f, 0x0f, 0x02
.byte	0xc1, 0xaf, 0xbd, 0x03, 0x01, 0x13, 0x8a, 0x6b
.byte	0x3a, 0x91, 0x11, 0x41, 0x4f, 0x67, 0xdc, 0xea
.byte	0x97, 0xf2, 0xcf, 0xce, 0xf0, 0xb4, 0xe6, 0x73
.byte	0x96, 0xac, 0x74, 0x22, 0xe7, 0xad, 0x35, 0x85
.byte	0xe2, 0xf9, 0x37, 0xe8, 0x1c, 0x75, 0xdf, 0x6e
.byte	0x47, 0xf1, 0x1a, 0x71, 0x1d, 0x29, 0xc5, 0x89
.byte	0x6f, 0xb7, 0x62, 0x0e, 0xaa, 0x18, 0xbe, 0x1b
.byte	0xfc, 0x56, 0x3e, 0x4b, 0xc6, 0xd2, 0x79, 0x20
.byte	0x9a, 0xdb, 0xc0, 0xfe, 0x78, 0xcd, 0x5a, 0xf4
.byte	0x1f, 0xdd, 0xa8, 0x33, 0x88, 0x07, 0xc7, 0x31
.byte	0xb1, 0x12, 0x10, 0x59, 0x27, 0x80, 0xec, 0x5f
.byte	0x60, 0x51, 0x7f, 0xa9, 0x19, 0xb5, 0x4a, 0x0d
.byte	0x2d, 0xe5, 0x7a, 0x9f, 0x93, 0xc9, 0x9c, 0xef
.byte	0xa0, 0xe0, 0x3b, 0x4d, 0xae, 0x2a, 0xf5, 0xb0
.byte	0xc8, 0xeb, 0xbb, 0x3c, 0x83, 0x53, 0x99, 0x61
.byte	0x17, 0x2b, 0x04, 0x7e, 0xba, 0x77, 0xd6, 0x26
.byte	0xe1, 0x69, 0x14, 0x63, 0x55, 0x21, 0x0c, 0x7d
