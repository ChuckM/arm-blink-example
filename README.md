README
------

Ok, this is a really trivial blink example, I've written it up on my
[website](http://robotics.mcmanis.com) to help new ARM programmers get up 
to speed quickly on using the excellent GCC ARM tools provided by ARM
Limited. These tools run on Windows, Linux, and MacOS so pretty much 
anyone can use them.

The linker script here is a copy of the `gcc.ld` script from the samples 
directory in the gcc distribution. It is modified slightly so that data
initialization and bss initialization work. There is also a slightly
modified version of `startup_ARMCM4.S` which is used to get the machine
up and running. Both of those are written by ARM and modified by me for
this example.

