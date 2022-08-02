require_relative "card.rb"

class Board

attr_reader :grid

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
            pairs << Card.create_pair(value)
        end

        pairs.flatten!.shuffle!
        
        @grid.map! do |row|
            row.map! do |col|
                card = pairs.sample
                pairs.delete_if { |ele| ele.object_id == card.object_id}
                card
            end
        end
    end

    def render

        print "  " + (0...@grid.length).to_a.join(" ")
        puts

        @grid.each_with_index do |row, idx|

               print "#{idx} " + row.map {|card| card.display}.join(" ")
               puts
        end

    end

    def won?
        return @grid.all? do |row|
            row.all? do |card|
                card.display != "_"
            end
        end
    end

    def reveal(pos)
        row, col = pos

        if @grid[row][col].display == "_"

            @grid[row][col].reveal
            return @grid[row][col].value
        end
        false
    end

    def cheat

        print "  " + (0...@grid.length).to_a.join(" ")
        puts

        @grid.each_with_index do |row, idx|

               print "#{idx} " + row.map {|card| card.value}.join(" ")
               puts
        end

    end

end
