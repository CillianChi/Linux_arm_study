// opensbi/platform/generic/my-qemu-virt/platform.c
#include <sbi/sbi_platform.h>

const struct sbi_platform_operations platform_ops = {
    // 不實作任何功能，全部 NULL
};

const struct sbi_platform platform = {
    .name = "my-qemu-virt",
    .features = 0,
    .hart_count = 1,
    .hart_stack_size = 4096,
    .platform_ops_addr = (unsigned long)&platform_ops
};