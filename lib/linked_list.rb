class LinkedList
  attr_reader :size, :first_item

  def initialize
    @first_item
    @size = 0
  end

  def push(ll_item)
    if @first_item.nil?
      @first_item = LinkedListItem.new(ll_item)
    elsif @first_item.nil? == false && @first_item.next_item.nil?
      @first_item.next_item = LinkedListItem.new(ll_item)
    else
      current = @first_item
      while current.next_item.nil? == false
        current = current.next_item
        current
      end
      current.next_item = LinkedListItem.new(ll_item)
    end
    @size += 1
  end

  def get(index)
    raise IndexError, "Index doesn't exist" if index > @size
    raise IndexError, "Index can't be negative" if index < 0
    starting_point = @first_item
    index.times do
      next_item = starting_point.next_item
      starting_point = next_item
    end
  starting_point.payload
  end

  def last
    if @size == 0
      return nil
    else
      current_item = @first_item
      if current_item.last? == true
        return current_item
      else
        while current_item.last? == false
          next_item = current_item.next_item
          current_item = next_item
        end
      current_item.payload
      end
    end
  end

end
