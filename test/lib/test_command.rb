require_relative '../helper'
require_relative '../../lib/command'

class TestCommand < Minitest::Test
  def setup
    @command = Command.new
  end

  def test_translate_each_word_to_valid_commands
    assert_equal ['turn_left', 'move', 'turn_right', 'move'], @command.parse('LMRM').commands
  end

  def test_validate_invalid_commands
    assert_raises Command::InvalidCommand do
      @command.parse('LMXRM')
    end
  end

  def test_apply_to_a_object
    object = FakeObject.new

    @command.parse('LMRML').apply_to(object)

    assert_equal [2, 1, 2], object.result
  end

  class FakeObject
    def initialize
      @left = 0
      @right = 0
      @move = 0
    end

    def turn_left
      @left = @left + 1
    end

    def turn_right
      @right = @right + 1
    end

    def move
      @move = @move + 1
    end

    def result
      [@left, @right, @move]
    end
  end
end
