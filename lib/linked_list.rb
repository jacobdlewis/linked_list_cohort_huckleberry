class LinkedList
  attr_reader :size, :first_item

  def initialize(*starter)
    @to_s_representation
    @first_item
    @size = 0
    @starter = starter
    if starter.length > 0
      starter_length = starter.length
      seed_counter = 0
      while seed_counter < starter_length
        self.push(starter[seed_counter])
        seed_counter += 1
      end
    end
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

    if @to_s_representation.nil?
      @to_s_representation = "| #{ll_item} |"
    else
      to_s_length = @to_s_representation.length
      @to_s_representation = @to_s_representation.slice(0, to_s_length - 2)
      @to_s_representation += ", #{ll_item} |"
    end
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

  def to_s
    if @to_s_representation.nil?
      return "| |"
    else
      return @to_s_representation
    end
  end


end
