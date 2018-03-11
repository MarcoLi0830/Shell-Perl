#!/usr/bin/python3

assert(len(sys.argv[1:]) % 2 == 1)
numbers = [int(a) for a in sys.argv[1:]]
sorted_numbers = sorted(numbers)
median_index = len(sorted_numbers) // 2
median_number = sorted_numbers[median_index]
print(median_number)

