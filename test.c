#include "libasm.h"
#include "libasm_bonus.h"

#include <stdio.h>
#include <stdlib.h>

int	ft_strcmp(const char *s1, const char *s2)
{
	while (*s1 != '\0' && *s2 != '\0' && *s1 == *s2 && s1++)
		s2++;
	return (*(unsigned char *)s1 - *(unsigned char *)s2);
}
void	ft_lstadd_back(t_list **lst, t_list *new)
{
	t_list	*tmp;

	if (lst && *lst)
	{
		tmp = *lst;
		while (tmp->next)
			tmp = tmp->next;
		tmp->next = new;
	}
	else
		*lst = new;
}

t_list	*ft_lstnew(void *content)
{
	t_list	*new;

	new = malloc(sizeof(t_list));
	if (!new)
		return (NULL);
	new->next = NULL;
	new->data = content;
	return (new);
}

int main(int argc, char *argv[])
{
	// char *line = "123";
	// char *base = "12345";

	// int res = ft_atoi_base(line, base);

	// printf("res: %d\n", res);
	t_list *head;
	t_list *new;
	int i;

	i = 0;
	while (i < 3)
	{
		new = ft_lstnew("1");
		ft_lstadd_back(&head, new);
		i++;
	}
	ft_list_remove_if(&head, "1", ft_strcmp, free);
	// pri();
	return (0);
}