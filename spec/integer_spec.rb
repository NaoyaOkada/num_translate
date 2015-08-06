# -*- coding: utf-8 -*-
require 'spec_helper'

describe Integer do
  describe "success between 0 and 12" do 
    {
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
    }.each do |key, val|
      it { expect(key.to_eng).to eq(val) }
    end
  end
end
