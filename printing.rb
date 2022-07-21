# frozen_string_literal: true

require_relative 'stats'
require 'date'
require 'colorize'

include Stats

# This module will output all the stats to the screen
module Printing
  # This class outputs the results on screen
  class Output
    def self.case_e(collection)
      puts "Highest: #{Result.highest_temperature(collection)[0]}C on #{Date::MONTHNAMES[Result.highest_temperature(collection)[1].split('-')[1].to_i]} #{Result.highest_temperature(collection)[1].split('-')[2]}"
      puts "Lowest: #{Result.lowest_temperature(collection)[0]}C on #{Date::MONTHNAMES[Result.lowest_temperature(collection)[1].split('-')[1].to_i]} #{Result.lowest_temperature(collection)[1].split('-')[2]}"
      puts "Humid: #{Result.most_humid(collection)[0]}% on #{Date::MONTHNAMES[Result.most_humid(collection)[1].split('-')[1].to_i]} #{Result.most_humid(collection)[1].split('-')[2]}"
    end

    def self.case_a(collection)
      puts "Highest Average: #{Result.highest_average(collection)}C"
      puts "Lowest Average: #{Result.lowest_average(collection)}C"
      puts "Average Humidity: #{Result.humidity_average(collection)}%"
    end
  
    def self.case_c(collection, year_month)
      max_min = Result.month_high_low(collection)
      puts "#{Date::MONTHNAMES[year_month.split('/')[-1].to_i]} #{year_month.split('/')[0]}"
      max_min[0].length.times do |n|
        max_min.length.times do |m|
          max_min[m][n].times { print '+'.red } if m.zero?
          max_min[m][n].times { print '+'.blue } unless m.zero?
          puts "#{max_min[m][n]}C"
        end
      end
    end
  
    def self.case_b(collection, year_month)
      max_min = Result.month_high_low(collection)
      puts "#{Date::MONTHNAMES[year_month.split('/')[-1].to_i]} #{year_month.split('/')[0]}"
      max_min[0].length.times do |n|
        max_min[1][n].times { print '+'.blue }
        max_min[0][n].times { print '+'.red }
        puts "#{max_min[1][n]}C - #{max_min[0][n]}C"
      end
    end
  end
end
