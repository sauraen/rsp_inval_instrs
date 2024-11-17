#include "rsp_common.S"

.text
    j    entry_point
     nop
dynamic_code:
    // One pair of instructions for the reference
    nop
    nop
    // 32 pairs of instructions for the instruction under test
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

.data
dram_scratch_addr:
    .word 0
dummy1:
    .word 0

#include "rsp_rng.S"

.data
rng_out_storage:
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    
    // Not a mistake, this is code in a .data section
staging:
    // Reference
    jr      $31
     nop  // Reference instruction
    // 32 instructions under test
    jr      $31
     nop  // instruction under test goes here
    jr      $31
     nop
    jr      $31
     nop
    jr      $31
     nop
    jr      $31
     nop
    jr      $31
     nop
    jr      $31
     nop
    jr      $31
     nop
    
    jr      $31
     nop
    jr      $31
     nop
    jr      $31
     nop
    jr      $31
     nop
    jr      $31
     nop
    jr      $31
     nop
    jr      $31
     nop
    jr      $31
     nop
    
    jr      $31
     nop
    jr      $31
     nop
    jr      $31
     nop
    jr      $31
     nop
    jr      $31
     nop
    jr      $31
     nop
    jr      $31
     nop
    jr      $31
     nop
    
    jr      $31
     nop
    jr      $31
     nop
    jr      $31
     nop
    jr      $31
     nop
    jr      $31
     nop
    jr      $31
     nop
    jr      $31
     nop
    jr      $31
     nop

references:
    nop                 // 00: sll, normal
    srlv    $6, $4, $4  // 01: no instr, untested
    nop                 // 02: srl, normal
    nop                 // 03: sra, normal
    nop                 // 04: sllv, normal
    srlv    $6, $4, $4  // 05: no instr, untested
    nop                 // 06: srlv, normal
    nop                 // 07: srav, normal
    nop                 // 08: jr, normal
    nop                 // 09: jalr, normal
    srlv    $6, $4, $4  // 0A: no instr, untested
    srlv    $6, $4, $4  // 0B: no instr, untested
    srlv    $6, $4, $4  // 0C: syscall, not in RSP, untested
    nop                 // 0D: break, normal
    srlv    $6, $4, $4  // 0E: no instr, untested
    srlv    $6, $4, $4  // 0F: sync, not in RSP, untested
    srlv    $6, $4, $4  // 10: mfhi, not in RSP, untested
    srlv    $6, $4, $4  // 11: mthi, not in RSP, untested
    srlv    $6, $4, $4  // 12: mflo, not in RSP, untested
    srlv    $6, $4, $4  // 13: mtlo, not in RSP, untested
    srlv    $6, $4, $4  // 14: dsllv, not in RSP, untested
    srlv    $6, $4, $4  // 15: no instr, untested
    srlv    $6, $4, $4  // 16: dsrlv, not in RSP, untested
    srlv    $6, $4, $4  // 17: dsrav, not in RSP, untested
    srlv    $6, $4, $4  // 18: mult, not in RSP, untested
    srlv    $6, $4, $4  // 19: multu, not in RSP, untested
    srlv    $6, $4, $4  // 1A: div, not in RSP, untested
    srlv    $6, $4, $4  // 1B: divu, not in RSP, untested
    srlv    $6, $4, $4  // 1C: dmult, not in RSP, untested
    srlv    $6, $4, $4  // 1D: dmultu, not in RSP, untested
    srlv    $6, $4, $4  // 1E: ddiv, not in RSP, untested
    srlv    $6, $4, $4  // 1F: ddivu, not in RSP, untested
    nop                 // 20: add, normal
    nop                 // 21: addu, normal
    nop                 // 22: sub, normal
    nop                 // 23: subu, normal
    nop                 // 24: and, normal
    nop                 // 25: or, normal
    nop                 // 26: xor, normal
    nop                 // 27: nor, normal
    srlv    $6, $4, $4  // 28: no instr, untested
    srlv    $6, $4, $4  // 29: no instr, untested
    nop                 // 2A: slt, normal
    nop                 // 2B: sltu, normal
    srlv    $6, $4, $4  // 2C: dadd, not in RSP, untested
    srlv    $6, $4, $4  // 2D: daddu, not in RSP, untested
    srlv    $6, $4, $4  // 2E: dsub, not in RSP, untested
    srlv    $6, $4, $4  // 2F: dsubu, not in RSP, untested
    srlv    $6, $4, $4  // 30: tge, not in RSP, untested
    srlv    $6, $4, $4  // 31: tgeu, not in RSP, untested
    srlv    $6, $4, $4  // 32: tlt, not in RSP, untested
    srlv    $6, $4, $4  // 33: tltu, not in RSP, untested
    srlv    $6, $4, $4  // 34: teq, not in RSP, untested
    srlv    $6, $4, $4  // 35: no instr, untested
    srlv    $6, $4, $4  // 36: tne, not in RSP, untested
    srlv    $6, $4, $4  // 37: no instr, untested
    srlv    $6, $4, $4  // 38: dsll, not in RSP, untested
    srlv    $6, $4, $4  // 39: no instr, untested
    srlv    $6, $4, $4  // 3A: dsrl, not in RSP, untested
    srlv    $6, $4, $4  // 3B: dsra, not in RSP, untested
    srlv    $6, $4, $4  // 3C: dsll32, not in RSP, untested
    srlv    $6, $4, $4  // 3D: no instr, untested
    srlv    $6, $4, $4  // 3E: dsrl32, not in RSP, untested
    srlv    $6, $4, $4  // 3F: dsra32, not in RSP, untested

