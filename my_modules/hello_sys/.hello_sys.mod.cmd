savedcmd_hello_sys.mod := printf '%s\n'   hello_sys.o | awk '!x[$$0]++ { print("./"$$0) }' > hello_sys.mod
