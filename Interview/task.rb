# С клавиатуры вводится последовательность чисел через пробел. Необходимо вычислить среднее арифметическое уникальных чисел и вывести его на печать.
# Под уникальностью подразумевается, что сколько бы раз ни встречалось число в последовательности, при расчете среднего арифметического оно будет учитываться только единожды.

print 'Введите массив: '
array = gets
  .split
  .map(&:to_f)
  .uniq

unless array.empty?
  puts array.join(' ')
  puts array.inject(&:+) / array.length
else
  puts 'Введите массив!'
end


# [1, 22, 33, 44].any? { |i| i.odd? }
array = [1, 22, 33, 44]
result = false
for el in array
  if el.odd?
    result = true
    break
  end
end


# [1, 22, 33, 44].all? { |i| i.odd? }
array = [1, 22, 33, 44]
result = true
for el in array
  unless el.odd?
    result = false
    break
  end
end
