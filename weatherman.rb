# frozen_string_literal: true

require_relative 'file_handling'
include FileHandling

# This is the main module
module Weatherman
  choice = ARGV[0][-1]
  year_month = ARGV[1]
  path = ARGV[2]
  puts extract_file_names(choice, year_month, path)
end
