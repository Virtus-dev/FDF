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

MLX42 = MLX42/libmlx42.a

INC = -I includes/ -I lib/libft/includes

LIBFT = lib/libft/libft.a

SRCS = ./src/main.c \

OBJS = ${SRCS:.c=.o}

OPENGL := -framework Cocoa -framework OpenGL -framework IOKit -I"/Users/arigonza/.brew/opt/glfw/include/" -lglfw -L"/Users/arigonza/.brew/opt/glfw/lib/"

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

all: $(MLX42) $(NAME)
	# @make -C $(NAME)

$(NAME): $(OBJS) $(LIBFT) $(MLX42)
	@echo "$(GREEN)Creating executable...$(DEF_COLOR)"
	@$(CC) $(CFLAGS) $(INC) -o $(NAME) $(OBJS) $(MLX42) $(OPENGL) $(LIBFT)

$(LIBFT):
	@echo "$(GREEN)Compiling libft...$(DEF_COLOR)"
	@make -C lib/libft

$(MLX42) :
	@make -C MLX42/

clean:
	@rm -rf $(OBJS)
	@make clean -C lib/libft
	@echo "$(RED)Objects cleaned..$(DEF_COLOR)"

fclean: clean
	@echo "$(RED)Deleting executables...$(DEF_COLOR)"
	@rm -rf $(NAME)
	@make fclean -C lib/libft
	@make fclean -C MLX42/


re: fclean all

.PHONY: all, clean, fclean, re, minilibx