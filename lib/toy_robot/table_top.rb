module ToyRobot

  class TableTop
    X_BOUND = 5
    Y_BOUND = 5

    attr_accessor :position

    def place(x, y)
      unless position_valid?(x, y)
        raise InvalidPosition, "Error: Ignoring command as it places Robot off the table"
      end

      self.position = { x: x, y: y }
    end

    def placed?
      position != nil
    end

    private

    def position_valid?(x, y)
      (0...X_BOUND).cover?(x) && (0...Y_BOUND).cover?(y)
    end

  end

  class InvalidPosition < RuntimeError; end

end
