#include <linux/module.h>   // 核心模組函式
#include <linux/kernel.h>   // printk 函式
#include <linux/init.h>     // __init/__exit 巨集

// 定義兩個可由使用者設定的參數
static char *name = "KernelFriend";  // 預設名字
static int repeat = 1;               // 重複次數

// 宣告這兩個變數為 module_param，可由 insmod 傳入或經 sysfs 改動
module_param(name, charp, 0644);   // charp 為 char* 型別
MODULE_PARM_DESC(name, "Who to greet");

module_param(repeat, int, 0644);   // int 為整數型別
MODULE_PARM_DESC(repeat, "How many times to greet");

// 模組載入時的初始化函式
static int __init hello_init(void)
{
    int i;
    for (i = 0; i < repeat; i++) {
        printk(KERN_INFO "[hello_param] Hello, %s!\n", name);
    }
    return 0;
}

// 模組移除時的清除函式
static void __exit hello_exit(void)
{
    printk(KERN_INFO "[hello_param] Goodbye, %s!\n", name);
}

// 宣告 module 進出點
module_init(hello_init);
module_exit(hello_exit);

// 模組資訊
MODULE_LICENSE("GPL");
MODULE_AUTHOR("YuCheng");
MODULE_DESCRIPTION("A hello module with parameters");