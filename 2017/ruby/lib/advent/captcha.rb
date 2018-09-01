
module Advent
  class Captcha

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

    def sequentially_awesome(digits)
      collection = []
      len = digits.length
      digits.each_with_index do |val, idx|
        if idx < (len - 1)
          collection.push val if val == digits[idx + 1]
        elsif idx == (len - 1)
          collection.push val if val == digits[0]
        end
      end
      collection
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
