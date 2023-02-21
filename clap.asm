.arm.little
.open "original.bin", "code.bin", 0x100000

; load condvar instead of endless score in CSceneRvlSword::SaveScore function
.org 0x1cc7cc
    ldr r2, [r4, #0x20]

.close