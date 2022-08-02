class Card

    attr_reader :value

    def initialize(value)
        @value = value
        @face_up = false
    end

    def display
        if @face_up
            return @value
        else
            false
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