class NASA::MissionControl
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
        rover.command(input, @plateau)
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
