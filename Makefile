NAME = testProject

SRCS =	main.c \
		gTwo.c \
		gThree.c \
		gFive.c

OBJS = $(SRCS:.c=.o)

FLAGS = -O3

all: $(NAME)

$(NAME):
	@echo "\x1b[33m Preparing $(NAME)...\x1b[0m"
	@gcc -o $(NAME) $(SRCS) $(FLAGS)
	@echo "\x1b[32m $(NAME) is ready!\x1b[0m"

clean:
	@rm -rf $(OBJS)

fclean: clean
	@rm -rf $(NAME)

re: fclean all

%.o: %.c
	@$(CC) $(FLAGS) -c $< -o $@

.PHONY:	all clean fclean re