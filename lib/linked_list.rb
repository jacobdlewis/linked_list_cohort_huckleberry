class LinkedList
  attr_reader :size

  def initialize
    @first_item
    @item_count = 0
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
    @item_count += 1
    @size = @item_count
  end

  def get(index)
    raise IndexError, "Index doesn't exist" if index > @item_count
    raise IndexError, "Index can't be negative" if index < 0
    starting_point = @first_item
    index.times do
      next_item = starting_point.next_item
      starting_point = next_item
    end
  starting_point.payload
  end

end
