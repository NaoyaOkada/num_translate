# -*- coding: utf-8 -*-
require 'spec_helper'
require 'yaml'

describe Integer do
  sample_0_19    = YAML.load_file("sample.yml")
  sample_20_99   = Hash.new
  sample_100_999 = Hash.new

  i = 20
  ["twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"].each do |ten_digit|
    ["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"].each do |digit|
      sample_20_99[i] = (ten_digit + "\s" + digit).strip
      i += 1
    end
  end
  i = nil

  [100, 200, 300, 400, 500, 600, 700, 800, 900].each do |num|
    handred_digit = num / 100
    under_undred  = (handred_digit.to_s * 2).to_i
    sample_100_999[num] = sample_0_19[handred_digit] + "\s" + "handred"
    sample_100_999[num + under_undred] = sample_100_999[num] + "\s" + (sample_20_99[under_undred] ||
                                                                       sample_0_19[under_undred])
  end

  describe "success between 0 and 19" do 
    sample_0_19.each do |key, val|
      it { expect(key.to_i.to_eng).to eq(val) }
    end
  end
  
  describe "success between 20 and 99" do
    sample_20_99.each do |key, val|
      it { expect(key.to_i.to_eng).to eq(val) }
    end
  end

  describe "success between 100 and 999" do 
    sample_100_999.each do |key, val|
      it { expect(key.to_i.to_eng).to eq(val) }
    end
  end
end
