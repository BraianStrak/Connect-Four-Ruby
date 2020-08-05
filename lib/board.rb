class Board
    def initialize(x, y)
        @x = x
        @y = y
        @slots = Array.new(x){Array.new(y)}
        self.populate_new_board
    end

    def populate_new_board
        @slots.each_with_index do |column, c|
            column.each_with_index do |row, r|
                @slots[c][r] = "*"
            end
        end
        @slots
    end

    def set_slot(x, y, value)
        @slots[x][y] = value
        return @slots[x][y]
    end

    def get_slot(x, y)
        @slots[x][y]
    end

    def to_s
        @slots.each do |column|
            column.each do |row|
                print row
            end
            puts
        end
    end
end