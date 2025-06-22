OUTPUT_DIR := ./output
IMAGE := RTOSDemo.elf
DEMO ?= 0
FREERTOS_ROOT = ./FreeRTOS/FreeRTOS
CILLIAN_SRC = ./src
CC = riscv32-unknown-elf-gcc
LD = riscv32-unknown-elf-gcc
SIZE = riscv32-unknown-elf-size

# RISC-V 架構設定（根據需求可調）
MARCH=rv32imac_zicsr
MABI=ilp32
MCMODEL=medlow

INCLUDE_DIRS = \
	-I$(FREERTOS_ROOT)/Source/include \
	-I$(FREERTOS_ROOT)/Source/portable/GCC/RISC-V \
	-I$(FREERTOS_ROOT)/Source/portable/GCC/RISC-V/chip_specific_extensions/RV32I_CLINT_no_extensions \
	-I$(FREERTOS_ROOT)/Demo/Common/include \
	-I$(FREERTOS_ROOT)/Demo/RISC-V_RV32_QEMU_VIRT_GCC \
	-I./src

CFLAGS = -fmessage-length=0 \
	-march=$(MARCH) -mabi=$(MABI) -mcmodel=$(MCMODEL) \
	-ffunction-sections -fdata-sections -Wno-unused-parameter \
	-nostartfiles -g3 -Os $(INCLUDE_DIRS) \
	--specs=nano.specs -fno-builtin-printf
CFLAGS += -DCILLIAN_TEST=0

LDFLAGS = -nostartfiles -Xlinker --gc-sections -Wl,-Map,$(OUTPUT_DIR)/RTOSDemo.map \
    -T./src/fake_rom.ld -march=$(MARCH) -mabi=$(MABI) -mcmodel=$(MCMODEL) \
    -Wl,--defsym=__stack_size=2048 -Wl,--start-group -Wl,--end-group
    
SRC_C = \
	$(FREERTOS_ROOT)/Source/tasks.c \
	$(FREERTOS_ROOT)/Source/list.c \
	$(FREERTOS_ROOT)/Source/queue.c \
	$(FREERTOS_ROOT)/Source/timers.c \
	$(FREERTOS_ROOT)/Source/event_groups.c \
	$(FREERTOS_ROOT)/Source/stream_buffer.c \
	$(FREERTOS_ROOT)/Source/portable/MemMang/heap_4.c \
	$(FREERTOS_ROOT)/Source/portable/GCC/RISC-V/port.c \
	$(CILLIAN_SRC)/main.c \
	$(CILLIAN_SRC)/ns16550.c \
	$(CILLIAN_SRC)/uart.c \
	$(CILLIAN_SRC)/riscv-virt.c \
	$(CILLIAN_SRC)/main_tasks.c \
	$(CILLIAN_SRC)/main_isr.c \
	$(CILLIAN_SRC)/main_mutex.c \
	$(CILLIAN_SRC)/printf-stdarg.c

SRC_S = \
	$(FREERTOS_ROOT)/Source/portable/GCC/RISC-V/portASM.S \
	./src/start.S \
	./src/RegTest.S \
	./src/vector.S

ifeq ($(DEMO),1)
SRC_C += \
	$(CILLIAN_SRC)/main_blinky.c \
	$(CILLIAN_SRC)/main_full.c \
	$(FREERTOS_ROOT)/Demo/Common/Minimal/AbortDelay.c \
	$(FREERTOS_ROOT)/Demo/Common/Minimal/BlockQ.c \
	$(FREERTOS_ROOT)/Demo/Common/Minimal/blocktim.c \
	$(FREERTOS_ROOT)/Demo/Common/Minimal/countsem.c \
	$(FREERTOS_ROOT)/Demo/Common/Minimal/death.c \
	$(FREERTOS_ROOT)/Demo/Common/Minimal/dynamic.c \
	$(FREERTOS_ROOT)/Demo/Common/Minimal/EventGroupsDemo.c \
	$(FREERTOS_ROOT)/Demo/Common/Minimal/GenQTest.c \
	$(FREERTOS_ROOT)/Demo/Common/Minimal/integer.c \
	$(FREERTOS_ROOT)/Demo/Common/Minimal/IntSemTest.c \
	$(FREERTOS_ROOT)/Demo/Common/Minimal/MessageBufferAMP.c \
	$(FREERTOS_ROOT)/Demo/Common/Minimal/MessageBufferDemo.c \
	$(FREERTOS_ROOT)/Demo/Common/Minimal/PollQ.c \
	$(FREERTOS_ROOT)/Demo/Common/Minimal/QPeek.c \
	$(FREERTOS_ROOT)/Demo/Common/Minimal/QueueOverwrite.c \
	$(FREERTOS_ROOT)/Demo/Common/Minimal/QueueSet.c \
	$(FREERTOS_ROOT)/Demo/Common/Minimal/QueueSetPolling.c \
	$(FREERTOS_ROOT)/Demo/Common/Minimal/recmutex.c \
	$(FREERTOS_ROOT)/Demo/Common/Minimal/semtest.c \
	$(FREERTOS_ROOT)/Demo/Common/Minimal/StaticAllocation.c \
	$(FREERTOS_ROOT)/Demo/Common/Minimal/StreamBufferDemo.c \
	$(FREERTOS_ROOT)/Demo/Common/Minimal/StreamBufferInterrupt.c \
	$(FREERTOS_ROOT)/Demo/Common/Minimal/TaskNotify.c \
	$(FREERTOS_ROOT)/Demo/Common/Minimal/TaskNotifyArray.c \
	$(FREERTOS_ROOT)/Demo/Common/Minimal/TimerDemo.c 
	
endif
OBJS_C = $(patsubst %.c,$(OUTPUT_DIR)/%.o,$(SRC_C))
OBJS_S = $(patsubst %.S,$(OUTPUT_DIR)/%.o,$(SRC_S))
OBJS = $(OBJS_C) $(OBJS_S)

DEP_FILES = $(OBJS:.o=.d)

$(OUTPUT_DIR)/%.o : %.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -MMD -MP -c $< -o $@

$(OUTPUT_DIR)/%.o : %.S
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -MMD -MP -c $< -o $@

all: $(OUTPUT_DIR)/$(IMAGE)

$(OUTPUT_DIR)/$(IMAGE): $(OBJS)
	@echo ""
	@echo "--- Linking final ELF ---"
	$(LD) $(OBJS) $(LDFLAGS) -o $@
	$(SIZE) $@

-include $(DEP_FILES)

clean:
	rm -rf $(OUTPUT_DIR)

.PHONY: all clean