#include <linux/module.h>
#include <linux/mutex.h>
#include <linux/kernel.h>

DEFINE_MUTEX(led_lock);

bool led_try_on(const char* name) {
    if (mutex_trylock(&led_lock)) {
        printk(KERN_INFO "[%s] LED ON 🔆\n", name);
        return true;
    } else {
        printk(KERN_INFO "[%s] LED BUSY ❌\n", name);
        return false;
    }
}
EXPORT_SYMBOL(led_try_on);

void led_off(const char* name) {
    if (mutex_is_locked(&led_lock)) {
        printk(KERN_INFO "[%s] LED OFF 🌑\n", name);
        mutex_unlock(&led_lock);
    }
}
EXPORT_SYMBOL(led_off);

MODULE_LICENSE("GPL");