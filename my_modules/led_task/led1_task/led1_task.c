#include <linux/module.h>
#include <linux/kthread.h>
#include <linux/delay.h>

extern bool led_try_on(const char* name);
extern void led_off(const char* name);

static struct task_struct *led_thread;

static int led_fn(void *data) {
    while (!kthread_should_stop()) {
        if (led_try_on("led1")) {
            msleep(500);  // 模擬亮燈時間
            led_off("led1");
        }
        msleep(1000); // 每秒嘗試一次
    }
    return 0;
}

static int __init led1_init(void) {
    printk(KERN_INFO "[led1] Module init\n");
    led_thread = kthread_run(led_fn, NULL, "led1_thread");
    return 0;
}

static void __exit led1_exit(void) {
    printk(KERN_INFO "[led1] Module exit\n");
    if (led_thread)
        kthread_stop(led_thread);
}

module_init(led1_init);
module_exit(led1_exit);
MODULE_LICENSE("GPL");