class MaxIntSet
  attr_reader :store 

  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    @store[num] = true if is_valid?(num)
  end

  def remove(num)
    @store[num] = false if is_valid?(num)
  end

  def include?(num)
    @store[num] == true 
  end

  private

  def is_valid?(num)
    raise "Out of bounds" unless num.between?(0, @store.length - 1)
    true 
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % num_buckets] << num 
  end

  def remove(num)
    @store[num % num_buckets].delete(num) 
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num)
      @store[num % num_buckets] << num 
      @count += 1
    end
    resize! if @count >= num_buckets
  end

  def remove(num)
    if include?(num)
      @store[num % num_buckets].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    @store += Array.new(@store.length) {Array.new}
    @store.each_with_index do |bucket, i|
      sorted = false 
      until sorted 
        sorted = true 
        bucket.each do |ele| 
          if ele % num_buckets != i 
            @store[ele % num_buckets] << ele 
            bucket.delete(ele)
            sorted = false 
          end
        end
      end
      
    end
  end

end
