module Advent
  class Checksum
    attr_accessor :rows, :accumulator

    def initialize(spreadsheet)
      @rows = parse_spreadsheet(spreadsheet)
      @accumulator = []
    end

    def self.calculate!(spreadsheet, accumulator = :find_small_large)
      new(spreadsheet)
        .accumulate(accumulator)
        .sum
    end

    def accumulate(accumulator)
      rows.map {|r| send(accumulator, r) }
        .map {|r| @accumulator.push(r) }
      self
    end

    # ok, this isn't super performant as I'm going to iterate over the row twice
    # once each for largest & smallest integers
    def find_small_large(row)
      largest(row) - smallest(row)
    end

    def smallest(row)
      a = row.first
      row.each do |i|
        a = i if i < a
      end
      a
    end

    def largest(row)
      a = row.first
      row.each do |i|
        a = i if i > a
      end
      a
    end

    def find_even_divisors(row)
      row.each_with_index do |n, idx|
        row.each_with_index do |x, subidx|
          # We don't want to divide the same number by itself, so skip if the index
          # of the array is equal.
          if idx == subidx
            next
          end

          if x % n == 0
            return x / n
          end
        end
      end
    end

    def parse_spreadsheet(sheet)
      sheet.split("\n").map do |line|
        parse_line(line)
      end
    end

    def parse_line(line)
      String(line).split("\t").map { |i| Integer(i) }
    end

    def sum
      if @accumulator.empty?
        0
      else
        @accumulator.sum
      end
    end
  end
end

