Cmd_BF:
    cmp r2, #0
    ldreq r0, [r4, #0x20]  ; this.condVar 
    bleq SaveScore
    b cmdreturn

SaveScore:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r5, =D_0054d350

    ; check current game
    ldr r0, =D_0054ef10
    ldr r0, [r0]
    ldrb r4, [r0, 0x4c] ; current gate slot?
    
    ; last two bits must be set, but not any other
    mvn r1, 0b1100
    and r1, r1, 0xFF
    and r1, r0, r1
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