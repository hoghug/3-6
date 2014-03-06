require('rspec')
require('calculator_in_words')

describe('calculator_in_words') do
  it('returns the sum of the inputted string') do
    calculator_in_words('5 plus 4').should(eq(9))
  end
  it('returns the product of the inputted string') do
    calculator_in_words("What is 3 times 2").should(eq(6))
  end
  it('returns the quotient of the inputted string') do
    calculator_in_words("What is 12 divided by 4").should(eq(3))
  end
  it('returns the exponent of the inputted string') do
    calculator_in_words("What is 4 to the 3rd power").should(eq(64))
  end
  it('returns the answer for multiple operations') do
    calculator_in_words("What is 6 plus 8 divided by 2").should(eq(7))
  end
end
