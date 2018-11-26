class ArrayMover
  def self.move(list, position)
    list.concat(list.shift((list.length - position).abs))
  end
end
