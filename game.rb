    require_relative "board.rb"

class Game
    def initialize
        puts "Choose a size!"
        size = gets.chomp.to_i
        @board = Board.new(size)
        @board.populate
    end

    def play
        until @board.won?
            system("clear")
            @board.render
            puts "Enter a guess: "
            begin
                input = gets.chomp
                @board.cheat if input == "cheat"
                guess_1 = input.split.map(&:to_i)
                first_guess = @board.reveal(guess_1)
            rescue
                puts "Please enter a valid position"
                retry
            end
            system("clear")
            @board.render
            
            puts "Enter another guess: "
            begin
            guess_2 = gets.chomp.split.map(&:to_i)

            raise ArgumentError.new if guess_2 == guess_1
            second_guess = @board.reveal(guess_2)
            rescue
                puts "Please enter a valid position"
                retry
            end
            system("clear")
            @board.render

            if first_guess == second_guess
              puts "Match Successful!"  
              puts "Press Enter"
              gets
            else
                @board.grid[guess_1[0]][guess_1[1]].hide
                @board.grid[guess_2[0]][guess_2[1]].hide 
                puts "Wrong"
                puts "Press Enter"
                gets
            end
        end
        puts "GAME OVER"
        puts "YOU WON!!! CONGRADULATIONS"
    end
end