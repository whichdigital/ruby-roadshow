require 'spec_helper'

describe Darts do
	it 'calculate the total for the example' do
        total = Darts.calculate('
            5
            double 10
            triple 20
            25
            double 17
            50
        ')

        expect(total).to eq(194)
   end

   it 'calculate empty score card' do
        total = Darts.calculate('')
        expect(total).to eq(0)
   end

   it 'calculates the total for a simple example' do
        total = Darts.calculate('
            5
            25
            50
            ')
        expect(total).to eq(80)
   end

   it 'entering an invalid score with words should raise an exception' do
      score = 'double 21'
      expect { Darts.calculate(score) }.to raise_error(ArgumentError, "Incorrect score - Please enter a digit with in the range 1-20, 25 and 25; Input given: #{score}")
   end

   it 'entering an invalid should raise an exception' do
      score = '26'
      expect { Darts.calculate(score) }.to raise_error(ArgumentError, "Incorrect score - Please enter a digit with in the range 1-20, 25 and 25; Input given: #{score}")
   end

   it 'entering an invalid should raise an exception' do
      score = 'triple 51'
      expect { Darts.calculate(score) }.to raise_error(ArgumentError, "Incorrect score - Please enter a digit with in the range 1-20, 25 and 25; Input given: #{score}")
   end

   it 'entering an invalid phrase before the score number' do
      score = 'tiple 19'
      expect { Darts.calculate(score) }.to raise_error(ArgumentError, "Incorrect score - Please enter use double, triple or nothing before the number; Input given: #{score}")
   end

   it 'entering an invalid digit with the double phrase' do
      score = 'double 25'
      expect { Darts.calculate(score) }.to raise_error(ArgumentError, "Incorrect use of double, triple - You can only use double or triple on a digit with in the range 1-20: #{score}")
   end

   it 'entering an invalid digit with the triple phrase' do
      score = 'triple 50'
      expect { Darts.calculate(score) }.to raise_error(ArgumentError, "Incorrect use of double, triple - You can only use double or triple on a digit with in the range 1-20: #{score}")
   end

   it 'calculate the total for the example' do
      total = Darts.calculate('
              STARTS AT 301
              triple 20
              triple 20
          ')

      expect(total).to eq(181)
   end

   it 'calculate the total for the example' do
      total = Darts.calculate('
              STARTS AT 100
              triple 20
              triple 20
              10
          ')

      expect(total).to eq(30)
   end

   it 'calculate the total for the example' do
      total = Darts.calculate('
              STARTS AT 30
              triple 10
              12
          ')

      expect(total).to eq(18)
   end

   it 'calculate the total for the example' do
       total = Darts.quickest_finish('
               STARTS AT 100
               triple 19
               ')

       expect(total).to eq(['double 20', '1', 'double 1'])
   end
end
