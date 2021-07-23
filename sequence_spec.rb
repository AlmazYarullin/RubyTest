require 'rspec'
require_relative 'sequence'

CORRECT_ROWS = "1
11
21
1211
111221
312211
13112221
1113213211
31131211131221
13211311123113112211
11131221133112132113212221
3113112221232112111312211312113211
1321132132111213122112311311222113111221131221".split("\n")

describe Sequence do
  it 'intialize and invalied parameters handling' do
    seq = Sequence.new

    # check if not valid parameters
    expect(seq.get_sequence(-13)).to be nil
    expect(seq.get_sequence(0)).to be nil

    # check if row is initialized correctly
    expect(seq.row.join).to eq("1")

    # check row after sequence call
    seq.get_sequence(7)
    expect(seq.row.join).to eq("1")
  end
  it 'generates correct sequence' do
    seq = Sequence.new
    # sequence check
    for row in CORRECT_ROWS
      expect(seq.row.join).to eq(row)
      seq.gen_next_row
    end
  end
end