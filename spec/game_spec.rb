require './lib/game.rb'

describe Game do
    describe "#play" do
        it "loops until there is a win or draw" do
            
        end
    end

    describe "#input_move" do
        it "Lets the player input a value from 1 to column amount" do
            game = Game.new(4, 4)
            expect(game.input_move).to eql(1)
        end
    end

    #red turn is first
    describe "#make_move" do 
        it "inserts the counter correctly with no counters in column" do
            game = Game.new(4, 4)
            game.make_move
            expect(game.board).to eq [['*','*','*','*'],['*','*','*','*'],
            ['*','*','*','*'],['r','*','*','*']]
        end

        it "inserts the counter correctly with counters in column" do
            game = Game.new(4, 4)
            game.make_move
            game.make_move
            #i believe the grid starts on the top left so this should be correct
            expect(game.board).to eq [['*','*','*','*'],['*','*','*','*'],
            ['b','*','*','*'],['r','*','*','*']]
        end
    end
    
    #remember you can pry to print out what the board looks like and stuff
    describe "#check_win" do
        it "detects a diagonal win" do
            game = Game.new(10,10)
            4.times do |i|
                game.board.set_slot(i, i, "b")
            end
            expect(game.check_win).to eql(true)
        end

        it "detects a horizontal win" do
            game = Game.new(10,10)
            4.times do |i|
                game.board.set_slot(0, i, "b")
            end
            expect(game.check_win).to eql(true)
        end

        it "detects a vertical win" do
            game = Game.new(10,10)
            4.times do |i|
                game.board.set_slot(i, 0, "b")
            end
            expect(game.check_win).to eql(true)
        end

        it "returns false if no win is present" do
            game = Game.new(10,10)
            game.board.set_slot(1, 1, "b")
            expect(game.check_win).to eql(false)
        end
    end
end