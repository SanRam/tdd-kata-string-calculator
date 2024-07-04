require "string_calculator"

describe StringCalculator do
  describe ".add" do
    context "case: empty string" do
      it "returns zero" do
        expect(subject.add("")).to eq(0)
      end

      it "returns zero" do
        expect(subject.add(nil)).to eq(0)
      end
    end

    context "case: one number in string" do
      it "returns one number" do
        expect(subject.add("1")).to eq(1)
      end
      it "returns one number" do
        expect(subject.add("6")).to eq(6)
      end
    end

    context "case: two number in string" do
      context "given '1,2'" do
        it "returns 3" do
          expect(subject.add("1,2")).to eq(3)
        end
      end
      context "given '6,19'" do
        it "returns 25" do
          expect(subject.add("6,19")).to eq(25)
        end
      end
    end
  end
end
