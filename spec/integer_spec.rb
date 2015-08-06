# -*- coding: utf-8 -*-
require 'spec_helper'
require 'yaml'

describe Integer do
  sample_data = YAML.load_file("sample.yml")
  describe "success" do 
    sample_data.each do |key, val|
      it { expect(key.to_i.to_eng).to eq(val) }
    end
  end
end

