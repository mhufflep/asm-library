# Asm-library
### _Reproduction of some C standard functions used for working with C-style strings and lists in assembler (NASM)_

## Description:
Basic part of the lib contains the following functions: </br>

```c 
size_t  ft_strlen(const char *str);

char   *ft_strdup(const char *str);

char   *ft_strcpy(char *dst, const char *src);

ssize_t ft_read(int fd, void *buffer, size_t length);

int     ft_strcmp(const char *str1, const char *str2);

ssize_t ft_write(int fd, const void *buffer, size_t length);

```

Additional part uses the following struct:

```c
typedef struct        s_list
{
    void              *data;
    struct s_list     *next;
}                     t_list;
```
* Field `data` can store any type </br>
* Field `next` refers to the next element of the list </br>

It also contain these functions to work with the list:

```c
int   ft_atoi_base(char *str, char *base);

int   ft_list_size(t_list *begin_list);

void  ft_list_push_front(t_list **begin_list, void *data);

void  ft_list_sort(t_list **begin_list, int (*cmp)());

void  ft_list_remove_if(t_list **begin_list, void *data, int (*cmp)(), void (*free_ctl)(void *));

```

## Creation:
Use **`make`** or **`make -C <path_to_libdir>`** to compile basic part of a lib. </br>
If you want create library with additional part, you should use **`make bonus`**

## Using examles:
Compiling with .c/.o/.s files: </br>
* `gcc test.c -L <path_to_lib> -lasm -I <path_to_lib>`</br>

* `gcc test.o <path_to_lib>/libasm.a` </br>

## Run test:
Use **`make run`** or **`make runb`** to compile library with test main function. </br>
To run test type **`./a.out`** and pass them 2 or 3 args:
* `./a.out "hello"` will test all basic functions except strcmp </br>

* `./a.out "hello" "world"` will test all basic functions including strcmp
