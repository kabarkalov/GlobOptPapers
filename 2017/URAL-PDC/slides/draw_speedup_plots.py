#!/usr/bin/env python
# -*- coding: utf-8 -*-

import numpy as np
import matplotlib.pyplot as plt

def main():
    pRange = np.array([1, 2, 4, 8, 16])

    s1 = (2.02 + 1.86 + 1.51 + 2.27 + 1.96) / 5
    s2 = (4.07 + 3.06 + 4.51 + 3.99 + 3.91) / 5
    s3 = (7.95 + 6.71 + 8.82 + 7.76 + 7.87) / 5
    s4 = (15.31 + 11.14 + 15.23 + 17.12 + 16.67) / 5

    sValues = np.array([1, s1, s2, s3, s4])

    s1 = (1.97 + 1.85 + 1.51 + 2.22 + 1.82) / 5
    s2 = (3.65+2.81+4.14+3.64+3.64) / 5
    s3 = (6.79+5.79+8.05+6.98+6.98) / 5
    s4 = (9.90+6.40+10.69+13.49+10.60) / 5

    sTValues = np.array([1, s1, s2, s3, s4])

    plt.xlabel('$p$')
    plt.ylabel('Avg. speedup')
    plt.plot(pRange[1:], sValues[1:], 'r-o', label = "Speedup in iterations")
    plt.plot(pRange[1:], sTValues[1:], 'g-x', label = "Speedup in time")
    plt.grid()
    plt.legend(loc = 'best', fontsize = 12)
    plt.savefig('./img/speedup.pdf', format = 'pdf', dpi = 200)
    plt.clf()

    plt.xlabel('$p$')
    plt.ylabel('Avg. efficiency')
    plt.plot(pRange, np.divide(sValues, pRange), 'r-o', label = "Efficiency in iterations")
    plt.plot(pRange, np.divide(sTValues, pRange), 'g-x', label = "Efficiency in time")
    plt.grid()
    plt.legend(loc = 'best', fontsize = 12)
    plt.savefig('./img/efficiency.pdf', format = 'pdf', dpi = 200)
    plt.clf()

if __name__ == '__main__':
    main()
