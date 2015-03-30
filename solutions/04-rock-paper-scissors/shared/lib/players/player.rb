class Player
  attr_reader :name, :colour

  def initialize(name:, colour:)
    @name = name
    @colour = colour
  end

  def choice
    choices[rand(3)]
  end

  def winner
    raise NotImplementedError("subclasses should implement this")
  end

  def loser
    raise NotImplementedError("subclasses should implement this")
  end

  private

  def choices
    %i(rock paper scissors)
  end
end