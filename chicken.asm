.arm.little
.open "original.bin", "code.bin", 0x100000

chickenCmd equ 0x165b04
chickenSaveScore equ 0x1ecc58
chickenGEq equ 0x1ecc98
chickenCondvar equ 0x399fd0

saveGame equ 0x28bf14
getEndlessScore equ 0x261a6c
chickenContinue equ 0x1ecc78

.org chickenCmd
    ldreq r1,[r4,#0x20]
    bleq chickenSaveScore

.org chickenSaveScore
    stmdb sp!,{r4, r5, r6, r9, lr}
    mov r4,r0
    mov r9,r1
    ldr r5,[0x1ecca4]
    mvn r2,#0x0
    mov r1,#0xf
    ldr r0,[r5,#0x0]
    b chickenCondvar

.org chickenGEq
    ldmia sp!, {r4, r5, r6, r9, lr}
    b saveGame
    ldmia sp!, {r4, r5, r6, r9, lr}

.org chickenCondvar
    bl getEndlessScore
    mov r2, r9
    b chickenContinue

.close