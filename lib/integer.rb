module ConvertNumToEng
  FIX_NAME= {
    0  => "zero",
    1  => "one",
    2  => "two",
    3  => "three",
    4  => "four",
    5  => "five",
    6  => "six",
    7  => "seven",
    8  => "eight",
    9  => "nine",
    10 => "ten",
    11 => 'eleven',
    12 => 'twelve',
  }

  IRR_NAME = {
    2 => "twen",
    3 => "thir",
    4 => "four",
    5 => "fif",
    6 => "six",
    7 => "seven",
    8 => "eigh",
    9 => "nine",
  }
  
  def to_eng_under_999(num)
    english =
      case num
      when 0..12 # include edges
        FIX_NAME[num]
      when 13..19
        digit = IRR_NAME[num % 10]
        digit + "teen"
      when 20..99
        ten_digit = IRR_NAME[num / 10]
        digit     = FIX_NAME[num % 10]
        
        ten_digit.slice!("u") if "four" == ten_digit
        digit = ""            if "zero" == digit
        
        ten_digit + "ty\s" + digit
      when 100..999
        handred_digit = FIX_NAME[num / 100]
        under_handred = to_eng_under_999(num % 100)
        
        under_handred = "" if "zero"== under_handred
        
        handred_digit + "\shandred\s" + under_handred
      end
    english.strip
  end

  module_function :to_eng_under_999
end

class Integer
  def to_eng
    english = ConvertNumToEng::to_eng_under_999(self)
  end
end
