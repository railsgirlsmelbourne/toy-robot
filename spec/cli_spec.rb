require 'spec_helper'

RSpec.describe ToyRobot::CLI do

  let(:toy_robot) { ToyRobot::CLI.new }

  describe "#run" do

    it "starts the Toy Robot Simulator" do
      allow(toy_robot).to receive(:gets).and_return("exit")
      expect { toy_robot.run }.to output(
        "Running ToyRobot Simulator (Type exit to quit)\n" \
        "==============================================\n"
      ).to_stdout
    end

  end

end
