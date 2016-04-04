class NASA::MissionControl
  # I'm storing the plateau width/height but the assignment didn't mention what
  # to do with the values. I'd assume to make sure that the rovers don't move
  # over the edge, but the test case provided doesn't cover that scenario.

  attr_accessor :plateau

  def initialize(mission)
    mission_commands = mission.split("\n")

    @plateau = parse_plateau(mission_commands.shift)
    @mission_commands = mission_commands
  end

  def run_mission
    mission_results = @mission_commands.each_slice(2).map do |mission_command|
      rover_location = mission_command.first
      rover = NASA::Rover.new(rover_location)

      rover_input = mission_command.last.split(//)
      rover_input.each do |input|
        rover.command(input)
      end

      rover.report_location
    end

    mission_results.join("\n")
  end

  private

  def parse_plateau(input)
    width, height = input.split
    { width: width.to_i, height: height.to_i }
  end
end
