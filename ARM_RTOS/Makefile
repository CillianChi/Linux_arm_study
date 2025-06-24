# ========== 專案設定 ==========
OUTPUT_DIR     := output
IMAGE          := RTOSDemo.elf
FREERTOS_ROOT  := FreeRTOS
USER_SRC       := my_freertos

# ========== 工具鏈 ==========
CC             := arm-none-eabi-gcc
LD             := arm-none-eabi-gcc
SIZE           := arm-none-eabi-size

# ========== 編譯參數 ==========
CFLAGS += -mcpu=cortex-m3 -mthumb -g -O2 -ffreestanding -Wall
CFLAGS += -I$(FREERTOS_ROOT)/include
CFLAGS += -I$(FREERTOS_ROOT)/portable/GCC/ARM_CM3
CFLAGS += -I$(USER_SRC)
CFLAGS += -I$(USER_SRC)/include -I$(USER_SRC)/src

LDFLAGS += -T $(USER_SRC)/linker_qemu.ld
LDFLAGS += -nostartfiles -Wl,--gc-sections -Wl,--no-warn-rwx-segments

# ========== 原始碼清單 ==========
SRC_C := \
    $(FREERTOS_ROOT)/tasks.c \
    $(FREERTOS_ROOT)/queue.c \
    $(FREERTOS_ROOT)/list.c \
    $(FREERTOS_ROOT)/event_groups.c \
    $(FREERTOS_ROOT)/timers.c \
    $(FREERTOS_ROOT)/stream_buffer.c \
    $(FREERTOS_ROOT)/portable/MemMang/heap_4.c \
    $(FREERTOS_ROOT)/portable/GCC/ARM_CM3/port.c \
    $(USER_SRC)/src/uart.c \
    $(USER_SRC)/src/interrupt_stubs.c \
    $(USER_SRC)/src/rtos_test.c \
    $(USER_SRC)/src/main.c

SRC_S := \
    $(USER_SRC)/startup_qemu.S

# ========== 目標檔案 ==========
OBJS_C     := $(patsubst %.c,$(OUTPUT_DIR)/%.o,$(SRC_C))
OBJS_S     := $(patsubst %.S,$(OUTPUT_DIR)/%.o,$(SRC_S))
OBJS       := $(OBJS_C) $(OBJS_S)
DEP_FILES  := $(OBJS:.o=.d)

# ========== 編譯規則 ==========
all: $(OUTPUT_DIR)/$(IMAGE)

$(OUTPUT_DIR)/my_freertos/src/%.o: my_freertos/src/%.S
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -MMD -MP -c $< -o $@

$(OUTPUT_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -MMD -MP -c $< -o $@

$(OUTPUT_DIR)/%.o: %.S
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -MMD -MP -c $< -o $@

$(OUTPUT_DIR)/$(IMAGE): $(OBJS)
	@echo "--- Linking ---"
	$(LD) $(CFLAGS) $(LDFLAGS) $(OBJS) -o $@
	$(SIZE) $@

-include $(DEP_FILES)

.PHONY: all clean run