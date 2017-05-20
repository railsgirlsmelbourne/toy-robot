module ToyRobot

  class Robot
    attr_accessor :direction

#ordered hash
    Vector = {
      north: { x:  0, y:  1 },
      east:  { x:  1, y:  0 },
      south: { x:  0, y: -1 },
      west:  { x: -1, y:  0 }
    }.freeze

    def face(direction)
      unless directions.include?(direction)
        raise InvalidDirection, "Error: Direction not one of #{directions.join(',')}"
      end

      self.direction = direction
    end

    def route
      Vector[direction]
    end

    def turn_left
      if direction_index == -1
        face(direction[direction.length - 1])
      else
        face(directions[direction_index - 1])
      end
    end

    def turn_right
      if direction_index == direction.length - 1
        face(directions[0])
      else
        face(directions[direction_index + 1])
      end
    end

    private

    def directions
      Vector.keys
    end

    def direction_index
      directions.index(direction)
    end

  end

  class InvalidDirection < RuntimeError; end

end
