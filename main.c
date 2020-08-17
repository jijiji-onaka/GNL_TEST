/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tjinichi <tjinichi@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/08/17 17:08:22 by tjinichi          #+#    #+#             */
/*   Updated: 2020/08/17 17:20:15 by tjinichi         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "get_next_line.h"
#include <fcntl.h>
#include <string.h>

int main(int argc, char *argv[])
{
    int ret;
    int fd;
    char *filename;
    char *line;

    if (argc != 2)
        return (0);
    filename = argv[1];
    // printf("%s\n", filename);
    if (strncmp(filename, "input", 6) == 0)
        fd = 0;
    else
        fd = open(filename, O_RDONLY);
    while ((ret = get_next_line(fd, &line)) > 0)
    {
        printf("return : %d | line = %s\n", ret, line);
        free(line);
    }
    printf("return : %d | line = %s\n", ret, line);
    free(line);
    if (fd != 0) 
        close(fd);
    return (0);
}