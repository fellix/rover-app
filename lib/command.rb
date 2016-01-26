class Command
  class InvalidCommand < StandardError; end

  TRANSPILER = {
    'M' => 'move',
    'L' => 'turn_left',
    'R' => 'turn_right'
  }

  attr_reader :commands

  def initialize(input = "", commands = [])
    @input = input
    @commands = commands
  end

  def parse(input)
    commands = input.split(//).map do |cmd|
      TRANSPILER[cmd]
    end

    raise InvalidCommand.new(input) if commands.include? nil

    Command.new(input, commands)
  end

  def apply_to(object)
    @commands.each do |command|
      object.__send__ command
    end
  end
end
