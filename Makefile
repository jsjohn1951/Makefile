# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wismith <wismith@42ABUDHABI.AE>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/01/10 13:37:27 by wismith           #+#    #+#              #
#    Updated: 2022/02/12 17:53:39 by wismith          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = server

LIST = server.c assets/bit_server.c

HEADER = include/server.h

FT_PRINTF = assets/ft_printf

OBJ = $(LIST:.c=.o)

OPTION = -c -I $(HEADER)

FLAGS = -Wall -Werror -Wextra

all : $(NAME)

$(NAME) : $(OBJ) $(HEADER)
	make -C $(FT_PRINTF)
	cp $(FT_PRINTF)/libftprintf.a ./$(NAME)
	#mv libftprintf.a $(NAME)
	gcc -c $(FLAGS) $(OPTION) $(LIST)
	ar -rc $(NAME) $(OBJ)

%.o : %.c
	gcc $(FLAGS) -c $< -o $(<:%.c=%.o)

clean:
	rm -f $(OBJ)
	make clean -C $(FT_PRINTF)

fclean: clean
	rm -f $(NAME)
	rm -f $(FT_PRINTF)/libftprintf.a

re : fclean all

.PHONY : all clean fclean re