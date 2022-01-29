# Дана строка, состоящая из слов, разделенных одним пробелом. Определить n-ое слово, не содержащее цифр.

print "Введите строку: "
array = gets.chomp.split

new_array = array.reject do |word|
  word.split('').any? { |letter| letter.to_i.to_s == letter }
end

unless new_array.empty?
  print "Введите число n: "
  n = gets.to_i

  unless new_array.length >= n - 1
    puts "Число n больше или равно, чем длина массива"
  else
    puts new_array[n - 1]
  end
else
  puts "Итоговый массив пустой"
end
