#ifndef __RSP_RNG__
#define __RSP_RNG__

#include "rsp_common.S"

// Uses the following registers and return to $31.
#ifndef rngInitF
#define rngInitF $v26
#define rngInitI $v27
#define rngIoF $v28
#define rngIoI $v30
#define rngTmp1 $v29
#define rngTmp2 $v31
#define rngScalar $1
#endif

.data
rng_constants:
    // Assumed aligned to 8! .align does not work correctly
    .half 0xa9ab
    .half 0x3c9a
    .half 0x69d7
    .half 0x0513
    
.text

rng_init:
    li      rngScalar, %lo(rng_constants)
    vclr    rngInitF
    ldv     rngInitI, 0, 0, rngScalar
    vnxor   rngTmp1, rngInitI, rngInitI.e0 // FFFF for element 0, others different
    vmov    rngInitI.e4, rngTmp1.e0
    vmov    rngInitI.e5, rngTmp1.e1
    vmov    rngInitI.e6, rngTmp1.e2
    jr      $31
     vmov   rngInitI.e7, rngTmp1.e3
    
rng_advance:
    vnxor   rngTmp1, rngInitF, rngInitF  // -1
    li      rngScalar, %lo(rng_constants)
    vcopy   rngIoF, rngInitF
    ldv     rngTmp2, 0, 0, rngScalar
    vcopy   rngIoI, rngInitI
    vaddc   rngInitF, rngInitF, rngTmp1  // Advance by -1
    vadd    rngInitI, rngInitI, rngTmp1
// From https://github.com/skeeto/hash-prospector: [16 3c9aa9ab 16 051369d7 16]
// Not the best hash on the list, but only uses right shifts by 16
integer_hash:
    // x ^= x >> 16
    vxor    rngIoF, rngIoF, rngIoI
    // x *= 3c9aa9ab, keep low part. This is not directly doable on the RSP
    // because some of the 16-bit values will be treated as signed, but it's for
    // random numbers so who cares.
    vmudn   rngTmp1, rngIoF, rngTmp2.e0 // frac * a9ab -> acc   m l
    vmadh   rngTmp1, rngIoF, rngTmp2.e1 // frac * 3c9a -> acc h m
    vmadh   rngTmp1, rngIoI, rngTmp2.e0 //  int * a9ab -> acc h m
    vsar    rngIoI, COP2_ACC_MD         //      read from acc   m
    vsar    rngIoF, COP2_ACC_LO         // rare read from acc     l
    // x ^= x >> 16
    vxor    rngIoF, rngIoF, rngIoI
    // x *= 051369d7, same as above.
    vmudn   rngTmp1, rngIoF, rngTmp2.e2 // frac * 69d7 -> acc   m l
    vmadh   rngTmp1, rngIoF, rngTmp2.e3 // frac * 0513 -> acc h m
    vmadh   rngTmp1, rngIoI, rngTmp2.e2 //  int * 69d7 -> acc h m
    vsar    rngIoI, COP2_ACC_MD         //      read from acc   m
    vsar    rngIoF, COP2_ACC_LO         // rare read from acc     l
    // x ^= x >> 16
    jr      $31
     vxor   rngIoF, rngIoF, rngIoI
    
#endif // __RSP_RNG__
