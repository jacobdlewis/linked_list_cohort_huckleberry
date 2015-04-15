class LinkedListItem
  include Comparable
  attr_reader :payload, :next_item

  def initialize(payload)
    @payload = payload
  end

  def next_item=(next_item)
      @next_item = next_item
      raise ArgumentError if next_item == self
  end

  def last?
    if next_item == nil
      @last = true
    else
      @last = false
    end
  end

  def ===(other)
    self.eql?(other)
  end

  def <=>(other)
    comparison = self.payload <=> other.payload
    if comparison == nil
      if self.payload.class == Symbol && other.payload.class == String
        comparison = 1
      elsif self.payload.class == String && other.payload.class == Symbol
        comparison = -1
      end
      if self.payload.class == Fixnum && other.payload.class == String
        comparison = -1
      elsif self.payload.class == String && other.payload.class == Fixnum
        comparison = 1
      end
    end
    comparison
  end

end

