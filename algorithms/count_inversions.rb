require 'joe_utils'

include FilesHelper

PATH = './IntegerArray.txt'

@inversion_count = 0

def count_split_inversions(first_half, second_half)
  i = 0; j = 0; result = []; first_half_size = first_half.size; second_half_size = second_half.size
  while i < first_half_size && j < second_half_size
    if first_half[i] > second_half[j]
      result << second_half[j]
      j += 1
      @inversion_count += first_half_size - i
    else
      result << first_half[i]
      i += 1
    end
  end
  if i < first_half_size
    result + first_half[i..-1]
  elsif j < second_half_size
    result + second_half[j..-1]
  else
    result
  end
end

def count_inversions(array)
  size = array.size
  if size == 1
    array
  else
    half_index = (size / 2.0).round
    first_half = count_inversions(array[0..(half_index - 1)])
    second_half = count_inversions(array[half_index..-1])
    count_split_inversions(first_half, second_half)
  end
end

def read_input(path)
  array = []
  text = load_file_text(path)
  text.scan(/\d+/) { |str| array << str.to_i }
  array
end

count_inversions(read_input(PATH))

puts "There were #{@inversion_count} inversions."