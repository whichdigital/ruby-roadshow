class Darts

  VALID_SINGLES = (1..20).to_a << 25 << 50
  VALID_NON_SINGLES = (1..20).to_a

  def initialize
  end

  def line_score(line)
    type, number = line.split(' ')
    number = number.nil? ? type.to_i : number.to_i

    if type == 'double'
      if Darts::VALID_NON_SINGLES.include? number
        return number * 2
      end
    elsif type === 'triple'
      if Darts::VALID_NON_SINGLES.include? number
        return number * 3
      end
    else
      if Darts::VALID_SINGLES.include? number
        return number
      end
    end

    raise 'Valid scores are: 1 up to 20, 25 and 50.
           You cannot double or triple on 25 or 50.'

  end

end