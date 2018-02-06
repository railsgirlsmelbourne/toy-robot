require 'spec_helper'

RSpec.describe ToyRobot::Simulator do

  let(:simulator) { ToyRobot::Simulator.new }

  describe "#commands" do

    context "#valid commands" do
    [:place, :move, :report, :left, :right].each do |command|

      it "recognize #{command} as valid command" do
        expect(ToyRobot::Simulator::Commands).to include(command)
      end
    end
   end
 end

  describe "#place" do

    it "returns the placed coordinates" do
      expect(simulator.place("1,1,NorTH")).to eql(x: 1, y: 1)
    end

    it "raises an exception if direction is invalid" do
      expect { simulator.place("1,1,NORTHWEST") }
        .to raise_exception ToyRobot::InvalidDirection
    end

    it "raises an exception if co-ordinates are invalid" do
      expect { simulator.place("6,1,NORTH") }
        .to raise_exception ToyRobot::InvalidPosition
    end

  end

  describe "#move" do

    it "returns the new valid robot position" do
      simulator.place("1,1,NORTH")
      expect(simulator.move).to eql(x: 1, y: 2)
    end

    it "raises an exception if it moves robot off the table top" do
      simulator.place("4,4,NORTH")
      expect { simulator.move }.to raise_exception ToyRobot::InvalidPosition
    end

    it "raises an exception if robot has not been placed" do
      expect { simulator.move }.to raise_exception ToyRobot::InvalidPlacement
    end

  end

  describe "#report" do

    it "returns position if robot has been placed on table top" do
      simulator.place("1,1,NORTH")
      expect(simulator.report).to eql("1,1,NORTH")

    end

    it "throws exception when robot is not placed on table top" do
      expect { simulator.report }.to raise_exception ToyRobot::InvalidPlacement
    end

  end

end
