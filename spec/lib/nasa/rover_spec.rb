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

  describe "#command" do
    context "when L" do
      let(:command) { "L" }

      context "when the Rover is facing North" do
        before do
          subject.heading = :north
          subject.command(command)
        end

        it "rotates the Rover to face West" do
          expect(subject.heading).to eq(:west)
        end
      end

      context "when the Rover is facing South" do
        before do
          subject.heading = :south
          subject.command(command)
        end

        it "rotates the Rover to face East" do
          expect(subject.heading).to eq(:east)
        end
      end

      context "when the Rover is facing East" do
        before do
          subject.heading = :east
          subject.command(command)
        end

        it "rotates the Rover to face North" do
          expect(subject.heading).to eq(:north)
        end
      end

      context "when the Rover is facing West" do
        before do
          subject.heading = :west
          subject.command(command)
        end

        it "rotates the Rover to face South" do
          expect(subject.heading).to eq(:south)
        end
      end
    end
  end
end
