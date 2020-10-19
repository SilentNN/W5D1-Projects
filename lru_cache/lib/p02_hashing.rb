class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    acc = 16541782480290387405697.hash 
    self.each.with_index do |ele, i| 
      acc = acc ^ (ele * i).hash 
    end
    acc
  end
end

class String
  def hash
    alphabet = ("a".."z").to_a + ("A".."Z").to_a + [" "]
    hash = Hash.new()
    alphabet.each.with_index do |char, i| 
      hash[char] = i.hash 
    end
    acc = 163458709247589.hash
    chars.each.with_index do |ele, i|
      acc = acc ^ (hash[ele] * i).hash
    end
    acc
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    acc = 42347435343246.hash
    self.each do |k, v|
      acc = k.hash ^ v.hash ^ acc
    end
    acc 
    
  end
end
