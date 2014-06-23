from math import log


def print_sizes_for_n(n):
    nsquared = n ** 2
    ncubed = n ** 3
    nlgn = n * log(n)

    print("For the size of n: {}".format(n))
    print("n^2: {}".format(nsquared))
    print("n^3: {}".format(ncubed))
    print("nlgn: {}".format(nlgn))
