require_relative "card.rb"

#require "byebug"


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











end