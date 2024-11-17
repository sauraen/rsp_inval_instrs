# rsp_inval_instrs

N64 RSP invalid instructions test; checks the behavior of various invalid
instructions on real N64 hardware. libdragon based, does not contain or depend
on any Nintendo code, assets, libraries, etc.

# Summary

Invalid instructions on the RSP were previously thought to be no-ops. This was
because the testing of them had left the bits in these instructions which would
have been unused in the MIPS context as all zeros. This caused the destination
register rd to be $zero, which discards writes, leading to the observed no-op
behavior. In reality, if the rd bits are set to other values, architectural
state change is observed (i.e. the instructions do things).

Uses self-modifying RSP code, which is not typically done due to the full
separation of code and data in the RSP architecture.

# Findings

## SPECIAL

**All** invalid instructions in the SPECIAL group (major op 00, all minor ops
which are not valid instructions--both instructions which normally exist in
MIPS and instructions which are normally invalid) behave as `srlv rd, rs, rs`.
Note that rs is used as both inputs (value being shifted and lower-5-bits shift
amount); the value of rt is ignored.

This is tested by:
- Comparing the result of the instruction-under-test to the result of the 
  reference `srlv rd, rs, rs`
- for each of 2048 random 32-bit inputs as each of rs and rt
- for each shift field value (confirming that this is ignored)
- for each unused minor opcode

Changing the register numbers for rs, rt, and rd--to confirm that the rt
register number is ignored and rs and rd are used properly--is not included, but
was done manually for a handful of values in a separate test.
