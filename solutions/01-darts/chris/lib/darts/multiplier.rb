module Darts::Multiplier

  def self.for(line)
    if line.start_with?("triple")
      3
    elsif line.start_with?("double")
      2
    else
      1
    end
  end

end
