require_relative 'sorts'
require_relative 'timer'

# CONSTANTS
N_S = 1000
N_F = 20000
INCREMENT = 1000
M_TIMES = 10

def test_sorts
  puts 'sort times:'
  max_integer = (2**(0.size * 8 -2) -1)
  random_number_generator = Random.new
  array = []
  time_array = []
  i = N_S
  while i.to_i <= N_F
    sum_of_times = 0
    M_TIMES.times do
      i.times { array.push(random_number_generator.rand(0..max_integer)) }

      # uncomment sort calls as you would like to use them
      # you cannot run all sorts at once because of ruby's small stack
      time_taken = Timer.new
      time_taken.start
      # insertion_array = insertion_sort(array)
      # merge_array     = merge_sort(array, 0, array.length)
      quick_array     = quicksort(array, 0, array.length)
      sum_of_times += time_taken.stop

      time_taken.reset
      array = []
    end
    time_array.push(sum_of_times * 100) # divide by 10 and multiply by 1000 to get ms
    sum_of_times = 0
    i = i + INCREMENT
  end
  puts time_array
end

test_sorts
