/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mhufflep <mhufflep@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/24 18:24:43 by mhufflep          #+#    #+#             */
/*   Updated: 2021/03/24 18:24:46 by mhufflep         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <errno.h>

#define GREEN	"\033[32m"
#define DEFAULT	"\033[0m"

void checkDup(const char *title, const char *str)
{
	char *myStr;
	char *stdStr;
	
	myStr = ft_strdup(str);
	stdStr = strdup(str);
	
	printf("\n%s str:\n", title);
	printf("my:\t|%s|\n", myStr);
	printf("std:\t|%s|\n", stdStr);
	
	free(myStr);
	free(stdStr);
}

void checkRead(ssize_t (*func)(int, void *, size_t), const char *title)
{
	char	buffer[2000] = {'\0'};
	int		fd;
	
	printf("%s%s%s:\n", GREEN, title, DEFAULT);
	
	printf("########Normal output#########\n");
	
	fd = 0;
	printf("return: %zd\n", func(fd, buffer, 1000));
	printf("buf:%s", buffer);
	printf("errno:%d\n", errno);

	printf("##############################\n\n");

	printf("#NULL as the second parameter#\n");
	printf("\nreturn: %zd\n", func(fd, NULL, 1000));
	printf("errno:%d\n", errno);
	printf("##############################\n\n");
	
	printf("length = -1 as third parameter\n");	
	printf("return: %zd\n", func(fd, buffer, -1));
	printf("errno:%d\n", errno);
	printf("##############################\n\n");	
	
	printf("##fd = 42 as first parameter##\n");
	fd = 42;
	printf("return: %zd\n", func(fd, buffer, 1000));
	printf("errno:%d\n", errno);
	printf("##############################\n\n");
	
	printf("########Normal output#########\n");
	fd = open("test", O_RDONLY);	
	printf("return: %zd\n", func(fd, buffer, 1000));
	printf("buf:%s\n", buffer);
	printf("##############################\n\n");

	if (fd != 0 && fd != 1 && fd != 2)
		close(fd);
}

void checkWrite(ssize_t (*func)(int, const void *, size_t), const char *str, const char *title)
{
	int			fd;
	int			res;
	int			len;

	len = ft_strlen(str);
	len = (len == 0) ? 0 : len - 1;
	
	printf("%s%s%s:\n", GREEN, title, DEFAULT);
	
	fd = 1;
	printf("#########Normal input#########\n");
	res = func(fd, str, len);
	printf("\nreturn: %d\n", res);
	printf("errno:%d\n", errno);
	printf("##############################\n\n");	
	
	printf("#NULL as the second parameter#\n");
	res = func(fd, NULL, len);
	printf("\nreturn: %d\n", res);
	printf("errno:%d\n", errno);
	printf("##############################\n\n");

	printf("length = -1 as third parameter\n");
	res = func(fd, str, -1);
	printf("\nreturn: %d\n", res);
	printf("errno:%d\n", errno);
	printf("##############################\n\n");
	
	printf("##fd = 42 as first parameter##\n");
	fd = 42;
	res = func(fd, str, 0);
	printf("\nreturn: %d\n", res);
	printf("errno:%d\n", errno);
	printf("##############################\n\n");
	
	printf("#########Normal input#########\n");
	fd = open("test", O_CREAT | O_TRUNC | O_WRONLY, 0777);
	errno = 0;
	res = func(fd, str, len);
	printf("\nreturn: %d\n", res);
	printf("errno:%d\n", errno);
	printf("##############################\n");
	
	if (fd != 0 && fd != 1 && fd != 2)
		close(fd);
}

int main()
{
	char *emptyStr = "";
	char *longStr = "otLoFNH3a1trmQhKaLk7KuicLspeu3VIUGuO5euFtNMlGrXPtXMgbhBe4S6ztifCao7LksZGQObB35eEzEpf9Mg5JqGz0zOaiMA6mlLoB9ox2zQkZsF7oNRqG5vGkcbxWOEOBhg57eYq1rbBxuFnheqpeSGoJP6ipmtu8Z6GZCEo3qEwvAluEv0eeLgVgxFJhyxDUOtBdlTkKqxUZAiS51uIIlYqgZIz4VAkLv8EtuYEya6D2HoC3t1xlonFAF8L47Se6ypni2Ugu9BhAxDn3LjIbcODdP9GbJ8TqEKp8nNUQSOzMrlB4Ypd0ZtTLn7Bd4ULNXygXoowhwCtyR25mwTfKbqKe7Q8JGQVJQltnDktNlPLD8Rn5ajqnBnXJh2HBc8d2xkWCESxAvOKVk7OczrO8pDYOVznt2auplPP8bj24uDOrdAVzlxh2jFL8DOukoTrSyYerS8GbgKp0QoWsrqJWUDZFXHsNUx0D5aNFcO6dGuYyhZzvnGNjTEhl7WwpG2wZzIpaMNz8Y8yy1Zdt0zhR0E6UwFycQuw9DUjIph9LxzT8VRfQNuQQvkzQdRiertQitqPQ69zL4nRKKXEejgTX4t3ZmDXJqVGG9YzWG93uwb5ebixaD0xtx18F3xWHSCoXXJo5MEwNHzYjuj1v8XcvAYNbSMLnp6UTJfRNpcNUmm1aUjYsc3yqEwb6Hx38bJn7vRP9KbdkIiRVlAzJTteHqdgirGtZWqxkvjen7ivGRwAuvjiLnHQN04I7FwO5OL3e4sMwEarCz0MeqmRPkAGQewsAoPMVBsblmI6GdazjeuEyHAMm6huXXQoTBrIGEnIGum4C8CVHNnZRpfZ4qiHK05hErs1wnBRUL6DDrusWlTctzoEC2V4hpvl7kYI5fjnkFYxcqtXOA2aEb2z835aXXnrw59HIX6mxBWiDMXrFgRzVH4I69n1xFWnTqQSyFyqyElal5WBvAtWsmoz6tD61lsCcZbbIVkQ";
	char *customStr = "testing libasm functions";
	int longStrLength;
	int emptyStrLength;
	int customStrLength;
	
	/*
	************************* strlen *************************
	*/
	emptyStrLength = ft_strlen(emptyStr) + 1;
	longStrLength = ft_strlen(longStr) + 1;
	customStrLength = ft_strlen(customStr) + 1;
	
	printf("\n--------------%sft_strlen%s--------------\n", GREEN, DEFAULT);
	printf("\t|my\t|std\t|\n");
	printf("long:\t|%i\t|%zu\t|\n", longStrLength, strlen(longStr) + 1);
	printf("empty:\t|%i\t|%zu\t|\n", emptyStrLength, strlen(emptyStr) + 1);
	printf("custom:\t|%i\t|%zu\t|\n", customStrLength, strlen(customStr) + 1);
	
	/*
	************************* strcpy *************************
	*/
	char myLongCopy[longStrLength];
	char stdLongCopy[longStrLength];
	char myEmptyCopy[emptyStrLength];
	char stdEmptyCopy[emptyStrLength];
	char myCustomCopy[longStrLength];
	char stdCustomCopy[longStrLength];

	printf("\n--------------%sft_strcpy%s--------------\n", GREEN, DEFAULT);
	printf("\nlong str:\n");
	printf("my:\t|%s|\n", ft_strcpy(myLongCopy, longStr));
	printf("std:\t|%s|\n", strcpy(stdLongCopy, longStr));
	
	printf("\nempty str:\n");
	printf("my:\t|%s|\n", ft_strcpy(myEmptyCopy, emptyStr));
	printf("std:\t|%s|\n", strcpy(stdEmptyCopy, emptyStr));

	printf("\ncustom str:\n");
	printf("my:\t|%s|\n", ft_strcpy(myCustomCopy, customStr));
	printf("std:\t|%s|\n", strcpy(stdCustomCopy, customStr));
	
	/*
	************************* strcmp *************************
	*/
	printf("\n--------------%sft_strcmp%s--------------\n", GREEN, DEFAULT);
	printf("\t|my\t|std\t|\n");
	printf("long:\t|%i\t|%i\t|\n", ft_strcmp(longStr, myLongCopy), strcmp(longStr, stdLongCopy));
	printf("empty:\t|%i\t|%i\t|\n", ft_strcmp(emptyStr, myEmptyCopy), strcmp(emptyStr, stdEmptyCopy));
	printf("custom:\t|%i\t|%i\t|\n", ft_strcmp(customStr, myCustomCopy), strcmp(customStr, stdCustomCopy));
	printf("custom:\t|%i\t|%i\t|\n", ft_strcmp(customStr, emptyStr), strcmp(customStr, emptyStr));
	printf("custom:\t|%i\t|%i\t|\n", ft_strcmp(emptyStr, customStr), strcmp(emptyStr, customStr));
	
	/*
	************************* strdup *************************
	*/
	printf("\n--------------%sft_strdup%s--------------\n", GREEN, DEFAULT);
	checkDup("long", longStr);
	checkDup("empty", emptyStr);
	checkDup("custom", customStr);
	
	/*
	************************* write *************************
	*/
	printf("\n--------------%sft_write%s--------------\n", GREEN, DEFAULT);	
	// checkWrite(write, customStr, "standard write");
	checkWrite(ft_write, customStr, "my write");

	/*
	************************* read *************************
	*/
	printf("\n--------------%sft_read%s--------------\n", GREEN, DEFAULT);
	// checkRead(read, "standard read");
	checkRead(ft_read, "my read");
	printf("\n------------------------------------\n");
	return (0);
}
