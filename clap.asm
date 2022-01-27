.arm.little
.open "original.bin", "code.bin", 0x100000

clapCmd equ 0x35f7a8
clapSaveScore equ 0x1cc7b0
clapGEq equ 0x1cc7f0
clapCondvar equ 0x399fdc

saveGame equ 0x28bf14
getEndlessScore equ 0x261a6c
clapContinue equ 0x1cc7d0

.org clapCmd
    ldr r1,[r4,#0x20]
    bl clapSaveScore

.org clapSaveScore
    stmdb sp!,{r4, r5, r6, r9, lr}
    mov r4,r0
    mov r9,r1
    ldr r5,[0x1cc7fc]
    mvn r2,#0x0
    mov r1,#0xb
    ldr r0,[r5,#0x0]
    b clapCondvar

.org clapGEq
    ldmia sp!, {r4, r5, r6, r9, lr}
    b saveGame
    ldmia sp!, {r4, r5, r6, r9, lr}

.org clapCondvar
    bl getEndlessScore
    mov r2, r9
    b clapContinue

.close