.text

// $1: temp
// $2: local counter
// $3: local counter
// $4: input rs
// $5: input rt
// $6: reference out
// $7: test out
#define variantPtr $8
#define variantCount $9
#define testOp $10

#define rngStoragePtr $25
#define dmaImemOut $26
#define dmaDmemIn $27
#define dmaSizeR $28
#define dramScratchAddr $29
#define phase $30

entry_point:
    // Setup
    li      phase, 1
    jal     rng_init
     li     rngStoragePtr, %lo(rng_out_storage)
    jal     dma_wait_idle
     lw     dramScratchAddr, (%lo(dram_scratch_addr))($0)
    li      phase, 2
    li      dmaSizeR, (0x21 * 8) - 1  // 32 cmds plus 1 reference, each 8 bytes, minus 1 for DMA
    li      dmaDmemIn, %lo(staging)
    li      dmaImemOut, %lo(dynamic_code)
    
    // Loop over ops, i.e. lower opcode bits within SPECIAL
    li      testOp, 0x40
test_op_loop:
    // Copy the reference instruction
    addi    testOp, testOp, -1  // First is 3F
    sll     $1, testOp, 2  // * 4 for word
    lw      $1, (%lo(references))($1)  // Load reference word
    beqz    $1, end_test_op_loop  // If reference is 0 / nop, normal instruction, don't test
     sw     $1, (%lo(staging) + 0x4)($0)  // Reference is second word of staging after jr
    // Build the instructions under test
    lui     $2, ((0x00 << 10) | (4 << 5) | (5 << 0))  // SPECIAL, rs, rt
    ori     $2, $2, (7 << 11)  // rd
    or      $2, $2, testOp  // SPECIAL sub-opcode
    li      $4, %lo(staging) + 0x8 + (0x20 * 0x8) + 0x4  // Write pointer; skip staging, second instr
    li      $5, 0x20 << 6  // Shift amount
write_test_instr_loop:
    addi    $4, $4, -8
    addi    $5, $5, (-1) << 6
    or      $3, $2, $5  // Final instruction
    bgtz    $5, write_test_instr_loop
     sw     $3, (0)($4)
    // Copy staging buffer from DMEM to DRAM to IMEM
    li      phase, 3
    mtc0    dramScratchAddr, COP0_DMA_RAMADDR
    mtc0    dmaDmemIn, COP0_DMA_SPADDR
    mtc0    dmaSizeR, COP0_DMA_WRITE
    mtc0    dramScratchAddr, COP0_DMA_RAMADDR
    mtc0    dmaImemOut, COP0_DMA_SPADDR
    jal     dma_wait_idle
     mtc0   dmaSizeR, COP0_DMA_READ
    
    // Loop over all the variants of the instruction (shift field)
    li      phase, 4
    li      variantPtr, %lo(dynamic_code)
    li      variantCount, 0x20
test_instr_variants_loop:
    addi    variantPtr, variantPtr, 8  // Advance past reference first iter
    addi    variantCount, variantCount, -1
    // Loop over random inputs to the instruction
    li      $3, 0x200  // Number of RNG iterations; 4x this = number of random inputs to instr
test_per_instr_loop:
    jal     rng_advance
     addi   $3, $3, -1
    sdv     rngIoI, 0, 0x00, rngStoragePtr
    sdv     rngIoI, 8, 0x08, rngStoragePtr
    sdv     rngIoF, 0, 0x10, rngStoragePtr
    sdv     rngIoF, 8, 0x18, rngStoragePtr
    // Loop over 4 random inputs that come from each RNG call
    li      $2, 0x18
test_per_rng_loop:
    lw      $4, (%lo(rng_out_storage) + 0)($2)
    jal     dynamic_code  // Compute reference
     lw     $5, (%lo(rng_out_storage) + 4)($2)
    jalr    variantPtr  // Run instruction under test
     nop
    bne     $6, $7, test_failed  // Reference didn't match test
     addi   $2, $2, -8
    bgez    $2, test_per_rng_loop
     nop
    bgtz    $3, test_per_instr_loop
     nop
    bgtz    variantCount, test_instr_variants_loop
     nop
    
end_test_op_loop:
    bgtz    testOp, test_op_loop
     nop
    // Test passed
    lui     phase, 0x4
    ori     phase, phase, 0x2069
    j       signal_and_halt
     li     $1, (SP_WSTATUS_SET_HALT | SP_WSTATUS_SET_SIG2)  // Success
    
test_failed:
    li      $1, (SP_WSTATUS_SET_HALT | SP_WSTATUS_SET_SIG3)  // Failed
signal_and_halt:
    mtc0    $1, COP0_SP_STATUS
    break
halt:
    j       halt
     nop

dma_wait_idle:
    mfc0    $1, COP0_SP_STATUS
dma_wait_idle_loop:
    andi    $1, $1, SP_STATUS_DMA_BUSY | SP_STATUS_DMA_FULL
    bnez    $1, dma_wait_idle_loop
     mfc0   $1, COP0_SP_STATUS
    jr      $31
     nop
