NAME		=	Grace

MAIN		=	Grace.s

KID			=	Grace_kid.s

SRC			=	Grace.s

OBJ			=	$(addprefix obj/, $(SRC:.s=.o))

PATH_OBJ	= obj/

.PHONY: all clean fclean re

all: $(NAME)

clean:
	@echo "\033[31m"
	rm -rf obj/

fclean: clean
	rm -f $(NAME)
	rm -f $(KID)

re: fclean all

obj:
	@echo "\033[36m"
	mkdir obj/

$(NAME): $(OBJ)
	@echo "\033[32m"
	ld -macosx_version_min 14.6.0 -lSystem -no_pie -o $@ $<

$(PATH_OBJ)%.o: %.s | $(PATH_OBJ)
	nasm -f macho64 $(MAIN) -o $@