require 'csv'

class CSVwriter
  def initialize(filename)
    @filename = filename
  end

  def write_info(info)
    CSV.open(@filename, 'w', encoding: 'UTF-8') do |wr|
      info.each do |inf_block|
        wr << inf_block
      end
    end
  end
end
