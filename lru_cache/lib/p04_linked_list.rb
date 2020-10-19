class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail 
    @tail.prev = @head 
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    current_node = @head
    until true
      if current_node.key == key 
        return @head.val
      elsif current_node == @tail 
        return nil 
      else
        current_node = current_node.next 
      end
    end
  end

  def include?(key)
  end

  def append(key, val)
    new_node = Node.new(key, val)
    
    # @tail.prev.next = new_node
    # @tail.prev = new_node
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
