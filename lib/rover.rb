class Rover
  class InvalidMovement < StandardError; end

  MOVEMENT_VALUES = {
    'N' => 1,
    'E' => 1,
    'S' => -1,
    'W' => -1
  }

  LEFT_TURNS = {
    'N' => 'W',
    'E' => 'N',
    'S' => 'E',
    'W' => 'S'
  }

  RIGHT_TURNS = {
    'N' => 'E',
    'W' => 'N',
    'S' => 'W',
    'E' => 'S'
  }

  def initialize(x: 0, y: 0, face: 'N', arena: nil)
    @arena = arena
    setup(x, y, face)
  end

  def setup(x, y, face)
    @x = x
    @y = y
    @face = face
  end

  def turn_left
    setup(@x, @y, LEFT_TURNS[@face])
  end

  def turn_right
    setup(@x, @y, RIGHT_TURNS[@face])
  end

  def move
    value = MOVEMENT_VALUES[@face]

    case @face
    when 'N', 'S'
      new_value = @y + value
      raise InvalidMovement unless @arena.movement_allowed?(new_value, @y)

      @y = new_value
    when 'E', 'W'
      new_value = @x + value
      raise InvalidMovement unless @arena.movement_allowed?(@x, new_value)

      @x = new_value
    end
  end

  def current_position
    [@x, @y, @face]
  end
end
