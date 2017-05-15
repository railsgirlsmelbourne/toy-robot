require 'spec_helper'

RSpec.describe ToyRobot::TableTop, "A simple table top" do

  let(:table) { ToyRobot::TableTop.new }

  describe "#place" do

    it "sets a position on the table" do
      table.place(1, 3)
      expect(table.position).to eql(x: 1, y: 3)
    end

    it "raises an error if placing outside the table bounds" do
      expect { table.place(5, 5) }.to raise_error ToyRobot::InvalidPosition
    end

    it "raises an error if placing at a invalid position" do
      expect { table.place(-1, 'foo') }.to raise_error ToyRobot::InvalidPosition
    end

  end

  describe "#placed?" do

    it "returns false if nothing is placed on the table" do
      expect(table.placed?).to eql false
    end

    it "returns true after something is placed on the table" do
      table.place(0, 0)
      expect(table.placed?).to eql true
    end

  end

  describe "#position" do

    it "returns nil if nothing is placed on the table" do
      expect(table.position).to eql nil
    end

  end

end
