savedcmd_led2_task.mod := printf '%s\n'   led2_task.o | awk '!x[$$0]++ { print("./"$$0) }' > led2_task.mod
