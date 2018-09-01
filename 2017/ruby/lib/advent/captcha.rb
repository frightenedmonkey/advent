
module Advent
  class InvalidInputError < StandardError; end

  class CaptchaCalculator
    attr_accessor :digits, :accumulator

    def initialize(digits)
      @digits = digits
      @accumulator = []
    end

    def self.calculate!(digits)
      raise InvalidInputError unless digits.is_a? Array
      new(digits)
        .uniquify!
        .sum
    end

    ##
    # uniquify! builds the accumulator array by comparing each element of the
    # digits array with the element after it sequentially. The exception is that
    # the last element of the digits array is compared with first element for
    # inclusion in the accumulator.
    #
    # For example, if [1,2,3,1] is uniquified, then the accumulator value will
    # be [1]. For [1,1,2,2], the accumulator value will be [1,2].
    #
    # If the last var is nil, then we know that this was the first frame on the
    # call stack. As such, we have to compare the element we're comparing to the
    # first element of the digits array because we are recursing through the digits
    # array in reverse order.

    def uniquify!(last = nil)
      # returning self when we're done recursing through the digits allows
      # us to chain the #sum method in the calculate! class method
      return self if digits.empty?
      element = @digits.pop

      if last.nil?
        @accumulator.push(element) if element == @digits.first
      else
        @accumulator.push(element) if element == last
      end
      uniquify!(element)
    end

    def sum
      if @accumulator.empty?
        0
      else
        @accumulator.sum
      end
    end
  end

  class Captcha

    def self.calculate!(digits)
      new.calculate(digits)
    end

    def calculate(digits)
      raise InvalidInputError unless digits.is_a? Integer
      calculate_captcha digits
    end

    def calculate_captcha(digits)
      splits = splitter(digits)
      Advent::CaptchaCalculator.calculate! splits
    end

    def splitter(digits)
      String(digits).split('').map {|i| Integer(i) }
    end
  end
end
