savedcmd_DTStest.mod := printf '%s\n'   DTStest.o | awk '!x[$$0]++ { print("./"$$0) }' > DTStest.mod
