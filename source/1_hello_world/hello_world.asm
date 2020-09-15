format PE console
entry _start

include 'win32a.inc'

section '.data' data readable writable

hello db "Privet, Mir!", 0
stringformat db "%s", 0ah, 0

section '.code' code readable executable

_start:
        invoke printf, stringformat, hello
        invoke getchar
        invoke ExitProcess, 0

section '.imports' import data readable

library kernel, 'kernel32.dll',\
        msvcrt, 'msvcrt.dll'

import kernel, \
       ExitProcess, 'ExitProcess'

import msvcrt, \ msvcrt.dll
       printf, 'printf',\
       getchar, '_fgetchar'
