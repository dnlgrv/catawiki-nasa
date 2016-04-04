class NASA::Rover
  HEADINGS = {
    "N" => :north,
    "S" => :south,
    "E" => :east,
    "W" => :west
  }

  attr_accessor :heading, :position

  def initialize(command)
    x, y, heading = command.split

    @position = Position.new(x.to_i, y.to_i)
    @heading = HEADINGS[heading]
  end

  class Position
    attr_reader :x, :y

    def initialize(x, y)
      @x = x
      @y = y
    end
  end
end
