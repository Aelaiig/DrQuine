NAME		=	Colleen

MAIN		=	Colleen.c

SRC			=	Colleen.c

OBJ			=	$(addprefix obj/, $(SRC:.c=.o))

PATH_OBJ	= obj/

.PHONY: all clean fclean re

all: $(NAME)

clean:
	@echo "\033[31m"
	rm -rf obj/

fclean: clean
	rm -f $(NAME)

re: fclean all

obj:
	@echo "\033[36m"
	mkdir obj/

$(NAME): $(OBJ)
	@echo "\033[32m"
	gcc -Wall -Wextra -Werror $(MAIN) -o $@

$(PATH_OBJ)%.o: %.c | $(PATH_OBJ)
	gcc -Wall -Wextra -Werror -c $< -o $@