require 'spec_helper'

RSpec.describe FizzBuzz do

  generative do
    data(:fizzbuzz) { FizzBuzz.call(- rand(100)) }

    it "returns empty array for all numbers < 1" do
      expect(fizzbuzz.to_a).to be_empty
    end
  end

  generative do
    data(:fizzbuzz) { FizzBuzz.call(rand(100)) }

    it "replaces multiples of three with \"Fizz\"" do
      fizzbuzz.select { |n| (n % 3) == 0 }.each do |fizz|
        expect(fizz).to eq("Fizz")
      end
    end

    it "replaces multiples of five with \"Buzz\"" do
      fizzbuzz.select { |n| (n % 5) == 0 }.each do |buzz|
        expect(buzz).to eq("Buzz")
      end
    end

    it "replaces multiples of five AND three with \"FizzBuzz\"" do
      fizzbuzz.select { |n| (n % 5) == 0  && (n % 3) == 0 }.each do |fizzbuzz|
        expect(fizzbuzz).to eq("FizzBuzz")
      end
    end
  end

  context "ensuring generative testing doesn't affect example based testing" do
    describe "running fizz_buzz.rb at the command line" do
      it "writes to standard out when given an argument" do
        expected = "1\n2\nFizz\n"
        result = %x(ruby fizz_buzz.rb 3)
        expect(result).to eq(expected)
      end
    end
  end
end
