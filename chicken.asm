.arm.little
.open "original.bin", "code.bin", 0x100000

command     equ 0x165b04
function    equ 0x1ecc58
r2_patch    equ 0x1ecc74

; load condvar instead of endless score in CSceneCtrChicken::SaveScore function
.org command
    ldreq r6, [r4, 0x20]
    bleq function

.org r2_patch
    mov r2, r6

.close