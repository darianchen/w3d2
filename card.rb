class Card

    attr_reader :value

    def self.create_pair(value)
        card_1 = Card.new(value)
        card_2 = Card.new(value)

        return [card_1, card_2]
    end


    def initialize(value)
        @value = value
        @face_up = false
    end

    def display
        if @face_up
            return @value
        else
            return '_'
        end
    end

    def hide
        @face_up = false
    end

    def reveal
        @face_up = true
    end

    def to_s
       @value.to_s 
    end

    def ==(card)
        if self.value == card.value
            return true
        end
        false
    end
end