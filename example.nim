import ckb_syscall


proc main: clong {.exportc: "_start".} =
   ckb_debug("hello world")
   ckb_exit 0
