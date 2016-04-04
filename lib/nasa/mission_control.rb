class NASA::MissionControl
  attr_accessor :plateau, :rovers

  def initialize(mission)
    mission_commands = mission.split("\n")

    @plateau = parse_plateau(mission_commands.shift)
    @rovers = mission_commands.each_slice(2).map do |rover_input|
      {
        rover: NASA::Rover.new(rover_input.first),
        command: rover_input.last
      }
    end
  end

  def run_mission
    mission_results = @rovers.map do |rover|
      rover[:command].split(//).each do |input|
        rover[:rover].command(input)
      end

      rover[:rover].report_location
    end

    mission_results.join("\n")
  end

  private

  def parse_plateau(input)
    width, height = input.split
    { width: width.to_i, height: height.to_i }
  end
end
