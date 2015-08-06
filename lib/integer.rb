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
end

class Integer
  def to_eng
    english = 
      case self
      when 0..12
        ConvertNumToEng::FIX_NAME[self]
      end
    english.strip unless english.nil?
  end
end
