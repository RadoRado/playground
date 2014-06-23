from input_info import print_sizes_for_n
import sys


def insert_sort(arr):
    operations = 0
    n = len(arr)

    for i in range(1, n):
        operations += 1
        j = i
        while j > 0 and arr[j - 1] > arr[j]:
            operations += 1
            temp = arr[j - 1]
            arr[j - 1] = arr[j]
            arr[j] = temp
            j = j - 1

    print_sizes_for_n(n)
    this_function_name = sys._getframe().f_code.co_name
    print("Total number of operations for {}: {}"
          .format(this_function_name, operations))
    return arr


def selection_sort(arr):
    operations = 0
    n = len(arr)

    for i in range(0, n):
        operations += 1
        for j in range(i, n):
            operations += 1
            if arr[i] > arr[j]:
                temp = arr[i]
                arr[i] = arr[j]
                arr[j] = temp

    print_sizes_for_n(n)
    this_function_name = sys._getframe().f_code.co_name
    print("Total number of operations for {}: {}"
          .format(this_function_name, operations))
    return arr

if __name__ == '__main__':
    # numbers from 1000 to 0 in decreasing order
    arr = list(range(1000, 0, -1))

    # passing the list as a value with list[:]
    insert_sort(arr[:])
    selection_sort(arr[:])
