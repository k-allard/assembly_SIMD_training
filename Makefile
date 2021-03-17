NAME = testProject

SRCS =		main.cpp 

SRCS_S =	gTwo.s \
			gThree.s \
			gFive.s

OBJS = $(SRCS:.c=.o)

OBJS_S = $(SRCS:.s=.o)

FLAGS = -O2 

all: $(NAME)

$(NAME):
	@echo "\x1b[33m Preparing $(NAME)...\x1b[0m"
	g++ -o $(NAME) $(SRCS) $(SRCS_S) $(FLAGS)
	@echo "\x1b[32m $(NAME) is ready!\x1b[0m"

clean:
	rm -rf $(OBJS)

generateASM:
	clang++ -O2 -S -mllvm --x86-asm-syntax=intel gFive.cpp
	clang++ -O2 -S -mllvm --x86-asm-syntax=intel gThree.cpp
	clang++ -O2 -S -mllvm --x86-asm-syntax=intel gTwo.cpp

dddd:
	sed -i "s/_Z17matrixTransformG5PiS_/matrixTransformG5Asm/g" gFive.s
	sed -i "s/_Z17matrixTransformG3PiS_/matrixTransformG3Asm/g" gThree.s
	sed -i "s/_Z17matrixTransformG2PiS_/matrixTransformG2Asm/g" gTwo.s

bench:
	g++ bench.cpp gFive.cpp gThree.cpp gTwo.cpp gFive.s gThree.s gTwo.s -std=c++11 -isystem -L/Users/nastya/benchmark/build/src -lbenchmark -lpthread -o mybenchmark
	./mybenchmark

fclean: clean
	@rm -rf $(NAME)

re: fclean all

%.o: %.cpp
	g++ $(FLAGS) -c $< -o $@

%.o	: %.s
	nasm -f macho64 $<

.PHONY:	all clean fclean re