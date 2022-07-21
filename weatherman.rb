# frozen_string_literal: true

require_relative 'file_handling'
require_relative 'stats'
require_relative 'printing'

include FileHandling
include Stats
include Printing

# This is the main module
module Weatherman
  choice = ARGV[0][-1]
  year_month = ARGV[1]
  path = ARGV[2]
  collection = extract_file_names(choice, year_month, path)
  case choice
  when 'e'
    case_e(collection)
  when 'a'
    case_a(collection)
  when 'c'
    case_c(collection)
  when 'b'
    case_b(collection)
  end
end
