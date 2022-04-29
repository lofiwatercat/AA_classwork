# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
  max = num_1 * num_2
  multiples_1 = [1]
  multiples_2 = [1]
  counter_1 = 1
  counter_2 = 1

  while multiples_1[-1] <= max
    multiples_1 << num_1 * counter_1
    counter_1 += 1
  end

  while multiples_2[-1] <= max
    multiples_2 << num_2 * counter_2
    counter_2 += 1
  end

  result = multiples_1 & multiples_2
  result[1]
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
  bigrams = []
  counts = Hash.new(0)
  (0...str.length - 1).each do |i|
    bigrams << str[i..i+1]
  end

  bigrams.each do |el|
    counts[el] += 1
  end

  counts.max_by{|k, v| v}[0]
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
      inverted = {}
      self.each do |k, v|
        inverted[v] = k
      end

      inverted
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
      counter = 0

      length = self.length

      (0...length - 1).each do |i|
        (i...length).each do |j|
          counter += 1 if (self[i] + self[j]) == num
        end
      end

      counter
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
      prc ||= Proc.new { |x, y| x <=> y }

      sorted = false
      length = self.length

      while !sorted
        copy = self.clone
        (0...length - 1).each do |i|
          if prc.call(self[i], self[i + 1]) == 1
            self[i], self[i + 1] = self[i + 1], self[i]
          end
        end
        if copy == self
          sorted = true
        end
      end

      self
    end
end
