savedcmd_led1_task.mod := printf '%s\n'   led1_task.o | awk '!x[$$0]++ { print("./"$$0) }' > led1_task.mod
