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
    end
  end

  private

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
    attr_reader :x, :y

    def initialize(x, y)
      @x = x
      @y = y
    end
  end
end
