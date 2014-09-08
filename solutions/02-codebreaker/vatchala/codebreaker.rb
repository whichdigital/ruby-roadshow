class CodeBreaker
  def initialize(input_text)
    @input_text = input_text
    @output_text = codeBreak
  end

  def to_s
    @output_text
  end

  private

  def codeBreak
    str_chars = @input_text.split("").map { |ch| ch.ord }
    str_chars.map! do
      |ch| if ch >= 97 and ch <= 122
            97 + ((ch - 97 + 13) % 26)
           else if ch >= 65 and ch <= 90
             65 + ((ch - 65 + 13) % 26)
           else
            ch
           end
         end
    end
    str_chars.map { |ch| ch.chr }.join
  end
end


result = CodeBreaker.new "NINJR ARRQG BZRRG GBQVF PHFFB HECYN AFCYR NFRER CYLON PXJVG UNGVZ RNAQY BPNGV BAVSR NEGUN GBHEP BZZHA VPNGV BAVFO RVATZ BAVGB ERQFB CYRNF RHFRN PNRFN EPVCU RESBE LBHEE RCYLJ RYYHF RLBHE OVEGU QNLNF GURXR LKKKK"
puts result
