Assembler code generated from C++ with command ``g++ -S -masm=intel -Ofast -fno-stack-protector -fno-exceptions -fno-rtti -mmmx -msse -msse2 -msse3 -mssse3 -mno-sse4.1 -mno-avx -fno-asynchronous-unwind-tables -std=c++11 -o transform.s transform.cpp`` 

https://www.felixcloutier.com/x86/punpckhbw:punpckhwd:punpckhdq:punpckhqdq 

https://www.felixcloutier.com/x86/pshufd 

https://parallel.ru/russia/MSU-Intel/sse.html

http://www.xtechx.ru/c40-visokotehnologichni-spravochnik-hitech-book/sse-simd-instruction/

Заметки по оптимизации

При реализации функции transformz2 можно убрать цикл второго уровня
Развернуть его.


-
https://gamedev.ru/flame/forum/?id=196945

В случае с SHUFPS первый Xmm регистр переворачивает свои старшие 64 бита и пишет их в младшую часть этого же XMM регистра, затем берутся 64 бита младших байтов из второго XMM регистра , переворачиваются и пишутся в старшую часть первого XMM регистра.