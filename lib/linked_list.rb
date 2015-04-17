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
    @size = @size + 1
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
    output = ""
    if @first_item == nil
      output = "| |"
    else
      current_item = @first_item
      output = "| "
      size.times do
        output << current_item.payload
        output << ", " if current_item.last? == false
        current_item = current_item.next_item
      end
      output << " |"
    end
    output
  end

  def [](arg)
    current_item = @first_item
    if arg==0
      return first_item.payload
    elsif arg > 0
      arg.times do
        current_item = current_item.next_item
      end
      return current_item.payload
    end
  end

  def []=(index, new_item)
    item_to_update = @first_item
    index.times do
      item_to_update = item_to_update.next_item
    end
    item_to_update.payload = new_item
  end

  def delete(index)
    if index > @size
      raise IndexError, "that index doesn't exist"
    end
    if index > 0
      current_item = @first_item
      index.times do
        current_item = current_item.next_item
      end
      next_neighbor = current_item.next_item
      pointer_to_update = @first_item
      (index - 1).times do
        pointer_to_update = pointer_to_update.next_item
      end
      pointer_to_update.next_item = next_neighbor
    elsif index == 0
      new_first = @first_item.next_item
      @first_item = new_first
    end
    @size -= 1
  end



end
