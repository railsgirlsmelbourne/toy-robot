module ToyRobot

  class Robot
    attr_accessor :direction

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
