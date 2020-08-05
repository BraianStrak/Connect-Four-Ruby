require 'board.rb'

class Game
    attr_accessor :board

    def initialize(x, y)
        @x = x
        @y = y
        @board = Board.new(x, y)
        @blue_turn = false
        @win = false
    end

    def play
        while @win == false
            make_move()
            @board.to_s()
            @win = check_win()
        end
    end    

    def input_move
        puts "Choose a column from one to "; print @y
        return gets.chomp.to_i
    end

    def place_counter(row, column)
        @blue_turn == false ? @board.set_slot(row, column, 'r') : @board.set_slot(row, column, 'b')
    end

    def make_move
        #lets player choose a column to put a R or B, depending on blue turn value
        moveRow = input_move - 1
        #game board originates from the top left so the first placements should
        #be the bottom ones
        
        @y.times do |i|
            if @board.get_slot((@y-1)-i, moveRow) == '*'
                place_counter((@y-1)-i, moveRow)
                if @blue_turn == false
                    @blue_turn = true
                elsif @blue_turn == true
                    @blue_turn = false
                end
                break;
            end
        end
    end

    def check_win
        #detects diagonal, horizontal, vertical win
        #returns false if nobody won

        @x.times do |i|
            @y.times do |j|
                ##horizontal win
                if board.get_slot(i, j) != "*"
                    if (@board.get_slot(i, j) == @board.get_slot(i, j+1) &&
                        @board.get_slot(i, j+1) == @board.get_slot(i, j+2) &&
                        @board.get_slot(i, j+2) == @board.get_slot(i, j+3))
                        # return that there is a win
                        return true
                    end
                end
            end
        end

        @x.times do |i|
            @y.times do |j|
                ##vertical win
                if board.get_slot(i, j) != "*"
                    if (@board.get_slot(i, j) == @board.get_slot(i+1, j) &&
                        @board.get_slot(i+1, j) == @board.get_slot(i+2, j) &&
                        @board.get_slot(i+2, j) == @board.get_slot(i+3, j))
                        # return that there is a win
                        return true
                    end
                end
            end
        end

        @x.times do |i|
            @y.times do |j|
                ##ascending diagonal win
                if board.get_slot(i, j) != "*"
                    if (@board.get_slot(i, j) == @board.get_slot(i-1, j+1) &&
                        @board.get_slot(i-1, j+1) == @board.get_slot(i-2, j+2) &&
                        @board.get_slot(i-2, j+2) == @board.get_slot(i-3, j+3))
                        # return that there is a win
                        return true
                    end
                end
            end
        end

        @x.times do |i|
            @y.times do |j|
                ##descending diagonal win
                if board.get_slot(i, j) != "*"
                    if (@board.get_slot(i, j) == @board.get_slot(i-1, j-1) &&
                        @board.get_slot(i-1, j-1) == @board.get_slot(i-2, j-2) &&
                        @board.get_slot(i-2, j-2) == @board.get_slot(i-3, j-3))
                        # return that there is a win
                        return true
                    end
                end
            end
        end
        
        return false #if it goes thru all checks with no win then no win exists
    end
end
