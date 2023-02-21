.arm.little
.open "original.bin", "code.bin", 0x100000

; load condvar instead of endless score in CSceneNtrCoinToss::SaveScore function
.org 0x295d00
    ldr r2, [r4, #0x20]

.close
