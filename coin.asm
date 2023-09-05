.arm.little
.open "original.bin", "code.bin", 0x100000

command     equ 0x18715c
function    equ 0x295ce4
r2_patch    equ 0x295d00

; load condvar instead of endless score in CSceneNtrCoinToss::SaveScore function
.org command
    ldr r6, [r4, 0x20]
    bl function

.org r2_patch
    mov r2, r6

.close
