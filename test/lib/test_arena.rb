require_relative '../helper'
require_relative '../../lib/arena'

class TestArena < Minitest::Test
  def setup
    @arena = Arena.new(width: 5, height: 5)
  end

  def test_negatives_movements_x_axis_arent_allowed
    assert_equal false, @arena.movement_allowed?(-1, 0)
  end

  def test_negatives_movements_y_axis_arent_allowed
    assert_equal false, @arena.movement_allowed?(0, -1)
  end

  def test_overflow_movements_x_axis_arent_allowed
    assert_equal false, @arena.movement_allowed?(6, 0)
  end

  def test_overflow_movements_y_axis_arent_allowed
    assert_equal false, @arena.movement_allowed?(0, 6)
  end

  def test_accepts_movement_to_zero
    assert_equal true, @arena.movement_allowed?(0, 0)
  end

  def test_movement_to_anywhere_inside
    assert_equal true, @arena.movement_allowed?(3, 4)
  end
end
