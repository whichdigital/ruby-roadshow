class Rocky < Player
  def choice
    choices[rand(10)]
  end

  private

  def choices
    %i(rock rock rock rock rock rock rock rock paper scissors)
  end
end