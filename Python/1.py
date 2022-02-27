# duration = int(input('Enter second: '))
# days = duration // 86400
# hours = (duration % 86400) // 3600
# minutes = ((duration % 86400) % 3600) // 60
# second = ((duration % 86400) % 3600) % 60
# print(' ', days, '- day\n', hours, '- hour\n', minutes, '- minutes\n', second, '- seconds')


cube_list = []
start_num = 0
finish_num = 1000
sum = 0
sum_all = 0
while start_num <= finish_num:
    start_num += 1
    if start_num % 2 != 0:
       cube_list.append(start_num ** 3)
for i in cube_list:
    while i != 0: # проверить правильность сложения
        sum = sum + i % 10
        i = i // 10
    if (sum % 7) == 0:
        sum_all += sum
print(cube_list)
print(sum_all)
