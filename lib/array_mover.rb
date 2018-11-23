class Array_mover
  def self.move(list, position)
    position.times do
      buffer = list[list.size - 1]
      index = list.size - 1
      (list.length - 1).times do
        list[index] = list[index-1]
        index -= 1
      end
      list[0] = buffer
    end
    list
  end
end