/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm_bonus.h                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mhufflep <mhufflep@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/01/12 08:00:39 by mhufflep          #+#    #+#             */
/*   Updated: 2021/05/09 12:07:32 by mhufflep         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_BONUS_H
# define LIBASM_BONUS_H

# include <unistd.h>

typedef struct s_list
{
	void			*data;
	struct s_list	*next;
}					t_list;


int		ft_atoi_base(char *str, char *base);
int		ft_list_size(t_list *begin_list);
void	ft_list_push_front(t_list **begin_list, void *data);
void	ft_list_sort(t_list **begin_list, int (*cmp)());
void	ft_list_remove_if(t_list **, void *, int (*)(), void (*)(void *));

#endif
