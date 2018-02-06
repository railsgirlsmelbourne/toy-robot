require 'spec_helper'

RSpec.describe ToyRobot::Robot do
  let(:robot) { ToyRobot::Robot.new }

  describe '#face' do

    [:north, :east, :south, :west].each do |direction|

      it "faces #{direction}" do
        robot.face(direction)
        expect(robot.direction).to eq direction
      end

    end

    it "raises an error when given an unknown direction" do
      expect { robot.face(:northwest) }.to raise_exception ToyRobot::InvalidDirection
    end
  end

  describe "#route" do

    it "plots north if facing north" do
      robot.face(:north)
      expect(robot.route).to eql(x: 0, y: 1)
    end

    it "plots east if facing east" do
      robot.face(:east)
      expect(robot.route).to eql(x: 1, y: 0)
    end

    it "plots south if facing south" do
      robot.face(:south)
      expect(robot.route).to eql(x: 0, y: -1)
    end

    it "plots west if facing west" do
      robot.face(:west)
      expect(robot.route).to eql(x: -1, y: 0)
    end

  end

  describe "#turn robot" do

    it "turns the robot left" do
      robot.face(:north)
      robot.turn_left
      expect(robot.direction).to eql(:west)
    end

    it "turns the robot right" do
      robot.face(:north)
      robot.turn_right
      expect(robot.direction).to eql(:east)
    end

    it "faces same direction after turning left four times" do
      robot.face(:east)
      4.times do
        robot.turn_left
      end
      expect(robot.direction).to eql(:east)
    end

    it "faces same direction after turning right four times" do
      robot.face(:south)
      4.times do
        robot.turn_right
      end
      expect(robot.direction).to eql(:south)
    end
  end
end
