require 'joe_utils'

include FilesHelper

PATH = './QuickSort.txt'
@comparison_count = 0

def swap(index_one, index_two, array)
  mem = array[index_one]
  array[index_one] = array[index_two]
  array[index_two] = mem
end

def count_median(index_one, index_two, index_three, array)
  print "Counting median from #{index_one}, #{index_two} and #{index_three}, array size is #{array.size}. Result is: "
  if array[index_one] < array[index_two]
    if array[index_one] < array[index_three]
      median = array[index_two] < array[index_three] ? index_two : index_three
    else
      median = index_one
    end
  else
    if array[index_two] < array[index_three]
      median = array[index_one] < array[index_three] ? index_one : index_three
    else
      median = index_two
    end
  end
  puts array[median]
  median
end

def count_comparisons(array)
  size = array.size
  return array if size < 2
  if size == 2
    @comparison_count += 1
    return array if array[0] < array[1]
    return [array[1], array[0]]
  end
  median = size % 2 == 0 ? count_median(0, size / 2 - 1, -1, array) : count_median(0, (size / 2).round, -1, array)
  swap(median, 0, array)
  pivot = array[0]; i = 1; j = 1
  @comparison_count += size - 1
  while j < size
    if pivot > array[j]
      swap(i, j, array)
      i += 1
      j += 1
    else
      j += 1
    end
  end
  # puts array.size
  if i - 1 == 0
    [array[0]] + count_comparisons(array[1..-1])
  elsif i == size - 1
    swap(i - 1, 0, array)
    count_comparisons(array[0..(i-2)]) + [array[i-1]]
  else
    swap(i - 1, 0, array)
    count_comparisons(array[0..(i-2)]) + [array[i-1]] + count_comparisons(array[i..-1])
  end
end

def read_input(path)
  array = []
  text = load_file_text(path)
  text.scan(/\d+/) { |str| array << str.to_i }
  array
end

count_comparisons(read_input(PATH))

puts "There were #{@comparison_count} comparisons."