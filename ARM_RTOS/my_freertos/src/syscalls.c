#include <sys/stat.h>
#include <unistd.h>
#include <errno.h>
#include "uart.h"
#include <sys/times.h>
extern char _end;  // Defined in linker script
static char *heap_end;

int _times(struct tms *buf)
{
    return -1;
}
caddr_t _sbrk(int incr) {
    if (heap_end == 0)
        heap_end = &_end;
    char *prev_heap_end = heap_end;
    heap_end += incr;
    return (caddr_t)prev_heap_end;
}

int _write(int file, char *ptr, int len) {
    for (int i = 0; i < len; i++) {
        if (ptr[i] == '\n')
            uart_putc('\r');
        uart_putc(ptr[i]);
    }
    return len;
}

int _close(int file) { return -1; }
int _fstat(int file, struct stat *st) { st->st_mode = S_IFCHR; return 0; }
int _isatty(int file) { return 1; }
int _lseek(int file, int ptr, int dir) { return 0; }
int _read(int file, char *ptr, int len) { return 0; }
void _exit(int status) { while (1); }
int _kill(int pid, int sig) { return -1; }
int _getpid(void) { return 1; }