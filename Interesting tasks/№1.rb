def tabulate(array)
  if block_given?
    max = array.max
    array
      .sort
      .reduce("") { |acc, x| acc + "#{x}:\t#{(max + yield(x) + 1)**2}\n" }
  end
end

puts tabulate([5, 3, 1, 2, 4]) { |x| -x }
