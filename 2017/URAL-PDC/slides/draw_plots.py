#!/usr/bin/env python
# -*- coding: utf-8 -*-

import numpy as np
import matplotlib.pyplot as plt

def find_max(f, a, b, eps = 0.001):
    n = int((b - a) / eps + 1 )

    max_val = np.finfo(float).min

    for i in range(n):
        x = a + i*eps
        max_val = max(max_val, f(x))

    return max_val

def main():

    grid = np.linspace(-1, 3, 40)
    pareto = np.linspace(0, 2, 20)
    f1_values = np.power(grid, 2)
    f2_values = np.power(grid - 2, 2)

    plt.xlabel('$x$')
    plt.plot(grid, f1_values, 'r--', label='$f_1(x)$')
    plt.plot(grid, f2_values, 'g-', label='$f_2(x)$')
    plt.plot(pareto, [0]*len(pareto), 'c-o', label='Slater set')
    plt.grid()
    plt.legend(loc = 'best', fontsize = 12)
    plt.savefig('./img/objectives.pdf', format = 'pdf', dpi = 200)
    plt.clf()

    phi = lambda x: find_max(lambda y: min(x**2 - y**2, (x - 2)**2 - (y - 2)**2), -1, 3)
    vec_phi = np.vectorize(phi)

    plt.xlabel('$x$')
    plt.plot(grid, f1_values, 'r--', label='$f_1(x)$')
    plt.plot(grid, f2_values, 'g-', label='$f_2(x)$')
    plt.plot(grid, vec_phi(grid), 'b-x', label='$\\varphi(x)$')
    plt.grid()
    plt.legend(loc = 'best', fontsize = 12)
    plt.savefig('./img/phi_func.pdf', format = 'pdf', dpi = 200)

if __name__ == '__main__':
    main()
