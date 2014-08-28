class Darts
  def self.calculate(score_card)
      start_total = 0
      arr_scorecard = get_score_lines(score_card)

      unless arr_scorecard.empty?
        if arr_scorecard.first.downcase.include? 'starts at'
          start_total = get_int(arr_scorecard.first)
          arr_scorecard.shift
        end
      end

      if start_total.equal? 0
        calculate_total = get_total(arr_scorecard, start_total, :add_total => true)
      else
        calculate_total = get_total(arr_scorecard, start_total, :sub_total => true)
      end

      calculate_total
  end

  def self.quickest_finish(score_card)
    new_total = self.calculate(score_card)
    how_to_finish = Array.new

    until new_total.equal? 0
      if new_total > 62
        new_total -= 60
        how_to_finish << 'Triple 20'
      elsif new_total > 40
        new_total -= 40
        how_to_finish << 'double 20'
      else
        if new_total.even?
          double_int = new_total / 2
          new_total -= new_total
          how_to_finish << "double #{double_int}"
        else
          new_total -= 1
          how_to_finish << '1'
        end
      end
    end
    how_to_finish
  end

  def self.get_multiplier(score)
    if score.downcase.include? 'double'
      2
    elsif score.downcase.include? 'triple'
      3
    else
      1
    end
  end

  def self.get_int(score)
    score[/\d+/].to_i
  end

  def self.get_text(score)
    score[/^[a-zA-Z]*/]
  end

  def self.get_score_lines(score_card)
    score_card.strip.split("\n").map(&:strip)
  end

  def self.is_double?(score)
    get_text(score.to_s).downcase.equal? 'double'
  end

  def self.get_total(arr_score, return_total = 0, params = {})
    arr_score.each do | score |
      Valid_Scores.is_int_valid?(score)
      Valid_Scores.is_text_valid?(score)
      score = get_int(score) * get_multiplier(score)
      if params[:add_total]
        return_total += score
      elsif params[:sub_total]
        return_total -= score unless score > return_total || (score.equal?(return_total) && !is_double?(score))
      end
    end

    return_total
  end
end