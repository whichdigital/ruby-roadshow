class Darts

  def self.calculate(*args)
    new(*args).calculate
  end

  def initialize(input)
    @input = input
  end

  def calculate
    total = 0

    lines.each do |line|
      total += Multiplier.for(line) * value_for(line)
    end

    total
  end

  private
  def lines
    @input.strip.split("\n").map(&:strip)
  end

  def value_for(line)
    line[/\d+/].to_i
  end

end

