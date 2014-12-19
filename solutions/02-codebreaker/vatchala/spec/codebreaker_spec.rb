require_relative '../src/codebreaker'
describe CodeBreaker do
  context "with no items" do
    it "should throw excpetion" do
      expect(ArgumentError.new)
    end
  end

  context "If I pass the value A" do
    it "Should return the encrypted values" do
      expect(CodeBreaker.new('A')) == 'N'
    end
  end

  context "If I pass the value A" do
    it "Should return the encrypted values" do
      expect(CodeBreaker.new('AAA BBB')) == 'NNN OOO'
    end
  end
end
