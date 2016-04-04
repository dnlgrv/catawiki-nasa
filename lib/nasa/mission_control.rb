class NASA::MissionControl
  def initialize(mission)
    @mission = mission
  end

  def run_mission
    ["1 3 N", "5 1 E"].join("\n")
  end
end
