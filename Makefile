NAME = testProject

SRCS =		main.cpp 

SRCS_S =	matrixTransformG2.cpp \
			matrixTransformG3.cpp \
			matrixTransformG5.cpp

OBJS = $(SRCS:.cpp=.o)

OBJS_S = $(SRCS:.s=.o)

FLAGS = -O2 
FLAGSB = -Ofast -fno-stack-protector -fno-exceptions -fno-rtti -mmmx -msse -msse2 -msse3 -mssse3 -mno-sse4.1 -mno-avx -fno-asynchronous-unwind-tables -std=c++11

all: $(NAME)

$(NAME):
	@echo "\x1b[33m Preparing $(NAME)...\x1b[0m"
	g++ -o $(NAME) $(SRCS) $(SRCS_S) $(FLAGS)
	@echo "\x1b[32m $(NAME) is ready!\x1b[0m"

clean:
	rm -rf $(OBJS)

generateASM:

	g++ -S -masm=intel $(FLAGSB) -o newIdea/transformz_TEST.s newIdea/transform.cpp

	g++ -S -masm=intel $(FLAGSB) -o newIdea/transform3.s newIdea/transform3.cpp
	g++ -S -masm=intel $(FLAGSB) -o newIdea/transformz2.s newIdea/transformz2.cpp
	g++ -S -masm=intel $(FLAGSB) -o newIdea/transformz3.s newIdea/transformz3.cpp
	g++ -S -masm=intel $(FLAGSB) -o newIdea/transformz5.s newIdea/transformz5.cpp

	g++ -S -masm=intel $(FLAGSB) -o matrixTransformG2.s matrixTransformG2.cpp
	g++ -S -masm=intel $(FLAGSB) -o matrixTransformG3.s matrixTransformG3.cpp
	g++ -S -masm=intel $(FLAGSB) -o matrixTransformG5.s matrixTransformG5.cpp

dddd:
	clang++ -O2 -S -mllvm --x86-asm-syntax=intel gFive.cpp
	clang++ -O2 -S -mllvm --x86-asm-syntax=intel gThree.cpp
	clang++ -O2 -S -mllvm --x86-asm-syntax=intel gTwo.cpp

	sed -i "s/_Z17matrixTransformG5PiS_/matrixTransformG5Asm/g" gFive.s
	sed -i "s/_Z17matrixTransformG3PiS_/matrixTransformG3Asm/g" gThree.s
	sed -i "s/_Z17matrixTransformG2PiS_/matrixTransformG2Asm/g" gTwo.s

bench:
	g++ bench.cpp matrixTransformG2.cpp matrixTransformG3.cpp matrixTransformG5.cpp newIdea/transformz_TEST.s   -std=c++11 -isystem -L/Users/nastya/benchmark/build/src -lbenchmark -lpthread -o mybenchmark
	./mybenchmark

fclean: clean
	rm -rf $(NAME)

re: fclean all

%.o: %.cpp
	g++ $(FLAGS) -c $< -o $@

%.o	: %.s
	nasm -f macho64 $<

.PHONY:	all clean fclean re