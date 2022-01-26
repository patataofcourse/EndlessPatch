.arm.little
.open "original.bin", "code.bin", 0x100000

coinCmd equ 0x18215c
coinSaveScore equ 0x295ce4
coinGEq equ 0x295d30
coinCondvar equ 0x53ef54

getEndlessScore equ 0x261a6c
coinContinue equ 0x295d04

.org coinCmd
    ldr r1,[r4,#0x20]
    bl coinSaveScore

.org coinSaveScore
    stmdb sp!,{r4, r5, r6, r7, lr}
    mov r4,r0
    mov r7,r1
    ldr r5,[0x295d3c]
    mvn r2,#0x0
    mov r1,#0x7
    ldr r0,[r5,#0x0]
    b coinCondvar

.org coinGEq
    ldmia sp!, {r4, r5, r6, r7, lr}
    b 0x23663c
    ldmia sp!, {r4, r5, r6, r7, lr}

.org coinCondvar
    bl getEndlessScore
    mov r2, r7
    b coinContinue

.close