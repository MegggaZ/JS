import sys

nums = []
for num in range(1, 10 ** 4 + 1, 2):
   nums.append(num ** 2)

print(type(nums), sys.getsizeof(nums), nums)

# n+n | for ... in ...

nums_gen = [num ** 2 for num in range(1, 4 + 1, 2)]
print(type(nums_gen), sys.getsizeof(nums_gen), nums_gen)
# print(type([1, 9]), sys.getsizeof([1, 9]), [1, 9])

# print(list(nums_gen))
# for i in nums_gen:
#    print(i)
#
# print(list(nums_gen))


# def nums_generator(max_num):
#    for num in range(1, max_num + 1, 2):
#        yield num ** 2
#
#
# nums_gen = nums_generator(10 ** 6)
# print(type(nums_gen), sys.getsizeof(nums_gen), nums_gen)
# print(sum(nums_gen))


# nums_cube_gen = (num ** 3 for num in range(5 + 1))
# nums_cube = list(nums_cube_gen)
# print(type(nums_cube), *nums_cube)
#


# nums_cube = [num ** 3 for num in range(10**3 + 1)]
# print(type(nums_cube),  nums_cube)
#
#
# weather_data = [
#    [-17.5, -18.9, -21.0, -16.1],
#    [-9.3, -11.7, -14.3, -15.8],
# ]
#
# flat_weather_data = []
# for row in weather_data:
#    for el in row:
#        flat_weather_data.append(el)
# print(flat_weather_data)
#
# flat_weather_data = [el for row in weather_data for el in row]
#
# flat_weather_data = [
#    el
#    for row in weather_data
#         for el in row
# ]


# nums_cube = {num: num ** 3 for num in range(1, 5 + 1)}
# print(nums_cube)
#
#
# eng_ru = {'may': 'май', 'june': 'июнь', 'july': 'июль'}
# ru_eng = {val: key for key, val in eng_ru.items()}
# print(ru_eng)
#
#
#
# basket = ['apple', 'samsung', 'apple', 'huawei', 'asus', 'samsung']
# unique_brands = [el for el in basket if basket.count(el) == 1]
# print(unique_brands)  # ['huawei', 'asus']
#
# unique_brands = set()
# tmp = set()
# for el in basket:
#    if el not in tmp:
#        unique_brands.add(el)
#    else:
#        unique_brands.discard(el)
#    tmp.add(el)
# print(unique_brands)

