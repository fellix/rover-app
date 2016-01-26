require_relative '../helper'
require_relative '../../lib/arena'
require_relative '../../lib/rover'

class TestRover < Minitest::Test
  def setup
    arena = Arena.new(width: 5, height: 5)
    @rover = Rover.new(arena: arena)
  end

  def test_moving_rover_right
    @rover.turn_right
    @rover.move
    assert_equal [1, 0, 'E'], @rover.current_position
  end

  def test_moving_rover_left
    @rover.move
    @rover.turn_left
    assert_equal [0, 1, 'W'], @rover.current_position
  end

  def test_moving_rover_over_arena
    @rover.turn_left
    assert_raises Rover::InvalidMovement do
       @rover.move
     end
  end
end
