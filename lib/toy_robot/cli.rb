require_relative "simulator"

module ToyRobot

  class CLI

    attr_reader :simulator

    def initialize
      @simulator = Simulator.new
    end

    def run
      $stdout.puts "Running ToyRobot Simulator (Type exit to quit)"
      $stdout.puts "=============================================="

      while (input = gets.chomp)
        return unless !input.nil? && !input.empty?

        input = input.downcase.strip
        break if input.eql?("exit")
        execute(input)
      end
    end

    def run_from_file(file)
      $stdout.puts "Running ToyRobot Simulator"
      $stdout.puts "=========================="

      File.readlines(file).map do |line|
        execute(line)
      end
    end

    private

    def execute(line)
      line = line.strip
      command, args = line.split(" ").collect(&:downcase)
      return unless valid_command?(command)

      result = if args
                 simulator.send(command, args)
               else
                 simulator.send(command)
               end

      $stdout.puts result.to_s if result.is_a?(String)
    end

    def valid_command?(command)
      command && Simulator::Commands.include?(command.to_sym)
    end

  end

end
