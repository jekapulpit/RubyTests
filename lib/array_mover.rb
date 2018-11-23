
class Array_mover
  def self.move(list, n)
    n.times do
      buf = list[list.size - 1]
      el = list.size - 1
      (list.length - 1).times do
        list[el] = list[el-1]
        el -= 1
      end
      list[0] = buf
    end
    list
  end
end




