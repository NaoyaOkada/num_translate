# -*- coding: utf-8 -*-
require 'spec_helper'
require 'yaml'

describe Integer do
  sample_0_19          = YAML.load_file("sample.yml")
  sample_20_99         = Hash.new
  sample_100_999       = Hash.new
  sample_1000_9million = Hash.new

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

  sample_1000_9million[1000] = "one thousand"
  sample_1000_9million[1111] = "one thousand one handred eleven"
  sample_1000_9million[900_000_000] = "nine handred million"
  sample_1000_9million[999_999_999] = "nine handred ninety nine million nine handred ninety nine thousand nine handred ninety nine"
  
  sample_array = [sample_0_19, sample_20_99, sample_100_999, sample_1000_9million]

  describe "success between 0 and around nearly 1 billion" do 
    sample_array.each do |sample|
      sample.each do |key, val|
        it { expect(key.to_i.to_eng).to eq(val) }
        p "#{key}:#{val}"
      end
    end
  end
end
