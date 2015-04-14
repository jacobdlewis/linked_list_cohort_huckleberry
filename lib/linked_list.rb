class LinkedList
  attr_reader :first_item

  def initialize
    @first_item
  end

  def push(ll_item)
    if @first_item.nil?
      @first_item = LinkedListItem.new(ll_item)
    else
      @first_item.next_item = LinkedListItem.new(ll_item)
    end
    # elsif @first_item.next_item != true
    #   @first_item.next_item(LinkedListItem.new(ll_item))
    # end
  end

  def get(index)
    starting_point = @first_item
    index.times do
      next_item = starting_point.next_item
      starting_point = next_item
    end
  starting_point.payload
  end

end
