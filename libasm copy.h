/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mhufflep <mhufflep@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/01/12 08:00:39 by mhufflep          #+#    #+#             */
/*   Updated: 2021/05/14 00:30:43 by mhufflep         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H

# include <unistd.h>

size_t	ft_strlen(const char *str);
char	*ft_strdup(const char *str);
char	*ft_strcpy(char *dst, const char *src);
ssize_t	ft_read(int fd, void *buffer, size_t length);
int		ft_strcmp(const char *str1, const char *str2);
ssize_t	ft_write(int fd, const void *buffer, size_t length);

#endif
