NAME = testProject

SRCS =		main.cpp 

SRCS_S =	matrixTransformG2.cpp \
			matrixTransformG3.cpp \
			matrixTransformG5.cpp \
			matrixTransformG2_SIMD.asm \
			matrixTransformG3_SIMD.asm \
			matrixTransformG3_MASKMOV.s \
			matrixTransformG3_MASKMOV_2.s \
			matrixTransformG5_SIMD.asm



OBJS = $(SRCS:.cpp=.o)

OBJS_S = $(SRCS:.s=.o)

FLAGS = -fno-stack-protector -fno-exceptions -fno-rtti -mmmx -msse -msse2 -msse3 -mno-ssse3 -mno-sse4.1 -std=c++11
FLAGSB = -O3 -fno-stack-protector -fno-exceptions -fno-rtti -mmmx -msse -msse2 -msse3 -mno-ssse3 -mno-sse4.1 -mno-avx -fno-asynchronous-unwind-tables -fno-tree-vectorize  -fno-unroll-loops -std=c++11

all: $(NAME)

$(NAME):
	@echo "\x1b[33m Preparing $(NAME)...\x1b[0m"
	g++ -o $(NAME) $(SRCS) $(SRCS_S) $(FLAGS)
	@echo "\x1b[32m $(NAME) is ready!\x1b[0m"

clean:
	rm -rf $(OBJS)

generateASM:

	g++ -S -masm=intel $(FLAGSB) -o matrixTransformG2_unpack.s matrixTransformG2_unpack.cpp
	g++ -S -masm=intel $(FLAGSB) -o matrixTransformG3_SIMD.s matrixTransformG3_SIMD.cpp


generateASM2:
	g++ -S -masm=intel $(FLAGSB) -o matrixTransformG2_SIMD.asm matrixTransformG2_SIMD.cpp

generateASM3:
	g++ -S -masm=intel $(FLAGSB) -o matrixTransformG3_SIMD.s matrixTransformG3_SIMD.cpp

generateASM5:
	g++ -S -masm=intel $(FLAGSB) -o matrixTransformG5_SIMD.asm matrixTransformG5_SIMD.cpp
dddd:
	clang++ -O2 -S -mllvm --x86-asm-syntax=intel gFive.cpp
	clang++ -O2 -S -mllvm --x86-asm-syntax=intel gThree.cpp
	clang++ -O2 -S -mllvm --x86-asm-syntax=intel gTwo.cpp

	sed -i "s/_Z17matrixTransformG5PiS_/matrixTransformG5Asm/g" gFive.s
	sed -i "s/_Z17matrixTransformG3PiS_/matrixTransformG3Asm/g" gThree.s
	sed -i "s/_Z17matrixTransformG2PiS_/matrixTransformG2Asm/g" gTwo.s

bench:
	rm -f ./mybenchmark
	g++ bench.cpp matrixTransformG2.cpp matrixTransformG3.cpp matrixTransformG5.cpp  matrixTransformG2_unpack.s matrixTransformG3_SIMD.s matrixTransformG3_MASKMOV.s matrixTransformG3_MASKMOV_2.s matrixTransformG5_SIMD.s $(FLAGSB) -isystem -L/Users/nastya/benchmark/build/src -lbenchmark -lpthread -o mybenchmark
	./mybenchmark

bench2:
	rm -f ./bench_ticks
	g++ bench_ticks.cpp matrixTransformG2_SIMD.s matrixTransformG3_SIMD.s matrixTransformG5_SIMD.s -o ./bench_ticks
	./bench_ticks

fclean: clean
	rm -rf $(NAME)

re: fclean all

%.o: %.cpp
	g++ $(FLAGS) -c $< -o $@

%.o	: %.s
	nasm -f macho64 $<

.PHONY:	all clean fclean re