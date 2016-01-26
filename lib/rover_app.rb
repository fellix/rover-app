class RoverApp
  def initialize
    @running = false
    @rover_count = 1
  end

  def start
    @running = true

    puts "Rover mission is about to start (press Q anytime to finish)"
    puts "What is the plateau size?"
    @current_arena = load_arena

    while @running
      start_rover_mission
    end
  end

  def start_rover_mission
    puts "What is the rover ##{@rover_count} deployment position?"
    @current_rover = load_rover

    begin
      @current_command = load_command
      @current_command.apply_to @current_rover

      puts @current_rover.current_position.join(" ")
    rescue Command::InvalidCommand => e
      puts "Command #{e.message} is invalid, try again"
    rescue Rover::InvalidMovement
      puts "Invalid rover movement, Do you want it to fall outside the plateau?"
    end

    @rover_count += 1
  end

  protected

  def load_arena
    plateau_width, plateau_height = load_input.split(" ")

    Arena.new(width: plateau_width.to_i, height: plateau_height.to_i)
  end

  def load_rover
    x, y, face = load_input.split(" ")

    Rover.new(x: x.to_i, y: y.to_i, face: face, arena: @current_arena)
  end

  def load_command
    puts "Rover waiting for instructions (Press Q to finish this mission):"

    Command.new.parse(gets.chomp)
  end

  def load_input
    input = gets.chomp

    if input == 'Q'
      @running = false
      exit
    end

    input
  end
end
