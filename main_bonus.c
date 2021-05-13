/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main_bonus.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mhufflep <mhufflep@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/24 18:24:43 by mhufflep          #+#    #+#             */
/*   Updated: 2021/05/14 00:33:46 by mhufflep         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include "libasm_bonus.h"

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <errno.h>

void 	lstprint(t_list *lst)
{
	printf("list: ");
	while (lst)
	{
		if (lst->data)
			printf("%s", lst->data);
		lst = lst->next;
	}
	printf("\n");
}

void	ft_free(void *ptr)
{
	if (ptr)
		free(ptr);
}

void	atoi_base_test(void)
{
	printf("num: %d\n", ft_atoi_base("-+101", "01"));
	printf("num: %d\n", ft_atoi_base("-+-101", "01"));
	printf("num: %d\n", ft_atoi_base("++++377", "01234567"));
	printf("num: %d\n", ft_atoi_base("ffeeff", "0123456789abcdef"));
	printf("num: %d\n", ft_atoi_base("--------", "asd"));
}

int	main(void)
{
	t_list	*head;
	int		size;

	head = NULL;
	ft_list_push_front(&head, ft_strdup("3"));
	ft_list_push_front(&head, ft_strdup("1"));
	ft_list_push_front(&head, ft_strdup("4"));
	ft_list_push_front(&head, ft_strdup("2"));
	lstprint(head);
	ft_list_sort(&head, ft_strcmp);
	lstprint(head);
	size = ft_list_size(head);
	printf("size: %d\n", size);
	ft_list_remove_if(&head, "2", ft_strcmp, ft_free);
	lstprint(head);
	ft_list_remove_if(&head, "3", ft_strcmp, ft_free);
	lstprint(head);
	ft_list_remove_if(&head, "5", ft_strcmp, ft_free);
	lstprint(head);
	atoi_base_test();
	return (0);
}
