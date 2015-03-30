class Player
  attr_reader :name, :colour

  def initialize(name:, colour:)
    @name = name
    @colour = colour
  end

  def choice
    choices[rand(3)]
  end

  private

  def choices
    %i(rock paper scissors)
  end
end