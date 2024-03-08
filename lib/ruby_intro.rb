# frozen_string_literal: true

# Part 1

def sum(arr)
  arr.sum
end

def max_2_sum(arr)
  return arr[0] if arr.length == 1
  return 0 if arr.empty?

  sorted_arr = arr.sort.reverse
  sorted_arr[0] + sorted_arr[1]
end

# Define sum_to_n? method at the top level
def sum_to_n?(arr, num)
  return false if arr.length < 2

  # Use a hash to store elements as we iterate through the array
  elements_seen = {}

  arr.each do |element|
    # Calculate the difference needed to reach the target sum
    difference = num - element

    # Check if the difference is present in the hash
    return true if elements_seen[difference]

    # Add the current element to the hash
    elements_seen[element] = true
  end

  # If no pair is found, return false
  false
end

# Part 2

def hello(name)
  "Hello, #{name}"
end

def starts_with_consonant?(str)
  # Check if the string is empty
  return false if str.empty?

  # Check if the first character is a consonant using a regular expression
  /^[^aeiou\W]/i.match?(str)
end

def binary_multiple_of_4?(str)
  # Check if the string is a valid binary number
  return false unless str.match?(/\A[01]+\z/)

  # Convert the binary string to an integer
  decimal_number = str.to_i(2)

  # Check if the decimal number is a multiple of 4
  (decimal_number % 4).zero?
end

# Part 3

# Class representing a book with ISBN and price
class BookInStock
  attr_accessor :isbn, :price

  # Constructor
  def initialize(isbn, price)
    raise ArgumentError, 'ISBN cannot be empty' if isbn.empty?
    raise ArgumentError, 'Price should be greater than zero' if price <= 0

    @isbn = isbn
    @price = price
  end

  # Method to format price as string
  def price_as_string
    format('$%.2f', @price)
  end
end
