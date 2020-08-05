# Plan for the program

## Board class, contains the board and all the counters and their position, print method. I don't think i need a counter class
Vars and methods: 

@Slots array

initialize(x, y) always a 2d array, of *  
set_slot(x, y, value) sets the particular slot to a value
get_slot(x, y) returns the value at the given slot
to_s() prints the board out



## Game class, containing all the logic behind winning, as well as checks for wins. Also contains move logic
Vars and methods:
More methods might be made for this
r = red 
b = blue

@Game board
@bool blueTurn (false if red true if blue)
@bool win

play() #contains the gameplay loop, whilst a win is not found (false) make move followed by checkwin()

make_move() #analyses where a move can be made, asks player to pick row from 0-boardwidth, then puts a new counter there, in the first slot that isn't a counter,
updates the board with set_slot

check_win() #analyses the board for whether a winning combination is present (a row of 4 of the same char except the filler char). 

## Small improvements
prevent the player from inputting a <4 board size
end the game with a draw if board is full and there are no winning combinations
pretty print the board with nice spacing and make sure the test is written well for that