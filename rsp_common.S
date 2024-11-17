#ifndef __RSP_COMMON__
#define __RSP_COMMON__

#include <rsp.inc>

.set noreorder
.set noat

.macro vclr dest
    vxor \dest, $v31, $v31
.endm

.macro vcopy dest, src
    vor \dest, \src, \src
.endm

.macro special rs, rt, rd, shf, op
    .word ((0x00 << 26) | (\rs << 21) | (\rt << 16) | (\rd << 11) | (\shf << 6) | (\op))
.endm

#endif // __RSP_COMMON__
