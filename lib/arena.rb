class Arena
  def initialize(width:, height:)
    @width = width
    @height = height
  end

  def movement_allowed?(x, y)
    (x <= @width && x >= 0) && (y <= @height && y >= 0)
  end
end
