
class Array
  
  def my_uniq
    uniques = []

    each_with_index do |ele, i|
      uniques << ele unless uniques.include?(ele)
    end
    uniques
  end

  def two_sum
    arr = []
    each_with_index do |ele, idx1|
      each_with_index do |ele2, idx2|
        next unless idx2 > idx1
        arr << [idx1, idx2] if ele + ele2 == 0
      end
    end
    arr

  end

  def my_transpose
    arr = []
    (0...length).each do |idx1|
      row = []
      (0...length).each do |idx2|
        row << self[idx2][idx1]
      end
      arr << row
    end
    arr
  end
end

def stock_picker(stock_prices)
  profit = 0
  pos = [0, stock_prices.length - 1]
  stock_prices.each_with_index do |stock_1, idx1|
    stock_prices.each_with_index do |stock_2, idx2|
      next unless idx2 > idx1
      if stock_2 - stock_1 > profit
        profit = stock_2 - stock_1
        pos = [idx1, idx2]
      elsif stock_2 - stock_1 == profit && idx2 - idx1 < pos[1] - pos[0]
        pos = [idx1, idx2]
      end
    end
  end
  pos
end

class TowersofHanoi
    attr_accessor :left, :middle, :right
    def initialize
        @left = [1, 2, 3]
        @middle = []
        @right = []
    end

    def self.move(start_tower, end_tower)
        raise InvalidInputsError if start_tower.empty?
        raise InvalidInputsError unless end_tower.empty? || start_tower.first < end_tower.first
        end_tower.unshift(start_tower.shift)
    end

    
end

class InvalidInputsError < StandardError

end