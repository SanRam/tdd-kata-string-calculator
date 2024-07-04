require "string_calculator"

describe StringCalculator do
  describe ".add" do
    context "I: empty string" do
      it "O: returns zero" do
        expect(subject.add("")).to eq(1)
      end
    end
  end
end
