require 'spec_helper'

RSpec.describe ToyRobot do

  let(:toy_robot) { ToyRobot::CLI.new }

  describe "running the simulator" do

    context "with a valid set of commands" do

      it "outputs information to stdout" do
        expect { toy_robot.run_from_file("spec/fixtures/moves.txt") }.to output(
          "Running ToyRobot Simulator\n" \
          "==========================\n"
        ).to_stdout
      end

    end

  end

end
