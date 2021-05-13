.PHONY: all clean fclean re dir bonus

NAME = libasm.a

NASM = nasm
NASM_FLAGS = -f macho64

OBJ_DIR = obj
SRC_DIR = src

SRCS		=	ft_read.s \
				ft_write.s \
				ft_strlen.s	\
				ft_strdup.s \
				ft_strcpy.s \
				ft_strcmp.s \

BONUS_SRCS	= 	ft_list_size_bonus.s \
				ft_atoi_base_bonus.s \
				ft_list_sort_bonus.s \
				ft_list_remove_if_bonus.s \
				ft_list_push_front_bonus.s \

HEADERS = libasm.h 

ifdef BONUS
	OBJ = $(addprefix $(OBJ_DIR)/, $(SRCS:.s=.o))
	OBJ += $(addprefix $(OBJ_DIR)/, $(BONUS_SRCS:.s=.o))
	HEADERS += libasm_bonus.h
else
	OBJ = $(addprefix $(OBJ_DIR)/, $(SRCS:.s=.o))
endif

all: dir $(NAME)

run:
	gcc main.c $(NAME)
	
runb:
	gcc main_bonus.c $(NAME)

dir:
	@mkdir -p $(OBJ_DIR)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s
	$(NASM) $(NASM_FLAGS) $< -o $@

$(NAME): $(OBJ) $(HEADERS)
	ar rcs $(NAME) $?

clean:
	rm -rf $(OBJ_DIR)

fclean: clean
	rm -f $(NAME)

bonus:
	$(MAKE) BONUS=1 --no-print-directory

re: fclean all

