#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/mutex.h>

static DEFINE_MUTEX(led_mutex);

bool led_try_on(const char *name) {
    if (mutex_trylock(&led_mutex)) {
        printk(KERN_INFO "[%s] LED ON\n", name);
        return true;
    }
    return false;
}
EXPORT_SYMBOL(led_try_on);

void led_off(const char *name) {
    printk(KERN_INFO "[%s] LED OFF\n", name);
    mutex_unlock(&led_mutex);
}
EXPORT_SYMBOL(led_off);

MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("Common LED logic");