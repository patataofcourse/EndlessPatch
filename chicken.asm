.arm.little
.open "original.bin", "code.bin", 0x100000

; load condvar instead of endless score in CSceneCtrChicken::SaveScore function
.org 0x1ecc74
    ldr r2, [r4, #0x20]

.close