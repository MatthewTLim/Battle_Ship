class Cell
    attr_reader :coordinate,
                :ship

    def initialize(coordinate)
        @coordinate = coordinate
        @ship = nil
        @fired_at = false
    end

    def empty?
        @ship == nil
    end

    def place_ship(ship)
        @ship = ship
    end

    def fired_upon?
        @fired_at == true
        # @ship.health == @ship.length 
    end

    def fire_upon
        if empty? == false
            @ship.hit
            @fired_at = true
        else
            @fired_at = true
        end
    end

    def render(option = false)
        if fired_upon? == true && empty? == true
            "M"
        elsif empty? == false && fired_upon? == false && option == true
            "S"
        elsif fired_upon? == true && empty? == false
            "H"
        else
            "."
        end
    end
end