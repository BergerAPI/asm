# ASM

This is just a collection of some code that I wrote in the last few days, and some resources that I used to create the
code.

---

This is intended to run on `elf64` systems, and is assembled correspondingly.

## Assembling and Linking

Each project has a `Makefile`, which allows you to just run

```shell
$ make clean main
```

to assemble and link. You will get an executable called `j`.
This process obviously requires `make` to function.