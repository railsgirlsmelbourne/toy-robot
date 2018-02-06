require_relative "table_top"
require_relative "robot"

module ToyRobot

  class Simulator

    attr_accessor :table_top, :robot

    Commands = [:place, :move, :report, :left, :right].freeze

    def initialize
      @table_top = TableTop.new
      @robot     = Robot.new
    end

    def place(location)
      vector = split_location(location)

      robot.face(vector[:direction])
      table_top.place(vector[:x], vector[:y])
    end

    def move
      return false unless robot_placed?

      table_top.place(position[:x] + route[:x], position[:y] + route[:y])
    end

    def report
      return false unless robot_placed?
      "#{position[:x]},#{position[:y]},#{direction.upcase}"
    end

    def left
      robot.turn_left
    end

    def right
      robot.turn_right
    end

    private

    def split_location(placement)
      items = placement.split(",")
      return unless valid_placement?(items)

      {
        x: items[0].to_i,
        y: items[1].to_i,
        direction: items[2].downcase.to_sym
      }
    end

    # PLACE 1,1,north

    def position
      table_top.position
    end

    def route
      robot.route
    end

    def direction
      robot.direction
    end

    def valid_placement?(items)
      return true if items.length == 3

      raise InvalidPlacement, "Error: 'PLACE' command requires at least 3 arguments"
    end

    def robot_placed?
      return true if table_top.placed?

      raise InvalidPlacement, "Error: Robot is not on the table, ignoring command"
    end

  end

  class InvalidPlacement < RuntimeError; end

end
