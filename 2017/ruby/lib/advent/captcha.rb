
module Advent
  class Captcha

    def initialize
      @accumulator = []
    end

    def self.calculate(digits)
      new(calculate(digits))
    end

    def calculate(digits)
      raise InvalidInputError unless digits.is_a? Integer
      calculate_captcha digits
    end

    def calculate_captcha(digits)
      splits = splitter(digits)
      separated = sequentially_awesome(splits)
      captcha_sum(separated)
    end

    def splitter(digits)
      String(digits).split('').map {|i| Integer(i) }
    end

    ##
    # Checks an array of integers; returns those elements of the array where
    # the value of the element matches the following element.
    #
    # For the last element of the array, the comparator is the first element of
    # the array. E.g., [1,2,3,1] will return [1] because the only matching elements
    # are the last element -- a 1 -- and the first element -- also a 1.
    #
    # This implementation recurses in reverse order through the array initially
    # passed into it. The last variable is only initialized after the first call
    # so we use it to see whether the method is being called for the first time
    # (i.e., it is nil).

    def sequentially_awesome(digits, last = nil)
      return @accumulator if digits.empty?

      element = digits.pop

      # if last is nil, that means sequentially_awesome is being called on an
      # array of integers for the first time, so we need to compare the value to
      # the first element of the digits array.
      #
      # The else clause is the default method of comparing, where we care whether
      # the element has the same value as the digit that followed it in the array,
      # which value was set in the last variable by the method during the previous
      # call in the call stack.
      if last.nil?
        @accumulator.push(element) if element == digits.first
      else
        @accumulator.push(element) if element == last
      end

      sequentially_awesome(digits, element)
    end

    def captcha_sum(digits)
      if digits.empty?
        0
      else
        digits.sum
      end
    end
  end

  class InvalidInputError < StandardError; end
end
