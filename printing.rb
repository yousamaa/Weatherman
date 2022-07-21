# frozen_string_literal: true

require_relative 'stats'
require 'date'

include Stats

# This module will output all the stats to the screen
module Printing
  def case_e(collection)
    puts "Highest: #{highest_temperature(collection)[0]}C on #{Date::MONTHNAMES[highest_temperature(collection)[1].split('-')[1].to_i]} #{highest_temperature(collection)[1].split('-')[2]}"
    puts "Lowest: #{lowest_temperature(collection)[0]}C on #{Date::MONTHNAMES[lowest_temperature(collection)[1].split('-')[1].to_i]} #{lowest_temperature(collection)[1].split('-')[2]}"
    puts "Humid: #{most_humid(collection)[0]}% on #{Date::MONTHNAMES[most_humid(collection)[1].split('-')[1].to_i]} #{most_humid(collection)[1].split('-')[2]}"
  end

  def case_a(collection)
    # highest_temperature(collection)
    # lowest_temperature(collection)
    most_humid(collection)
  end

  def case_c(collection)
    # highest_temperature(collection)
    # lowest_temperature(collection)
    most_humid(collection)
  end

  def case_b(collection)
    # highest_temperature(collection)
    # lowest_temperature(collection)
    most_humid(collection)
  end
end
