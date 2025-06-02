#include <linux/module.h>
#include <linux/kthread.h>
#include <linux/delay.h>

extern bool led_try_on(const char* name);
extern void led_off(const char* name);

static struct task_struct *led_thread;

static int led_fn(void *data) {
    while (!kthread_should_stop()) {
        if (led_try_on("led2")) {
            msleep(100);  // 模擬亮燈時間
            led_off("led2");
        }
        msleep(1700); // 每秒嘗試一次
    }
    return 0;
}

static int __init led2_init(void) {
    printk(KERN_INFO "[led2] Module init\n");
    led_thread = kthread_run(led_fn, NULL, "led2_thread");
    return 0;
}

static void __exit led2_exit(void) {
    printk(KERN_INFO "[led2] Module exit\n");
    if (led_thread)
        kthread_stop(led_thread);
}

module_init(led2_init);
module_exit(led2_exit);
MODULE_DESCRIPTION("LED 2 控制模組：試圖開燈、延遲、關閉");
MODULE_LICENSE("GPL");