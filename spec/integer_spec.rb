# -*- coding: utf-8 -*-
require 'spec_helper'
require 'yaml'

describe Integer do
  sample_data = YAML.load_file("sample.yml")
  describe "success between 0 and 19" do 
    sample_data.each do |key, val|
      it { expect(key.to_i.to_eng).to eq(val) }
    end
  end

  describe "success between 20 and 99" do
    sample_data = Hash.new
    i = 20
    ["twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"].each do |ten_digit|
      ["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"].each do |digit|
        sample_data[i] = (ten_digit + "\s" + digit).strip
        i += 1
      end
    end
    
    sample_data.each do |key, val|
      it { expect(key.to_i.to_eng).to eq(val) }
    end
  end
end

