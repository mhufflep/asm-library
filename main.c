/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mhufflep <mhufflep@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/24 18:24:43 by mhufflep          #+#    #+#             */
/*   Updated: 2021/04/04 17:22:00 by mhufflep         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <errno.h>

void	test_strdup_and_copy(const char *str, int len)
{
	char	*copy;
	char	*temp;

	copy = malloc(sizeof(char) * len);
	if (!copy)
		return ;
	printf("\n=============================================> strdup\n");
	temp = ft_strdup(str);
	printf("ft_strdup:|%s|\n", temp);
	free(temp);
	temp = strdup(str);
	printf("strdup:|%s|\n", temp);
	free(temp);
	printf("\n=============================================> strcpy\n");
	printf("ft_strcpy:|%s|\n", ft_strcpy(copy, str));
	printf("strcpy:|%s|\n", strcpy(copy, str));
}

void	clean_buf(char *buf, int len)
{
	while (--len >= 0)
	{
		buf[len] = '\0';
	}
}

void	test_read(void)
{
	char	buf[2000];
	int		fd;

	errno = 0;
	clean_buf(buf, 2000);
	fd = open("file", O_RDONLY);
	printf("\n=============================================> read\n");
	printf("| read(0, NULL, 1000)|return: %zd |", ft_read(0, &buf[0], 1000));
	printf("errno:%d\n", errno);
	printf("buf:%s\n", buf);
	printf("-----------------------------------------------\n\n");
	errno = 0;
	printf("| read(fd, NULL, 1000)|return: %zd |", ft_read(fd, &buf[0], 1000));
	printf("errno:%d\n", errno);
	printf("buf:%s\n", buf);
	printf("-----------------------------------------------\n\n");
	errno = 0;
	printf("| read(fd, NULL, 1000)|return: %zd |", ft_read(fd, NULL, 1000));
	printf("errno:%d\n", errno);
	printf("-----------------------------------------------\n\n");
	errno = 0;
	printf("| read(fd, buf, -1)|return: %zd |", ft_read(fd, buf, -1));
	printf("errno:%d\n", errno);
	printf("-----------------------------------------------\n\n");
}

void	test_write(const char *str)
{
	int			fd;
	int			res;
	int			len;

	len = ft_strlen(str);
	errno = 0;
	printf("\n=============================================> write\n");
	fd = open("file", O_CREAT | O_TRUNC | O_WRONLY, 0777);
	res = ft_write(fd, str, len);
	printf("| write(fd, str, len) | return: %d | ", res);
	printf("errno:%d\n", errno);
	printf("------------------------------------------------\n\n");
	errno = 0;
	res = ft_write(fd, NULL, len);
	printf("| write(fd, NULL, len) | return: %d | ", res);
	printf("errno:%d\n", errno);
	printf("------------------------------------------------\n\n");
	errno = 0;
	res = ft_write(fd, str, -1);
	printf("| write(fd, str, -1) | return: %d | ", res);
	printf("errno:%d\n", errno);
	printf("------------------------------------------------\n\n");
}

int	main(int argc, char **argv)
{
	int	len;

	if (argc >= 2)
	{
		len = ft_strlen(argv[1]) + 1;
		printf("\n=============================================> strlen\n");
		printf("ft_strlen:|%zu|\n", ft_strlen(argv[1]));
		printf("strlen:|%zu|\n", strlen(argv[1]));
		if (argc == 3)
		{
			printf("\n=============================================> strcmp\n");
			printf("ft_strcmp:|%i|\n", ft_strcmp(argv[1], argv[2]));
			printf("strcmp:|%i|\n", strcmp(argv[1], argv[2]));
		}
		test_strdup_and_copy(argv[1], len);
		test_write(argv[1]);
		test_read();
	}
	return (0);
}
