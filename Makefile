NAME = testProject

SRCS =		main.c

SRCS_S =	gTwo.s \
			gThree.s \
			gFive.s

OBJS = $(SRCS:.c=.o)

OBJS_S = $(SRCS:.s=.o)

FLAGS = -O2

all: $(NAME)

$(NAME):
	@echo "\x1b[33m Preparing $(NAME)...\x1b[0m"
	@gcc -o $(NAME) $(SRCS) $(SRCS_S) $(FLAGS)
	@echo "\x1b[32m $(NAME) is ready!\x1b[0m"

clean:
	@rm -rf $(OBJS)

generateASM:
	clang -O2 -S -mllvm --x86-asm-syntax=intel gTwo.c
fclean: clean
	@rm -rf $(NAME)

re: fclean all

%.o: %.c
	@$(CC) $(FLAGS) -c $< -o $@

%.o	: %.s
	@nasm -f macho64 $<

.PHONY:	all clean fclean re