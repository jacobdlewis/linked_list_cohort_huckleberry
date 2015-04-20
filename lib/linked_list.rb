require_relative 'linked_list_item'

class LinkedList
  attr_reader :size, :first_item

  def initialize(*starter)
    @first_item
    @size = 0
    starter.each { |x| self.push x } if starter
  end

  def print_out
      print("* -> nil") if @first_item.nil?
    if @first_item
      output = "* -> "
      current = @first_item
      while current.next_item.nil? == false
        output << current.payload
        output << " -> "
        current = current.next_item
        current
      end
      output << "nil"
      print output
    end
  end

  def push(ll_item)
    if @first_item.nil?
      @first_item = LinkedListItem.new(ll_item)
    else
      last_item = getListItemAtIndex(size-1)
      last_item.next_item = LinkedListItem.new(ll_item)
    end
    @size = @size + 1
  end

  def get(index)
    raise IndexError, "Index doesn't exist" if index > @size
    raise IndexError, "Index can't be negative" if index < 0
    item_asked_for = getListItemAtIndex(index)
    return item_asked_for.payload
  end

  def last
    if @size == 0
      return nil
    else
      last_item = getListItemAtIndex(size - 1)
      last_item.payload
    end
  end

  def to_s
    if @first_item
      current_item = @first_item
      output = "| "
      size.times do
        output << current_item.payload
        output << ", " if current_item.last? == false
        current_item = current_item.next_item
      end
      output << " |"
      return output
    else
      return "| |"
    end
  end

  def [](index)
    get(index)
  end

  def []=(index, new_item)
    item_to_update = getListItemAtIndex(index)
    item_to_update.payload = new_item
  end

  def delete(index)
    raise IndexError, "Specified index doesn't exist" if index > @size
    raise IndexError, "Method doesn't accept negative indices" if index < 0
    if index == 0
      @first_item = @first_item.next_item
    elsif index > 0
      deleted_item_reference = getListItemAtIndex(index - 1)
      deleted_item_reference.next_item = getListItemAtIndex(index + 1)
    end
    @size -= 1
  end

  def getListItemAtIndex(index)
    current_item = @first_item
    index.times { current_item = current_item.next_item }
    return current_item
  end

  def index(data)
    counter = 0
    item_to_check = @first_item
    while counter < @size
      if item_to_check.payload == data
        return counter
      elsif counter == @size
        return nil
      else
        counter += 1
        item_to_check = item_to_check.next_item
      end
    end
  end

  def sorted?
    if @size < 2
      return true
    else
      item_to_check = @first_item
      if item_to_check > item_to_check.next_item
        return false
      else
        return true
      end
    end
  end

  def sort!
    holder = 0
    if size > 1
      if @first_item > @first_item.next_item
        holder = @first_item
        @first_item = @first_item.next_item
        @first_item.next_item = holder
        @first_item.next_item.next_item = nil
      end
    end
  end

end
