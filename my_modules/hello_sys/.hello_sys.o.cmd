savedcmd_hello_sys.o := aarch64-linux-gnu-gcc -Wp,-MMD,./.hello_sys.o.d -nostdinc -I/Project/linux/arch/arm64/include -I/Project/linux/arch/arm64/include/generated -I/Project/linux/include -I/Project/linux/include -I/Project/linux/arch/arm64/include/uapi -I/Project/linux/arch/arm64/include/generated/uapi -I/Project/linux/include/uapi -I/Project/linux/include/generated/uapi -include /Project/linux/include/linux/compiler-version.h -include /Project/linux/include/linux/kconfig.h -include /Project/linux/include/linux/compiler_types.h -D__KERNEL__ -mlittle-endian -DKASAN_SHADOW_SCALE_SHIFT= -std=gnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -mgeneral-regs-only -DCONFIG_CC_HAS_K_CONSTRAINT=1 -Wno-psabi -mabi=lp64 -fno-asynchronous-unwind-tables -fno-unwind-tables -mbranch-protection=pac-ret -Wa,-march=armv8.5-a -DARM64_ASM_ARCH='"armv8.5-a"' -DKASAN_SHADOW_SCALE_SHIFT= -fno-delete-null-pointer-checks -O2 -fno-allow-store-data-races -fstack-protector-strong -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-stack-clash-protection -falign-functions=4 -fno-strict-overflow -fno-stack-check -fconserve-stack -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Werror=strict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wframe-larger-than=2048 -Wno-main -Wvla-larger-than=1 -Wno-pointer-sign -Wcast-function-type -Wno-array-bounds -Wno-stringop-overflow -Wno-alloc-size-larger-than -Wimplicit-fallthrough=5 -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -Wenum-conversion -Wunused -Wno-unused-but-set-variable -Wno-unused-const-variable -Wno-packed-not-aligned -Wno-format-overflow -Wno-format-truncation -Wno-stringop-truncation -Wno-override-init -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-maybe-uninitialized -Wno-sign-compare -Wno-unused-parameter -g -fno-var-tracking -femit-struct-debug-baseonly -mstack-protector-guard=sysreg -mstack-protector-guard-reg=sp_el0 -mstack-protector-guard-offset=1240  -DMODULE  -DKBUILD_BASENAME='"hello_sys"' -DKBUILD_MODNAME='"hello_sys"' -D__KBUILD_MODNAME=kmod_hello_sys -c -o hello_sys.o hello_sys.c  

source_hello_sys.o := hello_sys.c

