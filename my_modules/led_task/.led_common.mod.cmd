savedcmd_led_common.mod := printf '%s\n'   led_common.o | awk '!x[$$0]++ { print("./"$$0) }' > led_common.mod
