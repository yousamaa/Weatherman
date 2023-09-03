# frozen_string_literal: true

require_relative 'file_handling'
require_relative 'stats'
require_relative 'printing'

include FileHandling
include Stats
include Printing

# This is the main module
module Weatherman
  # This is the main class
  class Main
    choice = ARGV[0][-1]
    year_month = ARGV[1]
    path = ARGV[2]
    collection = Collection.extract_file_names(choice, year_month, path)
    case choice
    when 'e'
      Output.case_e(collection)
    when 'a'
      Output.case_a(collection)
    when 'c'
      Output.case_c(collection, year_month)
    when 'b'
      Output.case_b(collection, year_month)
    end
  end
end
