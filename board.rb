require_relative "card.rb"

class Board

    @@library = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("")

    def initialize(size=4)

        @num_spaces = size ** 2
        @grid = Array.new(size) {Array.new(size)}
        
        @cards = []
    end

    def populate

        pairs = []
        (@num_spaces/2).times do

            value = @@library.delete(@@library.sample)
            pairs << Card.create_pairs(value)
        end
    end








    end



end