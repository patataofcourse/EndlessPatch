; EndlessPatch rev3 - unified version
;   shouldn't break vanilla games anymore, so it should be safe enough to add

.arm.little
.open "original.bin", "code.bin", 0x100000

; our own offsets
ENDLESS_tickPatch   equ 0x0025c3c0
ENDLESS_newCode     equ 0x00399b00 ; earliest it can theoretically be done is 00399adc

; vanilla game functions called
cmdreturn           equ 0x002613cc
getGateScore        equ 0x00261a6c
setGateScore        equ 0x002366c0
saveGame            equ 0x0028bf14

; structs / pointers
D_0054d350          equ 0x0054d350
D_0054ef10          equ 0x0054ef10
D_0054ef28          equ 0x0054ef28

.org ENDLESS_tickPatch
    b ENDLESS_cmd_BF

.org ENDLESS_newCode

ENDLESS_cmd_BF:
    cmp r1, #0xBF
    cmpeq r2, #0
    ldreq r0, [r4, #0x20]  ; this.condVar 
    bleq ENDLESS_saveScore
    b cmdreturn

; indexes for endless games
;  - 0x3 - Sick Beats
;  - 0x7 - Coin Toss
;  - 0xB - Clap Trap
;  - 0xF - Charging Chicken

ENDLESS_saveScore:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r5, =D_0054d350

    ; check current game
    ldr r0, =D_0054ef10
    ldr r0, [r0]
    ldrb r4, [r0, 0x4c] ; current gate slot?
    
    ; must fit format 0000XX11
    mvn r1, 0b1100
    and r1, r1, 0xFF
    and r1, r4, r1
    cmp r1, #3
    bne _001ecca0
    
    ; get saved score
    ldr r0, [r5]
    mov r1, r4
    mvn r2, #0      ; r2 = 0xFFFFFFFF
    bl getGateScore

    ; if the saved score is bigger or equal to the current score, don't save
    cmp r0, r6
    bge _001ecca0
    
    ; save condvar to score
    ldr r0, [r5]
    mov r1, r4
    mov r2, r6
    mvn r3, #0      ; r3 = 0xFFFFFFFF
    bl setGateScore

    ; save the game
    ldr r0, =D_0054ef28
    ldr r0, [r0]
    ldmia sp!, {r4, r5, r6, lr}
    b saveGame

_001ecca0:
    ldmia sp!, {r4, r5, r6, pc}

.close