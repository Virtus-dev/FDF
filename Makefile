# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: arigonza <arigonza@student.42malaga.com>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/10 17:05:36 by arigonza          #+#    #+#              #
#    Updated: 2023/07/10 17:05:37 by arigonza         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= fdf
CC		= gcc
CFLAGS = -Wextra -Wall -Werror
MINILIBX_DIR = ./lib/minilibx-linux

INC = -I includes/ -I$(MINILIBX_DIR) -I lib/libft/includes
MINILIBX = $(MINILIBX_DIR)/libmlx.a
MINILIBXCC = -I mlx -L $(MINILIBX_DIR) -lmlx
#OPENGL = -framework OpenGL -framework AppKit

LIBFT = lib/libft/libft.a

SRCS = ./src/main.c \

OBJS = ${SRCS:.c=.o}

# Colors

DEF_COLOR = \033[0;39m
GRAY = \033[0;90m
RED = \033[0;91m
GREEN = \033[0;92m
YELLOW = \033[0;93m
BLUE = \033[0;94m
MAGENTA = \033[0;95m
CYAN = \033[0;96m
WHITE = \033[0;97m

all: $(minilibx) $(NAME)
	@make -C $(NAME)

$(NAME): $(OBJS) $(LIBFT) $(MINILIBX)
	@echo "$(GREEN)Creating executable...$(DEF_COLOR)"
	@$(CC) $(CFLAGS) $(INC) -o $(NAME) $(OBJS) $(MINILIBXCC) $(OPENGL) $(LIBFT)

$(MINILIBX):
	@make -C $(MINILIBX_DIR)
	@echo "$(GREEN)Minilibx compiled$(DEF_COLOR)"

$(LIBFT):
	@echo "$(GREEN)Compiling libft...$(DEF_COLOR)"
	@make -C lib/libft

clean:
	# @make clean -C $(MINILIBX_DIR)
	@rm -rf $(OBJS)
	@make clean -C lib/libft
	@echo "$(RED)Objects cleaned..$(DEF_COLOR)"

fclean: clean
	@echo "$(RED)Deleting executables...$(DEF_COLOR)"
	@rm -rf $(NAME)
	@make fclean -C lib/libft

re: fclean all

.PHONY: all, clean, fclean, re, minilibx