.arm.little
.open "original.bin", "code.bin", 0x100000

command     equ 0x356a14
function    equ 0x1c3f58
r2_patch    equ 0x1c3f78

; load condvar instead of endless score in CSceneAgbVirus::SaveScore function
.org command
    ldreq r6, [r4, 0x20]
    bleq function

.org r2_patch
    mov r2, r6

.close