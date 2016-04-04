class NASA::Rover
  HEADINGS = {
    "N" => :north,
    "S" => :south,
    "E" => :east,
    "W" => :west
  }

  attr_accessor :heading, :position

  def initialize(input)
    x, y, heading = input.split

    @position = Position.new(x.to_i, y.to_i)
    @heading = HEADINGS[heading]
  end

  def command(input)
    case input
    when "L"
      rotate_left_command
    when "R"
      rotate_right_command
    when "M"
      move_command
    end
  end

  def report_location
    [@position.x, @position.y, HEADINGS.key(@heading)].join(" ")
  end

  private

  def move_command
    case @heading
    when :north
      @position.y = @position.y + 1
    when :south
      @position.y = @position.y - 1 if @position.y > 0
    when :east
      @position.x = @position.x + 1
    when :west
      @position.x = @position.x - 1 if @position.x > 0
    end
  end

  def rotate_left_command
    @heading = case @heading
               when :north then :west
               when :south then :east
               when :east  then :north
               when :west  then :south
               end
  end

  def rotate_right_command
    @heading = case @heading
               when :north then :east
               when :south then :west
               when :east  then :south
               when :west  then :north
               end
  end

  class Position
    attr_accessor :x, :y

    def initialize(x, y)
      @x = x
      @y = y
    end
  end
end
