class HashSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num)
      @store[num.hash % num_buckets] << num.hash  
      @count += 1
    end
    resize! if @count >= num_buckets
  end

  def remove(num)
    if include?(num)
      @store[num.hash % num_buckets].delete(num.hash)
      @count -= 1
    end
  end

  def include?(num)
    @store[num.hash % num_buckets].include?(num.hash)
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
