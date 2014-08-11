require_relative '../src/darts'

RSpec.describe Darts do

  describe "#line_score" do

    context "when the number in the line is between 1 and 20" do

      context "if the line is preceded by 'double'" do
        it "returns the double of that number" do
          (1..20).each do |number|
            line = 'double ' + number.to_s
            darts = Darts.new
            expect(darts.line_score(line)).to eq(number * 2)
          end
        end
      end

      context "if the line is preceded by 'triple'" do
        it "returns the triple of that number" do
          (1..20).each do |number|
            line = 'triple ' + number.to_s
            darts = Darts.new
            expect(darts.line_score(line)).to eq(number * 3)
          end
        end
      end

      context "otherwise" do
        it "returns that number" do
          (1..20).each do |number|
            line = number.to_s
            darts = Darts.new
            expect(darts.line_score(line)).to eq(number)
          end
        end
      end

    end

    context "when the number in the line is either 25 or 50" do

      context "if the line is not preceded by 'double' or 'triple'" do
        it "returns that number" do
          [25, 50].each do |number|
            line = number.to_s
            darts = Darts.new
            expect(darts.line_score(line)).to eq(number)
          end
        end
      end

      context "otherwise" do
        it "raises an exception" do
          [25, 50].each do |number|
            line = 'double ' + number.to_s
            darts = Darts.new
            expect {darts.line_score(line)}.to raise_error

            line = 'triple ' + number.to_s
            darts = Darts.new
            expect {darts.line_score(line)}.to raise_error
          end
        end
      end

    end

    context "otherwise" do
      it "raises an error" do
        [0, 21, 26, 51].each do |number|
          line = number.to_s
          darts = Darts.new
          expect {darts.line_score(line)}.to raise_error
        end
      end
    end
  end

end