.arm.little
.open "original.bin", "code.bin", 0x100000

; load condvar instead of endless score in CSceneAgbVirus::SaveScore function
.org 0x1c3f74
    ldr r2, [r4, #0x20]

.close