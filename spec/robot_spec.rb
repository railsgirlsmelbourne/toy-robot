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

end
