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
    "#{name wins!}"
  end

  def loser
    "#{name looses!}"
  end

  private

  def choices
    %i(rock paper scissors)
  end
end