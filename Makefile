# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tjinichi <tjinichi@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/17 17:08:16 by tjinichi          #+#    #+#              #
#    Updated: 2020/08/17 17:23:14 by tjinichi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = a.out
CC = gcc
CFLAG = -Wall -Werror -Wextra

SRCS = get_next_line.c get_next_line_utils.c
INC = get_next_line.h
MAIN = main.c
OBJS = ${SRCS:.c=.o}
.c.o:
	$(CC) $(CFLAGS) -D BUFFER_SIZE=1024 -c $<  -o $@

all: $(NAME)

$(NAME)	: $(OBJS)
	$(CC) $(CFLAGS) $(MAIN) $(OBJS) -o $(NAME)

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re:	fclean all

norm:
	norminette $(SRCS) $(INC)

ARG = foo

run: $(NAME)
	./$(NAME) $(ARG)