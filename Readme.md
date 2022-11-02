# EndlessPatch rev3
Code patch for Rhythm Heaven Megamix (US) to allow saving to endless game scores from the conditional variable (aka condvar).

## DO NOT USE THIS WITHOUT RHMPATCH!!!
You can find it here: https://github.com/rhmodding/RHMPatch

## Building
1. Rename the original code.bin to original.bin.
2. Run armips on whichever endless.ips. Your patched code.bin will be made.
3. Apply RHMPatch, make an IPS, load on Luma or Citra!

## Using in Tickflow
1. Load your score into the condvar from wherever you're storing it
2. Use command `0xBF` (no arguments)
3. Done!