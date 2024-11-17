BUILD_DIR=build
include $(N64_INST)/include/n64.mk

src = rsp_inval_instrs_cpu.c
asm = rsp_inval_instrs.S

all: rsp_inval_instrs.z64

rsp_inval_instrs.S: rsp_rng.S rsp_common.S

$(BUILD_DIR)/rsp_inval_instrs.elf: $(src:%.c=$(BUILD_DIR)/%.o) $(asm:%.S=$(BUILD_DIR)/%.o)

rsp_inval_instrs.z64: N64_ROM_TITLE="RSP Inval Instr Test"

clean:
	rm -rf $(BUILD_DIR) filesystem rsp_inval_instrs.z64

-include $(wildcard $(BUILD_DIR)/*.d)

.PHONY: all clean
