.arm.little
.open "original.bin", "code.bin", 0x100000

virusCmd equ 0x356a14
virusSaveScore equ 0x1c3f58
virusGEq equ 0x1c3f98
virusCondvar equ 0x399fe8

saveGame equ 0x28bf14
getEndlessScore equ 0x261a6c
virusContinue equ 0x1c3f78

.org virusCmd
    ldreq r1,[r4,#0x20]
    bleq virusSaveScore

.org virusSaveScore
    stmdb sp!, {r4, r5, r6, r9, lr}
    mov r4, r0
    mov r9, r1
    ldr r5, [0x1c3fa4]
    mvn r3, 0x0
    mov r1, 0x3
    ldr r0, [r5, 0x0]
    b virusCondvar

.org virusGEq
    ldmia sp!, {r4, r5, r6, r9, lr}
    b saveGame
    ldmia sp!, {r4, r5, r6, r9, lr}

.org virusCondvar
    bl getEndlessScore
    mov r2, r9
    b virusContinue

.close