require './lib/board.rb'

describe Board do
    describe "#populate_new_board" do
        it "makes a board full of asterisks" do
            expect(Board.new(3,3).populate_new_board).to eq [['*','*','*'],
            ['*','*','*'],['*','*','*']]
        end
    end

    describe "#set_slot" do
        it "sets a given slot to a given value" do
            board = Board.new(3, 3)
            board.set_slot(0, 0, "t")
            expect(board.get_slot(0, 0)).to eql("t")
        end
    end

    describe '#get_slot' do
        it "Provides the given slot" do
            board = Board.new(3, 3)
            board.set_slot(0, 0, "t")
            expect(board.get_slot(0, 0)).to eql("t")
        end
    end

    describe "#to_s" do
        it "prints out the board" do
            board = Board.new(3, 3)
            expect do
                board.to_s
            end.to output("***\n***\n***\n").to_stdout
        end
    end
end