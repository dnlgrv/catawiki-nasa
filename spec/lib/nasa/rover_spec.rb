require "spec_helper"

RSpec.describe NASA::Rover do
  subject { described_class.new("1 2 N") }

  describe "#initialize" do
    it "has the correct heading" do
      expect(subject.heading).to eq(:north)
    end

    it "has the correct position coordinates" do
      expect(subject.position.x).to eq(1)
      expect(subject.position.y).to eq(2)
    end

    it "handles all the headings" do
      expect(described_class.new("0 0 S").heading).to eq(:south)
      expect(described_class.new("0 0 E").heading).to eq(:east)
      expect(described_class.new("0 0 W").heading).to eq(:west)
    end
  end
end
