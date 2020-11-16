class TicTacToe
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]
    def initialize
        @board = Array.new(9, " ")
    end

    def input_to_index(input)
        input.to_i-1
    end

    def move(position, x_or_o)
        @board[position] = x_or_o
    end

    def position_taken?(index)
        @board[index.to_i] != " " ? true : false
    end

    def valid_move?(index)
        @board[index.to_i] != " " ? false : true
    end
    
    def turn_count
        @board.count{|token| token == "X" || token == "O"}
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end
    
    def turn
        index = input_to_index(gets)
        if valid_move?(index) && index >= 0 && index <= 8
            move(index, current_player)
            display_board
        else
            turn
        end
    end

    def won?
        WIN_COMBINATIONS.each do |combination|
            return combination if(@board[combination[0]] == @board[combination[1]] && @board[combination[0]] == @board[combination[2]] && @board[combination[0]] != " ")
        end
        return false
    end

    def full?
        @board.each do |spot|
            if spot == " "
                return false
            end
        end
        return true
    end

    def draw?
        return false if won? != false
        return full?
    end

    def over?
        return true if won? != false
        return draw?
    end

    def winner
        return @board[won?[0]] if won? != false
        return nil
    end
    
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
        return @board
    end

    def play
        while over? == false
            turn
        end
        if draw?
            puts "Cat's Game!"
            return "Cat's Game!"
        end
        if won? != false
            puts "Congratulations #{winner}!"
            return "Congratulations #{winner}!"
        end
    end
end