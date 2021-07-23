class Sequence
  attr_accessor :row

  def initialize
    @row = [1]
  end

  def gen_next_row
    new_row = []
    digit = @row[0]
    counter = 0
    j = 0
    while j <= @row.length
      until j == @row.length or @row[j] != digit
        counter += 1
        j += 1
      end
      new_row.append counter, digit
      digit = @row[j]
      counter = 1
      j += 1
    end
    @row = new_row
  end

  def get_sequence(depth)
    if depth < 1
      return
    end
    for i in 1..depth - 1
      print *@row, "\n"
      gen_next_row
    end
    print *@row, "\n"
    @row = [1]
  end
end