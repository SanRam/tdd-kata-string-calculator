require "string_calculator"

describe StringCalculator do
  describe ".add" do
    context "I: empty string" do
      it "O: returns zero" do
        expect(subject.add("")).to eq(0)
      end
    end

    context "I: one number in string" do
      it "O: returns one number" do
        expect(subject.add("1")).to eq(1)
      end
      it "O: returns one number" do
        expect(subject.add("6")).to eq(6)
      end
    end
    
  end
end
