#include <libdragon.h>

DEFINE_RSP_UCODE(rsp_inval_instrs);

uint64_t dmem_scratch_space[0x22] = {
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0,
};

int main(void)
{
    debug_init_isviewer();
    debug_init_usblog();
    rsp_init();

    rsp_load(&rsp_inval_instrs);
    SP_DMEM[0] = (uint32_t)(&dmem_scratch_space[0]);

    debugf("Testing...\n");
    rsp_run_async();
    uint32_t status = 0;
    int ms = 0;
    for(; ms<10000; ++ms) {
        wait_ms(1);
        status = *SP_STATUS;
        if (status & (SP_STATUS_HALTED | SP_STATUS_BROKE | SP_STATUS_SIG2 | SP_STATUS_SIG3)) break;
    }
    if((status & SP_STATUS_SIG2)){
        debugf("Test passed");
    }else if((status & SP_STATUS_SIG3)){
        debugf("Test failed");
    }else{
        debugf("Test timed out");
    }
    debugf(" after %d ms\n\nvv  RSP state below  vv\n", ms);

    rsp_crash();
}
