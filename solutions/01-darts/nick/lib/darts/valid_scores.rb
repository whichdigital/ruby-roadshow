module Darts::Valid_Scores
  def self.is_int_valid?(line)
    begin
      case Darts.get_int(line)
        when 1..20
          line
        when 25
          line
        when 50
          line
        else
          raise ArgumentError, "Incorrect score - Please enter a digit with in the range 1-20, 25 and 25; Input given: #{line}"
      end
    rescue ArgumentError => e
      puts e
      raise e
    end
  end

  def self.is_text_valid?(line)
    begin
        case Darts.get_text(line)
          when 'double'
            check_valid_multiplier(line)
          when 'triple'
            check_valid_multiplier(line)
          when ''
            line
          else
            raise ArgumentError, "Incorrect score - Please enter use double, triple or nothing before the number; Input given: #{line}"
        end
    rescue ArgumentError => e
      puts e
      raise e
    end
  end

  def self.check_valid_multiplier(line)
    begin
      unless Darts.get_int(line).between?(1,20)
        raise ArgumentError, "Incorrect use of double or triple - You can only use double or triple on a digit with in the range 1-20: #{line}"
      end
    rescue ArgumentError => e
      puts e
      raise e
    end
  end
end