deps_hello_sys.o := \
  /Project/linux/include/linux/compiler-version.h \
    $(wildcard include/config/CC_VERSION_TEXT) \
  /Project/linux/include/linux/kconfig.h \
    $(wildcard include/config/CPU_BIG_ENDIAN) \
    $(wildcard include/config/BOOGER) \
    $(wildcard include/config/FOO) \
  /Project/linux/include/linux/compiler_types.h \
    $(wildcard include/config/DEBUG_INFO_BTF) \
    $(wildcard include/config/PAHOLE_HAS_BTF_TAG) \
    $(wildcard include/config/FUNCTION_ALIGNMENT) \
    $(wildcard include/config/CC_HAS_SANE_FUNCTION_ALIGNMENT) \
    $(wildcard include/config/X86_64) \
    $(wildcard include/config/ARM64) \
    $(wildcard include/config/LD_DEAD_CODE_DATA_ELIMINATION) \
    $(wildcard include/config/LTO_CLANG) \
    $(wildcard include/config/HAVE_ARCH_COMPILER_H) \
    $(wildcard include/config/CC_HAS_COUNTED_BY) \
    $(wildcard include/config/CC_HAS_MULTIDIMENSIONAL_NONSTRING) \
    $(wildcard include/config/UBSAN_INTEGER_WRAP) \
    $(wildcard include/config/CC_HAS_ASM_INLINE) \
  /Project/linux/include/linux/compiler_attributes.h \
  /Project/linux/include/linux/compiler-gcc.h \
    $(wildcard include/config/MITIGATION_RETPOLINE) \
    $(wildcard include/config/ARCH_USE_BUILTIN_BSWAP) \
    $(wildcard include/config/SHADOW_CALL_STACK) \
    $(wildcard include/config/KCOV) \
    $(wildcard include/config/CC_HAS_TYPEOF_UNQUAL) \
  /Project/linux/arch/arm64/include/asm/compiler.h \
    $(wildcard include/config/ARM64_PTR_AUTH_KERNEL) \
    $(wildcard include/config/ARM64_PTR_AUTH) \
    $(wildcard include/config/BUILTIN_RETURN_ADDRESS_STRIPS_PAC) \
  /Project/linux/include/linux/module.h \
    $(wildcard include/config/MODULES) \
    $(wildcard include/config/SYSFS) \
    $(wildcard include/config/MODULES_TREE_LOOKUP) \
    $(wildcard include/config/LIVEPATCH) \
    $(wildcard include/config/STACKTRACE_BUILD_ID) \
    $(wildcard include/config/ARCH_USES_CFI_TRAPS) \
    $(wildcard include/config/MODULE_SIG) \
    $(wildcard include/config/GENERIC_BUG) \
    $(wildcard include/config/KALLSYMS) \
    $(wildcard include/config/SMP) \
    $(wildcard include/config/TRACEPOINTS) \
    $(wildcard include/config/TREE_SRCU) \
    $(wildcard include/config/BPF_EVENTS) \
    $(wildcard include/config/DEBUG_INFO_BTF_MODULES) \
    $(wildcard include/config/JUMP_LABEL) \
    $(wildcard include/config/TRACING) \
    $(wildcard include/config/EVENT_TRACING) \
    $(wildcard include/config/FTRACE_MCOUNT_RECORD) \
    $(wildcard include/config/KPROBES) \
    $(wildcard include/config/HAVE_STATIC_CALL_INLINE) \
    $(wildcard include/config/KUNIT) \
    $(wildcard include/config/PRINTK_INDEX) \
    $(wildcard include/config/MODULE_UNLOAD) \
    $(wildcard include/config/MITIGATION_ITS) \
    $(wildcard include/config/CONSTRUCTORS) \
    $(wildcard include/config/FUNCTION_ERROR_INJECTION) \
    $(wildcard include/config/DYNAMIC_DEBUG_CORE) \
  /Project/linux/include/linux/list.h \
    $(wildcard include/config/LIST_HARDENED) \
    $(wildcard include/config/DEBUG_LIST) \
  /Project/linux/include/linux/container_of.h \
  /Project/linux/include/linux/build_bug.h \
  /Project/linux/include/linux/compiler.h \
    $(wildcard include/config/TRACE_BRANCH_PROFILING) \
    $(wildcard include/config/PROFILE_ALL_BRANCHES) \
    $(wildcard include/config/OBJTOOL) \
    $(wildcard include/config/CFI_CLANG) \
    $(wildcard include/config/64BIT) \
  /Project/linux/arch/arm64/include/asm/rwonce.h \
    $(wildcard include/config/LTO) \
    $(wildcard include/config/AS_HAS_LDAPR) \
  /Project/linux/include/asm-generic/rwonce.h \
  /Project/linux/include/linux/kasan-checks.h \
    $(wildcard include/config/KASAN_GENERIC) \
    $(wildcard include/config/KASAN_SW_TAGS) \
  /Project/linux/include/linux/types.h \
    $(wildcard include/config/HAVE_UID16) \
    $(wildcard include/config/UID16) \
    $(wildcard include/config/ARCH_DMA_ADDR_T_64BIT) \
    $(wildcard include/config/PHYS_ADDR_T_64BIT) \
    $(wildcard include/config/ARCH_32BIT_USTAT_F_TINODE) \
  /Project/linux/include/uapi/linux/types.h \
  /Project/linux/arch/arm64/include/generated/uapi/asm/types.h \
  /Project/linux/include/uapi/asm-generic/types.h \
  /Project/linux/include/asm-generic/int-ll64.h \
  /Project/linux/include/uapi/asm-generic/int-ll64.h \
  /Project/linux/arch/arm64/include/uapi/asm/bitsperlong.h \
  /Project/linux/include/asm-generic/bitsperlong.h \
  /Project/linux/include/uapi/asm-generic/bitsperlong.h \
  /Project/linux/include/uapi/linux/posix_types.h \
  /Project/linux/include/linux/stddef.h \
  /Project/linux/include/uapi/linux/stddef.h \
  /Project/linux/arch/arm64/include/uapi/asm/posix_types.h \
  /Project/linux/include/uapi/asm-generic/posix_types.h \
  /Project/linux/include/linux/kcsan-checks.h \
    $(wildcard include/config/KCSAN) \
    $(wildcard include/config/KCSAN_WEAK_MEMORY) \
    $(wildcard include/config/KCSAN_IGNORE_ATOMICS) \
  /Project/linux/include/linux/poison.h \
    $(wildcard include/config/ILLEGAL_POINTER_VALUE) \
  /Project/linux/include/linux/const.h \
  /Project/linux/include/vdso/const.h \
  /Project/linux/include/uapi/linux/const.h \
  /Project/linux/arch/arm64/include/asm/barrier.h \
    $(wildcard include/config/ARM64_PSEUDO_NMI) \
  /Project/linux/arch/arm64/include/asm/alternative-macros.h \
  /Project/linux/include/vdso/bits.h \
  /Project/linux/arch/arm64/include/asm/cpucaps.h \
    $(wildcard include/config/ARM64_PAN) \
    $(wildcard include/config/ARM64_EPAN) \
    $(wildcard include/config/ARM64_SVE) \
    $(wildcard include/config/ARM64_SME) \
    $(wildcard include/config/ARM64_CNP) \
    $(wildcard include/config/ARM64_MTE) \
    $(wildcard include/config/ARM64_BTI) \
    $(wildcard include/config/ARM64_TLB_RANGE) \
    $(wildcard include/config/ARM64_POE) \
    $(wildcard include/config/ARM64_GCS) \
    $(wildcard include/config/ARM64_HAFT) \
    $(wildcard include/config/UNMAP_KERNEL_AT_EL0) \
    $(wildcard include/config/ARM64_ERRATUM_843419) \
    $(wildcard include/config/ARM64_ERRATUM_1742098) \
    $(wildcard include/config/ARM64_ERRATUM_2645198) \
    $(wildcard include/config/ARM64_ERRATUM_2658417) \
    $(wildcard include/config/CAVIUM_ERRATUM_23154) \
    $(wildcard include/config/NVIDIA_CARMEL_CNP_ERRATUM) \
    $(wildcard include/config/ARM64_WORKAROUND_REPEAT_TLBI) \
    $(wildcard include/config/ARM64_ERRATUM_3194386) \
    $(wildcard include/config/HW_PERF_EVENTS) \
  /Project/linux/arch/arm64/include/generated/asm/cpucap-defs.h \
  /Project/linux/arch/arm64/include/asm/insn-def.h \
  /Project/linux/arch/arm64/include/asm/brk-imm.h \
  /Project/linux/include/linux/stringify.h \
  /Project/linux/include/asm-generic/barrier.h \
  /Project/linux/include/linux/stat.h \
  /Project/linux/arch/arm64/include/asm/stat.h \
    $(wildcard include/config/COMPAT) \
  /Project/linux/arch/arm64/include/generated/uapi/asm/stat.h \
  /Project/linux/include/uapi/asm-generic/stat.h \
  /Project/linux/include/linux/time.h \
    $(wildcard include/config/POSIX_TIMERS) \
  /Project/linux/include/linux/cache.h \
    $(wildcard include/config/ARCH_HAS_CACHE_LINE_SIZE) \
  /Project/linux/include/uapi/linux/kernel.h \
  /Project/linux/include/uapi/linux/sysinfo.h \
  /Project/linux/include/vdso/cache.h \
  /Project/linux/arch/arm64/include/asm/cache.h \
    $(wildcard include/config/KASAN_HW_TAGS) \
  /Project/linux/include/linux/bitops.h \
  /Project/linux/include/linux/bits.h \
  /Project/linux/include/uapi/linux/bits.h \
  /Project/linux/include/linux/typecheck.h \
  /Project/linux/include/asm-generic/bitops/generic-non-atomic.h \
  /Project/linux/arch/arm64/include/asm/bitops.h \
  /Project/linux/include/asm-generic/bitops/builtin-__ffs.h \
  /Project/linux/include/asm-generic/bitops/builtin-ffs.h \
  /Project/linux/include/asm-generic/bitops/builtin-__fls.h \
  /Project/linux/include/asm-generic/bitops/builtin-fls.h \
  /Project/linux/include/asm-generic/bitops/ffz.h \
  /Project/linux/include/asm-generic/bitops/fls64.h \
  /Project/linux/include/asm-generic/bitops/sched.h \
  /Project/linux/include/asm-generic/bitops/hweight.h \
  /Project/linux/include/asm-generic/bitops/arch_hweight.h \
  /Project/linux/include/asm-generic/bitops/const_hweight.h \
  /Project/linux/include/asm-generic/bitops/atomic.h \
  /Project/linux/include/linux/atomic.h \
  /Project/linux/arch/arm64/include/asm/atomic.h \
  /Project/linux/arch/arm64/include/asm/cmpxchg.h \
  /Project/linux/arch/arm64/include/asm/lse.h \
    $(wildcard include/config/ARM64_LSE_ATOMICS) \
  /Project/linux/arch/arm64/include/asm/atomic_ll_sc.h \
    $(wildcard include/config/CC_HAS_K_CONSTRAINT) \
  /Project/linux/include/linux/export.h \
    $(wildcard include/config/MODVERSIONS) \
    $(wildcard include/config/GENDWARFKSYMS) \
  /Project/linux/include/linux/linkage.h \
    $(wildcard include/config/ARCH_USE_SYM_ANNOTATIONS) \
  /Project/linux/arch/arm64/include/asm/linkage.h \
  /Project/linux/arch/arm64/include/asm/alternative.h \
  /Project/linux/include/linux/init.h \
    $(wildcard include/config/MEMORY_HOTPLUG) \
    $(wildcard include/config/HAVE_ARCH_PREL32_RELOCATIONS) \
  /Project/linux/arch/arm64/include/asm/atomic_lse.h \
  /Project/linux/include/linux/atomic/atomic-arch-fallback.h \
    $(wildcard include/config/GENERIC_ATOMIC64) \
  /Project/linux/include/linux/atomic/atomic-long.h \
  /Project/linux/include/linux/atomic/atomic-instrumented.h \
  /Project/linux/include/linux/instrumented.h \
  /Project/linux/include/linux/kmsan-checks.h \
    $(wildcard include/config/KMSAN) \
  /Project/linux/include/asm-generic/bitops/instrumented-atomic.h \
  /Project/linux/include/asm-generic/bitops/lock.h \
  /Project/linux/include/asm-generic/bitops/instrumented-lock.h \
  /Project/linux/include/asm-generic/bitops/non-atomic.h \
  /Project/linux/include/asm-generic/bitops/non-instrumented-non-atomic.h \
  /Project/linux/include/asm-generic/bitops/le.h \
  /Project/linux/arch/arm64/include/uapi/asm/byteorder.h \
  /Project/linux/include/linux/byteorder/little_endian.h \
  /Project/linux/include/uapi/linux/byteorder/little_endian.h \
  /Project/linux/include/linux/swab.h \
  /Project/linux/include/uapi/linux/swab.h \
  /Project/linux/arch/arm64/include/generated/uapi/asm/swab.h \
  /Project/linux/include/uapi/asm-generic/swab.h \
  /Project/linux/include/linux/byteorder/generic.h \
  /Project/linux/include/asm-generic/bitops/ext2-atomic-setbit.h \
  /Project/linux/include/linux/kasan-enabled.h \
    $(wildcard include/config/KASAN) \
  /Project/linux/include/linux/static_key.h \
  /Project/linux/include/linux/jump_label.h \
    $(wildcard include/config/HAVE_ARCH_JUMP_LABEL_RELATIVE) \
  /Project/linux/include/linux/cleanup.h \
  /Project/linux/arch/arm64/include/asm/jump_label.h \
  /Project/linux/arch/arm64/include/asm/insn.h \
  /Project/linux/arch/arm64/include/asm/cputype.h \
  /Project/linux/arch/arm64/include/asm/sysreg.h \
    $(wildcard include/config/BROKEN_GAS_INST) \
    $(wildcard include/config/ARM64_PA_BITS_52) \
    $(wildcard include/config/ARM64_4K_PAGES) \
    $(wildcard include/config/ARM64_16K_PAGES) \
    $(wildcard include/config/ARM64_64K_PAGES) \
  /Project/linux/include/linux/kasan-tags.h \
  /Project/linux/arch/arm64/include/asm/gpr-num.h \
  /Project/linux/arch/arm64/include/generated/asm/sysreg-defs.h \
  /Project/linux/include/linux/bitfield.h \
  /Project/linux/arch/arm64/include/asm/mte-def.h \
  /Project/linux/include/linux/math64.h \
    $(wildcard include/config/ARCH_SUPPORTS_INT128) \
  /Project/linux/include/linux/math.h \
  /Project/linux/arch/arm64/include/generated/asm/div64.h \
  /Project/linux/include/asm-generic/div64.h \
    $(wildcard include/config/CC_OPTIMIZE_FOR_PERFORMANCE) \
  /Project/linux/include/vdso/math64.h \
  /Project/linux/include/linux/time64.h \
  /Project/linux/include/vdso/time64.h \
  /Project/linux/include/uapi/linux/time.h \
  /Project/linux/include/uapi/linux/time_types.h \
  /Project/linux/include/linux/time32.h \
  /Project/linux/include/linux/timex.h \
  /Project/linux/include/uapi/linux/timex.h \
  /Project/linux/include/uapi/linux/param.h \
  /Project/linux/arch/arm64/include/uapi/asm/param.h \
  /Project/linux/include/asm-generic/param.h \
    $(wildcard include/config/HZ) \
  /Project/linux/include/uapi/asm-generic/param.h \
  /Project/linux/arch/arm64/include/asm/timex.h \
  /Project/linux/arch/arm64/include/asm/arch_timer.h \
    $(wildcard include/config/ARM_ARCH_TIMER_OOL_WORKAROUND) \
  /Project/linux/arch/arm64/include/asm/hwcap.h \
  /Project/linux/arch/arm64/include/uapi/asm/hwcap.h \
  /Project/linux/arch/arm64/include/asm/cpufeature.h \
    $(wildcard include/config/ARM64_SW_TTBR0_PAN) \
    $(wildcard include/config/ARM64_DEBUG_PRIORITY_MASKING) \
    $(wildcard include/config/ARM64_BTI_KERNEL) \
    $(wildcard include/config/ARM64_PA_BITS) \
    $(wildcard include/config/ARM64_HW_AFDBM) \
    $(wildcard include/config/ARM64_AMU_EXTN) \
    $(wildcard include/config/ARM64_LPA2) \
  /Project/linux/include/linux/bug.h \
    $(wildcard include/config/PRINTK) \
    $(wildcard include/config/BUG_ON_DATA_CORRUPTION) \
  /Project/linux/arch/arm64/include/asm/bug.h \
  /Project/linux/arch/arm64/include/asm/asm-bug.h \
    $(wildcard include/config/DEBUG_BUGVERBOSE) \
  /Project/linux/include/asm-generic/bug.h \
    $(wildcard include/config/BUG) \
    $(wildcard include/config/GENERIC_BUG_RELATIVE_POINTERS) \
  /Project/linux/include/linux/instrumentation.h \
    $(wildcard include/config/NOINSTR_VALIDATION) \
  /Project/linux/include/linux/once_lite.h \
  /Project/linux/include/linux/panic.h \
    $(wildcard include/config/PANIC_TIMEOUT) \
  /Project/linux/include/linux/printk.h \
    $(wildcard include/config/MESSAGE_LOGLEVEL_DEFAULT) \
    $(wildcard include/config/CONSOLE_LOGLEVEL_DEFAULT) \
    $(wildcard include/config/CONSOLE_LOGLEVEL_QUIET) \
    $(wildcard include/config/EARLY_PRINTK) \
    $(wildcard include/config/DYNAMIC_DEBUG) \
  /Project/linux/include/linux/stdarg.h \
  /Project/linux/include/linux/kern_levels.h \
  /Project/linux/include/linux/ratelimit_types.h \
  /Project/linux/include/linux/spinlock_types_raw.h \
    $(wildcard include/config/DEBUG_SPINLOCK) \
    $(wildcard include/config/DEBUG_LOCK_ALLOC) \
  /Project/linux/arch/arm64/include/asm/spinlock_types.h \
  /Project/linux/include/asm-generic/qspinlock_types.h \
    $(wildcard include/config/NR_CPUS) \
  /Project/linux/include/asm-generic/qrwlock_types.h \
  /Project/linux/include/linux/lockdep_types.h \
    $(wildcard include/config/PROVE_RAW_LOCK_NESTING) \
    $(wildcard include/config/LOCKDEP) \
    $(wildcard include/config/LOCK_STAT) \
  /Project/linux/include/linux/kernel.h \
    $(wildcard include/config/PREEMPT_VOLUNTARY_BUILD) \
    $(wildcard include/config/PREEMPT_DYNAMIC) \
    $(wildcard include/config/HAVE_PREEMPT_DYNAMIC_CALL) \
    $(wildcard include/config/HAVE_PREEMPT_DYNAMIC_KEY) \
    $(wildcard include/config/PREEMPT_) \
    $(wildcard include/config/DEBUG_ATOMIC_SLEEP) \
    $(wildcard include/config/MMU) \
    $(wildcard include/config/PROVE_LOCKING) \
  /Project/linux/include/linux/align.h \
  /Project/linux/include/vdso/align.h \
  /Project/linux/include/linux/array_size.h \
  /Project/linux/include/linux/limits.h \
  /Project/linux/include/uapi/linux/limits.h \
  /Project/linux/include/vdso/limits.h \
  /Project/linux/include/linux/hex.h \
  /Project/linux/include/linux/kstrtox.h \
  /Project/linux/include/linux/log2.h \
    $(wildcard include/config/ARCH_HAS_ILOG2_U32) \
    $(wildcard include/config/ARCH_HAS_ILOG2_U64) \
  /Project/linux/include/linux/minmax.h \
  /Project/linux/include/linux/sprintf.h \
  /Project/linux/include/linux/static_call_types.h \
    $(wildcard include/config/HAVE_STATIC_CALL) \
  /Project/linux/include/linux/instruction_pointer.h \
  /Project/linux/include/linux/wordpart.h \
  /Project/linux/include/linux/cpumask.h \
    $(wildcard include/config/FORCE_NR_CPUS) \
    $(wildcard include/config/HOTPLUG_CPU) \
    $(wildcard include/config/DEBUG_PER_CPU_MAPS) \
    $(wildcard include/config/CPUMASK_OFFSTACK) \
  /Project/linux/include/linux/bitmap.h \
  /Project/linux/include/linux/errno.h \
  /Project/linux/include/uapi/linux/errno.h \
  /Project/linux/arch/arm64/include/generated/uapi/asm/errno.h \
  /Project/linux/include/uapi/asm-generic/errno.h \
  /Project/linux/include/uapi/asm-generic/errno-base.h \
  /Project/linux/include/linux/find.h \
  /Project/linux/include/linux/string.h \
    $(wildcard include/config/BINARY_PRINTF) \
    $(wildcard include/config/FORTIFY_SOURCE) \
  /Project/linux/include/linux/args.h \
  /Project/linux/include/linux/err.h \
  /Project/linux/include/linux/overflow.h \
  /Project/linux/include/uapi/linux/string.h \
  /Project/linux/arch/arm64/include/asm/string.h \
    $(wildcard include/config/ARCH_HAS_UACCESS_FLUSHCACHE) \
  /Project/linux/include/linux/bitmap-str.h \
  /Project/linux/include/linux/cpumask_types.h \
  /Project/linux/include/linux/threads.h \
    $(wildcard include/config/BASE_SMALL) \
  /Project/linux/include/linux/gfp_types.h \
    $(wildcard include/config/SLAB_OBJ_EXT) \
  /Project/linux/include/linux/numa.h \
    $(wildcard include/config/NUMA_KEEP_MEMINFO) \
    $(wildcard include/config/NUMA) \
    $(wildcard include/config/HAVE_ARCH_NODE_DEV_GROUP) \
  /Project/linux/include/linux/nodemask.h \
    $(wildcard include/config/HIGHMEM) \
  /Project/linux/include/linux/nodemask_types.h \
    $(wildcard include/config/NODES_SHIFT) \
  /Project/linux/include/linux/random.h \
    $(wildcard include/config/VMGENID) \
  /Project/linux/include/uapi/linux/random.h \
  /Project/linux/include/uapi/linux/ioctl.h \
  /Project/linux/arch/arm64/include/generated/uapi/asm/ioctl.h \
  /Project/linux/include/asm-generic/ioctl.h \
  /Project/linux/include/uapi/asm-generic/ioctl.h \
  /Project/linux/include/linux/irqnr.h \
  /Project/linux/include/uapi/linux/irqnr.h \
  /Project/linux/arch/arm64/include/asm/sparsemem.h \
  /Project/linux/arch/arm64/include/asm/pgtable-prot.h \
    $(wildcard include/config/HAVE_ARCH_USERFAULTFD_WP) \
  /Project/linux/arch/arm64/include/asm/memory.h \
    $(wildcard include/config/ARM64_VA_BITS) \
    $(wildcard include/config/KASAN_SHADOW_OFFSET) \
    $(wildcard include/config/VMAP_STACK) \
    $(wildcard include/config/RANDOMIZE_BASE) \
    $(wildcard include/config/DEBUG_VIRTUAL) \
    $(wildcard include/config/EFI) \
    $(wildcard include/config/ARM_GIC_V3_ITS) \
  /Project/linux/include/linux/sizes.h \
  /Project/linux/arch/arm64/include/asm/page-def.h \
  /Project/linux/include/vdso/page.h \
    $(wildcard include/config/PAGE_SHIFT) \
  /Project/linux/include/linux/mmdebug.h \
    $(wildcard include/config/DEBUG_VM) \
    $(wildcard include/config/DEBUG_VM_IRQSOFF) \
    $(wildcard include/config/DEBUG_VM_PGFLAGS) \
  /Project/linux/arch/arm64/include/asm/boot.h \
  /Project/linux/arch/arm64/include/asm/sections.h \
  /Project/linux/include/asm-generic/sections.h \
    $(wildcard include/config/HAVE_FUNCTION_DESCRIPTORS) \
  /Project/linux/include/asm-generic/memory_model.h \
    $(wildcard include/config/FLATMEM) \
    $(wildcard include/config/SPARSEMEM_VMEMMAP) \
    $(wildcard include/config/SPARSEMEM) \
  /Project/linux/include/linux/pfn.h \
  /Project/linux/arch/arm64/include/asm/pgtable-hwdef.h \
    $(wildcard include/config/PGTABLE_LEVELS) \
    $(wildcard include/config/ARM64_CONT_PTE_SHIFT) \
    $(wildcard include/config/ARM64_CONT_PMD_SHIFT) \
    $(wildcard include/config/ARM64_VA_BITS_52) \
  /Project/linux/arch/arm64/include/asm/pgtable-types.h \
  /Project/linux/arch/arm64/include/asm/rsi.h \
  /Project/linux/arch/arm64/include/asm/rsi_cmds.h \
  /Project/linux/include/linux/arm-smccc.h \
    $(wildcard include/config/HAVE_ARM_SMCCC) \
    $(wildcard include/config/ARM) \
  /Project/linux/arch/arm64/include/asm/rsi_smc.h \
  /Project/linux/include/linux/percpu.h \
    $(wildcard include/config/RANDOM_KMALLOC_CACHES) \
    $(wildcard include/config/PAGE_SIZE_4KB) \
    $(wildcard include/config/NEED_PER_CPU_PAGE_FIRST_CHUNK) \
    $(wildcard include/config/HAVE_SETUP_PER_CPU_AREA) \
  /Project/linux/include/linux/alloc_tag.h \
    $(wildcard include/config/MEM_ALLOC_PROFILING_DEBUG) \
    $(wildcard include/config/MEM_ALLOC_PROFILING) \
    $(wildcard include/config/MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT) \
  /Project/linux/include/linux/codetag.h \
    $(wildcard include/config/CODE_TAGGING) \
  /Project/linux/include/linux/preempt.h \
    $(wildcard include/config/PREEMPT_RT) \
    $(wildcard include/config/PREEMPT_COUNT) \
    $(wildcard include/config/DEBUG_PREEMPT) \
    $(wildcard include/config/TRACE_PREEMPT_TOGGLE) \
    $(wildcard include/config/PREEMPTION) \
    $(wildcard include/config/PREEMPT_NOTIFIERS) \
    $(wildcard include/config/PREEMPT_NONE) \
    $(wildcard include/config/PREEMPT_VOLUNTARY) \
    $(wildcard include/config/PREEMPT) \
    $(wildcard include/config/PREEMPT_LAZY) \
  /Project/linux/arch/arm64/include/asm/preempt.h \
  /Project/linux/include/linux/thread_info.h \
    $(wildcard include/config/THREAD_INFO_IN_TASK) \
    $(wildcard include/config/GENERIC_ENTRY) \
    $(wildcard include/config/ARCH_HAS_PREEMPT_LAZY) \
    $(wildcard include/config/HAVE_ARCH_WITHIN_STACK_FRAMES) \
    $(wildcard include/config/SH) \
  /Project/linux/include/linux/restart_block.h \
  /Project/linux/arch/arm64/include/asm/current.h \
  /Project/linux/arch/arm64/include/asm/thread_info.h \
  /Project/linux/arch/arm64/include/asm/stack_pointer.h \
  /Project/linux/arch/arm64/include/asm/percpu.h \
  /Project/linux/include/asm-generic/percpu.h \
  /Project/linux/include/linux/percpu-defs.h \
    $(wildcard include/config/DEBUG_FORCE_WEAK_PER_CPU) \
    $(wildcard include/config/AMD_MEM_ENCRYPT) \
  /Project/linux/include/linux/smp.h \
    $(wildcard include/config/UP_LATE_INIT) \
    $(wildcard include/config/CSD_LOCK_WAIT_DEBUG) \
  /Project/linux/include/linux/smp_types.h \
  /Project/linux/include/linux/llist.h \
    $(wildcard include/config/ARCH_HAVE_NMI_SAFE_CMPXCHG) \
  /Project/linux/arch/arm64/include/asm/smp.h \
    $(wildcard include/config/ARM64_ACPI_PARKING_PROTOCOL) \
  /Project/linux/include/linux/irqflags.h \
    $(wildcard include/config/TRACE_IRQFLAGS) \
    $(wildcard include/config/IRQSOFF_TRACER) \
    $(wildcard include/config/PREEMPT_TRACER) \
    $(wildcard include/config/DEBUG_IRQFLAGS) \
    $(wildcard include/config/TRACE_IRQFLAGS_SUPPORT) \
  /Project/linux/include/linux/irqflags_types.h \
  /Project/linux/arch/arm64/include/asm/irqflags.h \
  /Project/linux/arch/arm64/include/asm/ptrace.h \
  /Project/linux/arch/arm64/include/uapi/asm/ptrace.h \
  /Project/linux/arch/arm64/include/uapi/asm/sve_context.h \
  /Project/linux/include/linux/irqchip/arm-gic-v3-prio.h \
  /Project/linux/arch/arm64/include/asm/stacktrace/frame.h \
  /Project/linux/include/linux/sched.h \
    $(wildcard include/config/VIRT_CPU_ACCOUNTING_NATIVE) \
    $(wildcard include/config/SCHED_INFO) \
    $(wildcard include/config/SCHEDSTATS) \
    $(wildcard include/config/SCHED_CORE) \
    $(wildcard include/config/FAIR_GROUP_SCHED) \
    $(wildcard include/config/RT_GROUP_SCHED) \
    $(wildcard include/config/RT_MUTEXES) \
    $(wildcard include/config/UCLAMP_TASK) \
    $(wildcard include/config/UCLAMP_BUCKETS_COUNT) \
    $(wildcard include/config/KMAP_LOCAL) \
    $(wildcard include/config/SCHED_CLASS_EXT) \
    $(wildcard include/config/CGROUP_SCHED) \
    $(wildcard include/config/BLK_DEV_IO_TRACE) \
    $(wildcard include/config/PREEMPT_RCU) \
    $(wildcard include/config/TASKS_RCU) \
    $(wildcard include/config/TASKS_TRACE_RCU) \
    $(wildcard include/config/MEMCG_V1) \
    $(wildcard include/config/LRU_GEN) \
    $(wildcard include/config/COMPAT_BRK) \
    $(wildcard include/config/CGROUPS) \
    $(wildcard include/config/BLK_CGROUP) \
    $(wildcard include/config/PSI) \
    $(wildcard include/config/PAGE_OWNER) \
    $(wildcard include/config/EVENTFD) \
    $(wildcard include/config/ARCH_HAS_CPU_PASID) \
    $(wildcard include/config/X86_BUS_LOCK_DETECT) \
    $(wildcard include/config/TASK_DELAY_ACCT) \
    $(wildcard include/config/STACKPROTECTOR) \
    $(wildcard include/config/ARCH_HAS_SCALED_CPUTIME) \
    $(wildcard include/config/VIRT_CPU_ACCOUNTING_GEN) \
    $(wildcard include/config/NO_HZ_FULL) \
    $(wildcard include/config/POSIX_CPUTIMERS) \
    $(wildcard include/config/POSIX_CPU_TIMERS_TASK_WORK) \
    $(wildcard include/config/KEYS) \
    $(wildcard include/config/SYSVIPC) \
    $(wildcard include/config/DETECT_HUNG_TASK) \
    $(wildcard include/config/IO_URING) \
    $(wildcard include/config/AUDIT) \
    $(wildcard include/config/AUDITSYSCALL) \
    $(wildcard include/config/DEBUG_MUTEXES) \
    $(wildcard include/config/DETECT_HUNG_TASK_BLOCKER) \
    $(wildcard include/config/UBSAN) \
    $(wildcard include/config/UBSAN_TRAP) \
    $(wildcard include/config/COMPACTION) \
    $(wildcard include/config/TASK_XACCT) \
    $(wildcard include/config/CPUSETS) \
    $(wildcard include/config/X86_CPU_RESCTRL) \
    $(wildcard include/config/FUTEX) \
    $(wildcard include/config/PERF_EVENTS) \
    $(wildcard include/config/NUMA_BALANCING) \
    $(wildcard include/config/RSEQ) \
    $(wildcard include/config/DEBUG_RSEQ) \
    $(wildcard include/config/SCHED_MM_CID) \
    $(wildcard include/config/FAULT_INJECTION) \
    $(wildcard include/config/LATENCYTOP) \
    $(wildcard include/config/FUNCTION_GRAPH_TRACER) \
    $(wildcard include/config/MEMCG) \
    $(wildcard include/config/UPROBES) \
    $(wildcard include/config/BCACHE) \
    $(wildcard include/config/SECURITY) \
    $(wildcard include/config/BPF_SYSCALL) \
    $(wildcard include/config/GCC_PLUGIN_STACKLEAK) \
    $(wildcard include/config/X86_MCE) \
    $(wildcard include/config/KRETPROBES) \
    $(wildcard include/config/RETHOOK) \
    $(wildcard include/config/ARCH_HAS_PARANOID_L1D_FLUSH) \
    $(wildcard include/config/RV) \
    $(wildcard include/config/USER_EVENTS) \
  /Project/linux/include/uapi/linux/sched.h \
  /Project/linux/arch/arm64/include/asm/processor.h \
    $(wildcard include/config/KUSER_HELPERS) \
    $(wildcard include/config/ARM64_FORCE_52BIT) \
    $(wildcard include/config/HAVE_HW_BREAKPOINT) \
    $(wildcard include/config/ARM64_TAGGED_ADDR_ABI) \
  /Project/linux/include/vdso/processor.h \
  /Project/linux/arch/arm64/include/asm/vdso/processor.h \
  /Project/linux/arch/arm64/include/asm/hw_breakpoint.h \
    $(wildcard include/config/CPU_PM) \
  /Project/linux/arch/arm64/include/asm/virt.h \
    $(wildcard include/config/KVM) \
  /Project/linux/arch/arm64/include/asm/kasan.h \
  /Project/linux/arch/arm64/include/asm/mte-kasan.h \
  /Project/linux/arch/arm64/include/asm/pointer_auth.h \
  /Project/linux/include/uapi/linux/prctl.h \
  /Project/linux/arch/arm64/include/asm/spectre.h \
  /Project/linux/arch/arm64/include/asm/fpsimd.h \
  /Project/linux/arch/arm64/include/uapi/asm/sigcontext.h \
  /Project/linux/include/linux/pid_types.h \
  /Project/linux/include/linux/sem_types.h \
  /Project/linux/include/linux/shm.h \
  /Project/linux/arch/arm64/include/asm/page.h \
  /Project/linux/include/linux/personality.h \
  /Project/linux/include/uapi/linux/personality.h \
  /Project/linux/include/asm-generic/getorder.h \
  /Project/linux/arch/arm64/include/asm/shmparam.h \
  /Project/linux/include/asm-generic/shmparam.h \
  /Project/linux/include/linux/kmsan_types.h \
  /Project/linux/include/linux/mutex_types.h \
    $(wildcard include/config/MUTEX_SPIN_ON_OWNER) \
  /Project/linux/include/linux/osq_lock.h \
  /Project/linux/include/linux/spinlock_types.h \
  /Project/linux/include/linux/rwlock_types.h \
  /Project/linux/include/linux/plist_types.h \
  /Project/linux/include/linux/hrtimer_types.h \
  /Project/linux/include/linux/timerqueue_types.h \
  /Project/linux/include/linux/rbtree_types.h \
  /Project/linux/include/linux/timer_types.h \
  /Project/linux/include/linux/seccomp_types.h \
    $(wildcard include/config/SECCOMP) \
  /Project/linux/include/linux/refcount_types.h \
  /Project/linux/include/linux/resource.h \
  /Project/linux/include/uapi/linux/resource.h \
  /Project/linux/arch/arm64/include/generated/uapi/asm/resource.h \
  /Project/linux/include/asm-generic/resource.h \
  /Project/linux/include/uapi/asm-generic/resource.h \
  /Project/linux/include/linux/latencytop.h \
  /Project/linux/include/linux/sched/prio.h \
  /Project/linux/include/linux/sched/types.h \
  /Project/linux/include/linux/signal_types.h \
    $(wildcard include/config/OLD_SIGACTION) \
  /Project/linux/include/uapi/linux/signal.h \
  /Project/linux/arch/arm64/include/asm/signal.h \
  /Project/linux/arch/arm64/include/uapi/asm/signal.h \
  /Project/linux/include/asm-generic/signal.h \
  /Project/linux/include/uapi/asm-generic/signal.h \
  /Project/linux/include/uapi/asm-generic/signal-defs.h \
  /Project/linux/arch/arm64/include/generated/uapi/asm/siginfo.h \
  /Project/linux/include/uapi/asm-generic/siginfo.h \
  /Project/linux/include/linux/syscall_user_dispatch_types.h \
  /Project/linux/include/linux/mm_types_task.h \
    $(wildcard include/config/ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH) \
  /Project/linux/arch/arm64/include/asm/tlbbatch.h \
  /Project/linux/include/linux/netdevice_xmit.h \
    $(wildcard include/config/NET_EGRESS) \
    $(wildcard include/config/NET_ACT_MIRRED) \
    $(wildcard include/config/NF_DUP_NETDEV) \
  /Project/linux/include/linux/task_io_accounting.h \
    $(wildcard include/config/TASK_IO_ACCOUNTING) \
  /Project/linux/include/linux/posix-timers_types.h \
  /Project/linux/include/uapi/linux/rseq.h \
  /Project/linux/include/linux/seqlock_types.h \
  /Project/linux/include/linux/kcsan.h \
  /Project/linux/include/linux/rv.h \
    $(wildcard include/config/RV_REACTORS) \
  /Project/linux/include/linux/uidgid_types.h \
  /Project/linux/include/linux/tracepoint-defs.h \
  /Project/linux/arch/arm64/include/generated/asm/kmap_size.h \
  /Project/linux/include/asm-generic/kmap_size.h \
    $(wildcard include/config/DEBUG_KMAP_LOCAL) \
  /Project/linux/include/linux/sched/ext.h \
    $(wildcard include/config/EXT_GROUP_SCHED) \
  /Project/linux/include/linux/spinlock.h \
  /Project/linux/include/linux/bottom_half.h \
  /Project/linux/include/linux/lockdep.h \
    $(wildcard include/config/DEBUG_LOCKING_API_SELFTESTS) \
  /Project/linux/arch/arm64/include/generated/asm/mmiowb.h \
  /Project/linux/include/asm-generic/mmiowb.h \
    $(wildcard include/config/MMIOWB) \
  /Project/linux/arch/arm64/include/asm/spinlock.h \
  /Project/linux/arch/arm64/include/generated/asm/qspinlock.h \
  /Project/linux/include/asm-generic/qspinlock.h \
  /Project/linux/arch/arm64/include/generated/asm/qrwlock.h \
  /Project/linux/include/asm-generic/qrwlock.h \
  /Project/linux/include/linux/rwlock.h \
  /Project/linux/include/linux/spinlock_api_smp.h \
    $(wildcard include/config/INLINE_SPIN_LOCK) \
    $(wildcard include/config/INLINE_SPIN_LOCK_BH) \
    $(wildcard include/config/INLINE_SPIN_LOCK_IRQ) \
    $(wildcard include/config/INLINE_SPIN_LOCK_IRQSAVE) \
    $(wildcard include/config/INLINE_SPIN_TRYLOCK) \
    $(wildcard include/config/INLINE_SPIN_TRYLOCK_BH) \
    $(wildcard include/config/UNINLINE_SPIN_UNLOCK) \
    $(wildcard include/config/INLINE_SPIN_UNLOCK_BH) \
    $(wildcard include/config/INLINE_SPIN_UNLOCK_IRQ) \
    $(wildcard include/config/INLINE_SPIN_UNLOCK_IRQRESTORE) \
    $(wildcard include/config/GENERIC_LOCKBREAK) \
  /Project/linux/include/linux/rwlock_api_smp.h \
    $(wildcard include/config/INLINE_READ_LOCK) \
    $(wildcard include/config/INLINE_WRITE_LOCK) \
    $(wildcard include/config/INLINE_READ_LOCK_BH) \
    $(wildcard include/config/INLINE_WRITE_LOCK_BH) \
    $(wildcard include/config/INLINE_READ_LOCK_IRQ) \
    $(wildcard include/config/INLINE_WRITE_LOCK_IRQ) \
    $(wildcard include/config/INLINE_READ_LOCK_IRQSAVE) \
    $(wildcard include/config/INLINE_WRITE_LOCK_IRQSAVE) \
    $(wildcard include/config/INLINE_READ_TRYLOCK) \
    $(wildcard include/config/INLINE_WRITE_TRYLOCK) \
    $(wildcard include/config/INLINE_READ_UNLOCK) \
    $(wildcard include/config/INLINE_WRITE_UNLOCK) \
    $(wildcard include/config/INLINE_READ_UNLOCK_BH) \
    $(wildcard include/config/INLINE_WRITE_UNLOCK_BH) \
    $(wildcard include/config/INLINE_READ_UNLOCK_IRQ) \
    $(wildcard include/config/INLINE_WRITE_UNLOCK_IRQ) \
    $(wildcard include/config/INLINE_READ_UNLOCK_IRQRESTORE) \
    $(wildcard include/config/INLINE_WRITE_UNLOCK_IRQRESTORE) \
  /Project/linux/include/clocksource/arm_arch_timer.h \
    $(wildcard include/config/ARM_ARCH_TIMER) \
  /Project/linux/include/linux/timecounter.h \
  /Project/linux/include/asm-generic/timex.h \
  /Project/linux/include/vdso/time32.h \
  /Project/linux/include/vdso/time.h \
  /Project/linux/arch/arm64/include/asm/compat.h \
  /Project/linux/include/asm-generic/compat.h \
    $(wildcard include/config/COMPAT_FOR_U64_ALIGNMENT) \
  /Project/linux/include/linux/sched/task_stack.h \
    $(wildcard include/config/STACK_GROWSUP) \
    $(wildcard include/config/DEBUG_STACK_USAGE) \
  /Project/linux/include/uapi/linux/magic.h \
  /Project/linux/include/linux/refcount.h \
  /Project/linux/include/linux/kasan.h \
    $(wildcard include/config/KASAN_STACK) \
    $(wildcard include/config/KASAN_VMALLOC) \
  /Project/linux/include/uapi/linux/stat.h \
  /Project/linux/include/linux/uidgid.h \
    $(wildcard include/config/MULTIUSER) \
    $(wildcard include/config/USER_NS) \
  /Project/linux/include/linux/highuid.h \
  /Project/linux/include/linux/buildid.h \
    $(wildcard include/config/VMCORE_INFO) \
  /Project/linux/include/linux/kmod.h \
  /Project/linux/include/linux/umh.h \
  /Project/linux/include/linux/gfp.h \
    $(wildcard include/config/ZONE_DMA) \
    $(wildcard include/config/ZONE_DMA32) \
    $(wildcard include/config/ZONE_DEVICE) \
    $(wildcard include/config/CONTIG_ALLOC) \
  /Project/linux/include/linux/mmzone.h \
    $(wildcard include/config/ARCH_FORCE_MAX_ORDER) \
    $(wildcard include/config/CMA) \
    $(wildcard include/config/MEMORY_ISOLATION) \
    $(wildcard include/config/ZSMALLOC) \
    $(wildcard include/config/UNACCEPTED_MEMORY) \
    $(wildcard include/config/IOMMU_SUPPORT) \
    $(wildcard include/config/SWAP) \
    $(wildcard include/config/HUGETLB_PAGE) \
    $(wildcard include/config/TRANSPARENT_HUGEPAGE) \
    $(wildcard include/config/LRU_GEN_STATS) \
    $(wildcard include/config/LRU_GEN_WALKS_MMU) \
    $(wildcard include/config/MEMORY_FAILURE) \
    $(wildcard include/config/PAGE_EXTENSION) \
    $(wildcard include/config/DEFERRED_STRUCT_PAGE_INIT) \
    $(wildcard include/config/HAVE_MEMORYLESS_NODES) \
    $(wildcard include/config/SPARSEMEM_EXTREME) \
    $(wildcard include/config/SPARSEMEM_VMEMMAP_PREINIT) \
    $(wildcard include/config/HAVE_ARCH_PFN_VALID) \
  /Project/linux/include/linux/list_nulls.h \
  /Project/linux/include/linux/wait.h \
  /Project/linux/include/linux/seqlock.h \
  /Project/linux/include/linux/mutex.h \
  /Project/linux/include/linux/debug_locks.h \
  /Project/linux/include/linux/pageblock-flags.h \
    $(wildcard include/config/HUGETLB_PAGE_SIZE_VARIABLE) \
  /Project/linux/include/linux/page-flags-layout.h \
  /Project/linux/include/generated/bounds.h \
  /Project/linux/include/linux/mm_types.h \
    $(wildcard include/config/HAVE_ALIGNED_STRUCT_PAGE) \
    $(wildcard include/config/HUGETLB_PMD_PAGE_TABLE_SHARING) \
    $(wildcard include/config/SLAB_FREELIST_HARDENED) \
    $(wildcard include/config/USERFAULTFD) \
    $(wildcard include/config/ANON_VMA_NAME) \
    $(wildcard include/config/PER_VMA_LOCK) \
    $(wildcard include/config/HAVE_ARCH_COMPAT_MMAP_BASES) \
    $(wildcard include/config/MEMBARRIER) \
    $(wildcard include/config/FUTEX_PRIVATE_HASH) \
    $(wildcard include/config/AIO) \
    $(wildcard include/config/MMU_NOTIFIER) \
    $(wildcard include/config/SPLIT_PMD_PTLOCKS) \
    $(wildcard include/config/IOMMU_MM_DATA) \
    $(wildcard include/config/KSM) \
    $(wildcard include/config/MM_ID) \
    $(wildcard include/config/CORE_DUMP_DEFAULT_ELF_HEADERS) \
  /Project/linux/include/linux/auxvec.h \
  /Project/linux/include/uapi/linux/auxvec.h \
  /Project/linux/arch/arm64/include/uapi/asm/auxvec.h \
  /Project/linux/include/linux/kref.h \
  /Project/linux/include/linux/rbtree.h \
  /Project/linux/include/linux/rcupdate.h \
    $(wildcard include/config/TINY_RCU) \
    $(wildcard include/config/RCU_STRICT_GRACE_PERIOD) \
    $(wildcard include/config/RCU_LAZY) \
    $(wildcard include/config/RCU_STALL_COMMON) \
    $(wildcard include/config/KVM_XFER_TO_GUEST_WORK) \
    $(wildcard include/config/RCU_NOCB_CPU) \
    $(wildcard include/config/TASKS_RCU_GENERIC) \
    $(wildcard include/config/TASKS_RUDE_RCU) \
    $(wildcard include/config/TREE_RCU) \
    $(wildcard include/config/DEBUG_OBJECTS_RCU_HEAD) \
    $(wildcard include/config/PROVE_RCU) \
    $(wildcard include/config/ARCH_WEAK_RELEASE_ACQUIRE) \
  /Project/linux/include/linux/context_tracking_irq.h \
    $(wildcard include/config/CONTEXT_TRACKING_IDLE) \
  /Project/linux/include/linux/rcutree.h \
  /Project/linux/include/linux/maple_tree.h \
    $(wildcard include/config/MAPLE_RCU_DISABLED) \
    $(wildcard include/config/DEBUG_MAPLE_TREE) \
  /Project/linux/include/linux/rwsem.h \
    $(wildcard include/config/RWSEM_SPIN_ON_OWNER) \
    $(wildcard include/config/DEBUG_RWSEMS) \
  /Project/linux/include/linux/completion.h \
  /Project/linux/include/linux/swait.h \
  /Project/linux/include/linux/uprobes.h \
  /Project/linux/include/linux/timer.h \
    $(wildcard include/config/DEBUG_OBJECTS_TIMERS) \
  /Project/linux/include/linux/ktime.h \
  /Project/linux/include/linux/jiffies.h \
  /Project/linux/include/vdso/jiffies.h \
  /Project/linux/include/generated/timeconst.h \
  /Project/linux/include/vdso/ktime.h \
  /Project/linux/include/linux/timekeeping.h \
    $(wildcard include/config/GENERIC_CMOS_UPDATE) \
  /Project/linux/include/linux/clocksource_ids.h \
  /Project/linux/include/linux/debugobjects.h \
    $(wildcard include/config/DEBUG_OBJECTS) \
    $(wildcard include/config/DEBUG_OBJECTS_FREE) \
  /Project/linux/include/linux/workqueue.h \
    $(wildcard include/config/DEBUG_OBJECTS_WORK) \
    $(wildcard include/config/FREEZER) \
    $(wildcard include/config/WQ_WATCHDOG) \
  /Project/linux/include/linux/workqueue_types.h \
  /Project/linux/include/linux/percpu_counter.h \
  /Project/linux/arch/arm64/include/asm/mmu.h \
    $(wildcard include/config/ARM64_E0PD) \
  /Project/linux/include/linux/page-flags.h \
    $(wildcard include/config/PAGE_IDLE_FLAG) \
    $(wildcard include/config/ARCH_USES_PG_ARCH_2) \
    $(wildcard include/config/ARCH_USES_PG_ARCH_3) \
    $(wildcard include/config/HUGETLB_PAGE_OPTIMIZE_VMEMMAP) \
    $(wildcard include/config/DEBUG_KMAP_LOCAL_FORCE_MAP) \
  /Project/linux/include/linux/local_lock.h \
  /Project/linux/include/linux/local_lock_internal.h \
  /Project/linux/include/linux/zswap.h \
    $(wildcard include/config/ZSWAP) \
  /Project/linux/include/linux/memory_hotplug.h \
    $(wildcard include/config/ARCH_HAS_ADD_PAGES) \
    $(wildcard include/config/MEMORY_HOTREMOVE) \
  /Project/linux/include/linux/notifier.h \
  /Project/linux/include/linux/srcu.h \
    $(wildcard include/config/TINY_SRCU) \
    $(wildcard include/config/NEED_SRCU_NMI_SAFE) \
  /Project/linux/include/linux/rcu_segcblist.h \
  /Project/linux/include/linux/srcutree.h \
  /Project/linux/include/linux/rcu_node_tree.h \
    $(wildcard include/config/RCU_FANOUT) \
    $(wildcard include/config/RCU_FANOUT_LEAF) \
  /Project/linux/arch/arm64/include/generated/asm/mmzone.h \
  /Project/linux/include/asm-generic/mmzone.h \
  /Project/linux/include/linux/topology.h \
    $(wildcard include/config/USE_PERCPU_NUMA_NODE_ID) \
    $(wildcard include/config/SCHED_SMT) \
    $(wildcard include/config/GENERIC_ARCH_TOPOLOGY) \
  /Project/linux/include/linux/arch_topology.h \
  /Project/linux/arch/arm64/include/asm/topology.h \
  /Project/linux/arch/arm64/include/asm/numa.h \
  /Project/linux/include/asm-generic/numa.h \
    $(wildcard include/config/NUMA_EMU) \
  /Project/linux/include/asm-generic/topology.h \
  /Project/linux/include/linux/sysctl.h \
    $(wildcard include/config/SYSCTL) \
  /Project/linux/include/uapi/linux/sysctl.h \
  /Project/linux/include/linux/elf.h \
    $(wildcard include/config/ARCH_HAVE_EXTRA_ELF_NOTES) \
    $(wildcard include/config/ARCH_USE_GNU_PROPERTY) \
    $(wildcard include/config/ARCH_HAVE_ELF_PROT) \
  /Project/linux/arch/arm64/include/asm/elf.h \
    $(wildcard include/config/COMPAT_VDSO) \
  /Project/linux/arch/arm64/include/generated/asm/user.h \
  /Project/linux/include/asm-generic/user.h \
  /Project/linux/include/uapi/linux/elf.h \
  /Project/linux/include/uapi/linux/elf-em.h \
  /Project/linux/include/linux/fs.h \
    $(wildcard include/config/FANOTIFY_ACCESS_PERMISSIONS) \
    $(wildcard include/config/READ_ONLY_THP_FOR_FS) \
    $(wildcard include/config/FS_POSIX_ACL) \
    $(wildcard include/config/CGROUP_WRITEBACK) \
    $(wildcard include/config/IMA) \
    $(wildcard include/config/FILE_LOCKING) \
    $(wildcard include/config/FSNOTIFY) \
    $(wildcard include/config/FS_ENCRYPTION) \
    $(wildcard include/config/FS_VERITY) \
    $(wildcard include/config/EPOLL) \
    $(wildcard include/config/UNICODE) \
    $(wildcard include/config/QUOTA) \
    $(wildcard include/config/FS_DAX) \
    $(wildcard include/config/BLOCK) \
  /Project/linux/include/linux/vfsdebug.h \
    $(wildcard include/config/DEBUG_VFS) \
  /Project/linux/include/linux/wait_bit.h \
  /Project/linux/include/linux/kdev_t.h \
  /Project/linux/include/uapi/linux/kdev_t.h \
  /Project/linux/include/linux/dcache.h \
  /Project/linux/include/linux/rculist.h \
    $(wildcard include/config/PROVE_RCU_LIST) \
  /Project/linux/include/linux/rculist_bl.h \
  /Project/linux/include/linux/list_bl.h \
  /Project/linux/include/linux/bit_spinlock.h \
  /Project/linux/include/linux/lockref.h \
    $(wildcard include/config/ARCH_USE_CMPXCHG_LOCKREF) \
  /Project/linux/include/linux/stringhash.h \
    $(wildcard include/config/DCACHE_WORD_ACCESS) \
  /Project/linux/include/linux/hash.h \
    $(wildcard include/config/HAVE_ARCH_HASH) \
  /Project/linux/include/linux/path.h \
  /Project/linux/include/linux/list_lru.h \
  /Project/linux/include/linux/shrinker.h \
    $(wildcard include/config/SHRINKER_DEBUG) \
  /Project/linux/include/linux/xarray.h \
    $(wildcard include/config/XARRAY_MULTI) \
  /Project/linux/include/linux/sched/mm.h \
    $(wildcard include/config/MMU_LAZY_TLB_REFCOUNT) \
    $(wildcard include/config/ARCH_HAS_MEMBARRIER_CALLBACKS) \
    $(wildcard include/config/ARCH_HAS_SYNC_CORE_BEFORE_USERMODE) \
  /Project/linux/include/linux/sync_core.h \
    $(wildcard include/config/ARCH_HAS_PREPARE_SYNC_CORE_CMD) \
  /Project/linux/include/linux/sched/coredump.h \
  /Project/linux/include/linux/radix-tree.h \
  /Project/linux/include/linux/pid.h \
  /Project/linux/include/linux/capability.h \
  /Project/linux/include/uapi/linux/capability.h \
  /Project/linux/include/linux/semaphore.h \
  /Project/linux/include/linux/fcntl.h \
    $(wildcard include/config/ARCH_32BIT_OFF_T) \
  /Project/linux/include/uapi/linux/fcntl.h \
  /Project/linux/arch/arm64/include/uapi/asm/fcntl.h \
  /Project/linux/include/uapi/asm-generic/fcntl.h \
  /Project/linux/include/uapi/linux/openat2.h \
  /Project/linux/include/linux/migrate_mode.h \
  /Project/linux/include/linux/percpu-rwsem.h \
  /Project/linux/include/linux/rcuwait.h \
  /Project/linux/include/linux/sched/signal.h \
    $(wildcard include/config/SCHED_AUTOGROUP) \
    $(wildcard include/config/BSD_PROCESS_ACCT) \
    $(wildcard include/config/TASKSTATS) \
  /Project/linux/include/linux/signal.h \
    $(wildcard include/config/DYNAMIC_SIGFRAME) \
    $(wildcard include/config/PROC_FS) \
  /Project/linux/include/linux/sched/jobctl.h \
  /Project/linux/include/linux/sched/task.h \
    $(wildcard include/config/HAVE_EXIT_THREAD) \
    $(wildcard include/config/ARCH_WANTS_DYNAMIC_TASK_STRUCT) \
    $(wildcard include/config/HAVE_ARCH_THREAD_STRUCT_WHITELIST) \
  /Project/linux/include/linux/uaccess.h \
    $(wildcard include/config/ARCH_HAS_SUBPAGE_FAULTS) \
    $(wildcard include/config/HARDENED_USERCOPY) \
  /Project/linux/include/linux/fault-inject-usercopy.h \
    $(wildcard include/config/FAULT_INJECTION_USERCOPY) \
  /Project/linux/include/linux/nospec.h \
  /Project/linux/include/linux/ucopysize.h \
    $(wildcard include/config/HARDENED_USERCOPY_DEFAULT_ON) \
  /Project/linux/arch/arm64/include/asm/uaccess.h \
    $(wildcard include/config/CC_HAS_ASM_GOTO_OUTPUT) \
  /Project/linux/arch/arm64/include/asm/kernel-pgtable.h \
    $(wildcard include/config/RELOCATABLE) \
  /Project/linux/arch/arm64/include/asm/asm-extable.h \
  /Project/linux/arch/arm64/include/asm/mte.h \
  /Project/linux/arch/arm64/include/asm/extable.h \
    $(wildcard include/config/BPF_JIT) \
  /Project/linux/include/asm-generic/access_ok.h \
    $(wildcard include/config/ALTERNATE_USER_ADDRESS_SPACE) \
  /Project/linux/include/linux/cred.h \
  /Project/linux/include/linux/key.h \
    $(wildcard include/config/KEY_NOTIFICATIONS) \
    $(wildcard include/config/NET) \
  /Project/linux/include/linux/assoc_array.h \
    $(wildcard include/config/ASSOCIATIVE_ARRAY) \
  /Project/linux/include/linux/sched/user.h \
    $(wildcard include/config/VFIO_PCI_ZDEV_KVM) \
    $(wildcard include/config/IOMMUFD) \
    $(wildcard include/config/WATCH_QUEUE) \
  /Project/linux/include/linux/ratelimit.h \
  /Project/linux/include/linux/posix-timers.h \
  /Project/linux/include/linux/alarmtimer.h \
    $(wildcard include/config/RTC_CLASS) \
  /Project/linux/include/linux/hrtimer.h \
    $(wildcard include/config/HIGH_RES_TIMERS) \
    $(wildcard include/config/TIME_LOW_RES) \
    $(wildcard include/config/TIMERFD) \
  /Project/linux/include/linux/hrtimer_defs.h \
  /Project/linux/include/linux/timerqueue.h \
  /Project/linux/include/linux/rcuref.h \
  /Project/linux/include/linux/rcu_sync.h \
  /Project/linux/include/linux/delayed_call.h \
  /Project/linux/include/linux/uuid.h \
  /Project/linux/include/linux/errseq.h \
  /Project/linux/include/linux/ioprio.h \
  /Project/linux/include/linux/sched/rt.h \
  /Project/linux/include/linux/iocontext.h \
    $(wildcard include/config/BLK_ICQ) \
  /Project/linux/include/uapi/linux/ioprio.h \
  /Project/linux/include/linux/fs_types.h \
  /Project/linux/include/linux/mount.h \
  /Project/linux/include/linux/mnt_idmapping.h \
  /Project/linux/include/linux/slab.h \
    $(wildcard include/config/FAILSLAB) \
    $(wildcard include/config/KFENCE) \
    $(wildcard include/config/SLUB_TINY) \
    $(wildcard include/config/SLUB_DEBUG) \
    $(wildcard include/config/SLAB_BUCKETS) \
    $(wildcard include/config/KVFREE_RCU_BATCHED) \
  /Project/linux/include/linux/percpu-refcount.h \
  /Project/linux/include/linux/rw_hint.h \
  /Project/linux/include/linux/file_ref.h \
  /Project/linux/include/linux/unicode.h \
  /Project/linux/include/uapi/linux/fs.h \
  /Project/linux/include/linux/quota.h \
    $(wildcard include/config/QUOTA_NETLINK_INTERFACE) \
  /Project/linux/include/uapi/linux/dqblk_xfs.h \
  /Project/linux/include/linux/dqblk_v1.h \
  /Project/linux/include/linux/dqblk_v2.h \
  /Project/linux/include/linux/dqblk_qtree.h \
  /Project/linux/include/linux/projid.h \
  /Project/linux/include/uapi/linux/quota.h \
  /Project/linux/include/linux/kobject.h \
    $(wildcard include/config/UEVENT_HELPER) \
    $(wildcard include/config/DEBUG_KOBJECT_RELEASE) \
  /Project/linux/include/linux/sysfs.h \
  /Project/linux/include/linux/kernfs.h \
    $(wildcard include/config/KERNFS) \
  /Project/linux/include/linux/idr.h \
  /Project/linux/include/linux/kobject_ns.h \
  /Project/linux/include/linux/moduleparam.h \
    $(wildcard include/config/ALPHA) \
    $(wildcard include/config/PPC64) \
  /Project/linux/include/linux/rbtree_latch.h \
  /Project/linux/include/linux/error-injection.h \
  /Project/linux/include/asm-generic/error-injection.h \
  /Project/linux/include/linux/dynamic_debug.h \
  /Project/linux/arch/arm64/include/asm/module.h \
    $(wildcard include/config/DYNAMIC_FTRACE) \
  /Project/linux/include/asm-generic/module.h \
    $(wildcard include/config/HAVE_MOD_ARCH_SPECIFIC) \

hello_sys.o: $(deps_hello_sys.o)

$(deps_hello_sys.o):
