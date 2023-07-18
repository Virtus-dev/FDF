/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: arigonza <arigonza@student.42malaga.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/07/12 16:05:26 by arigonza          #+#    #+#             */
/*   Updated: 2023/07/18 12:09:38 by arigonza         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

//#include "../lib/minilibx-linux/mlx.h"
//#include "../lib/libft/includes/libft.h"
//#include "../lib/libft/includes/get_next_line.h"
//#include "../lib/libft/includes/ft_printf.h"
#include "../includes/fdf.h"

int		main(int argc, char **argv)
{
   // t_map	*map;
    (void)argv;
    void	*mlx_ptr;
    void    *win_ptr;

    mlx_init();

    if (argc != 2)
    {
        ft_putstr("Usage: ./fdf <filename>\n");
        return (0);
    }
   // map = ft_read_map(argv[1]);
    mlx_ptr = mlx_init();
    win_ptr = mlx_new_window(mlx_ptr, WIDTH, HEIGHT, "FdF");
    (void)win_ptr;
    //ft_draw_map(map, mlx_ptr);
    mlx_loop(mlx_ptr);
    return (0);
}
