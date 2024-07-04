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

    context "case: many numbers in string" do
      context "given '1,2,4,5,6,7'" do
        it "returns 25" do
          expect(subject.add("1,2,4,5,6,7")).to eq(25)
        end
      end
      context "given '20,19,21,33,4,45,0'" do
        it "returns 142" do
          expect(subject.add("20,19,21,33,4,45,0")).to eq(142)
        end
      end
    end

    context "case: delimiter along with newline '\n' along with ',' in string" do
      context "given '1\n2,3'" do
        it "returns 6" do
          expect(subject.add("1\n2,3")).to eq(6)
        end
      end
      context "given '1,2,4,5,6\n7'" do
        it "returns 25" do
          expect(subject.add("1,2,4,5,6\n7")).to eq(25)
        end
      end
      context "given '20,19\n21,33,4,45,0'" do
        it "returns 142" do
          expect(subject.add("20,19\n21,33,4,45,0")).to eq(142)
        end
      end
    end

    context "case: delimiter with various characters '//;\n; etc' in string" do
      context "given '//;\n1;2'" do
        it "returns 3" do
          expect(subject.add("//;\n1;2")).to eq(3)
        end
      end

      context "given '//;\n1;2.4'" do
        it "returns 7" do
          expect(subject.add("//;\n1;2.4")).to eq(7)
        end
      end
    end

    context "case: delimiters can be of any length with the following format" do
      context "given '//[***]\n1***2***3'" do
        it "returns 6" do
          expect(subject.add("//[***]\n1***2***3")).to eq(6)
        end
      end
    end

    context "case: negative number in string" do
      context "given '1,2,-4'" do
        it "raise an exception" do
          expect{subject.add("1,2,-4")}.to raise_error("negatives not allowed [-4]")
        end
      end
      context "given '1,2,-4, -15'" do
        it "raise an exception" do
          expect{subject.add("1,2,-4, -15")}.to raise_error("negatives not allowed [-4,-15]")
        end
      end
    end

    context "case: numbers bigger than 1000 should be ignored in string" do
      context "given '1,2,4,5,6,1000'" do
        it "returns 25" do
          expect(subject.add("1,2,4,5,6,1000")).to eq(1018)
        end
      end
      context "given '1,2,4,5,6,1001'" do
        it "returns 25" do
          expect(subject.add("1,2,4,5,6,1001")).to eq(18)
        end
      end
      context "given '1,2,4000'" do
        it "returns 3" do
          expect(subject.add("1,2,4000")).to eq(3)
        end
      end
    end
  end

  describe ".get_called_count" do
    context "case: get how many times add() was invoked" do
      it "returns 15 (based on test no of cases)" do
        expect(subject.get_called_count).to eq(18)
      end
    end
  end
end
