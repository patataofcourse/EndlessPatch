.arm.little
.open "original.bin", "code.bin", 0x100000

command     equ 0x35f7a8
function    equ 0x1cc7b0
r2_patch    equ 0x1cc7cc

; load condvar instead of endless score in CSceneRvlSword::SaveScore function
.org command
    ldreq r6, [r4, 0x20]
    bleq function

.org r2_patch
    mov r2, r6

.close