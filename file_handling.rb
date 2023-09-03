# frozen_string_literal: true

require 'date'
require 'csv'
require_relative 'stats'

include Stats

# This module will handle files it will command line argumnets and save them in an array format
module FileHandling
  # This class saves all the data of files
  class Collection
    def initialize
      @collection = []
    end

    def self.extract_file_names(choice, year_month, path)
      case choice
      when 'e'
        Collection.new.filter_files(Dir["#{path}/**/*.txt"], year_month)
      when 'a'
        Collection.new.filter_files([] << "#{path}/#{Collection.new.appending_filename(year_month, path)}.txt", year_month)
      when 'c'
        Collection.new.filter_files([] << "#{path}/#{Collection.new.appending_filename(year_month, path)}.txt", year_month)
      when 'b'
        Collection.new.filter_files([] << "#{path}/#{Collection.new.appending_filename(year_month, path)}.txt", year_month)
      end
    end
  
    def filter_files(files, year_month)
      files.delete_if { |f| !f.include?(year_month) } if files.length != 1
      extract_data(files)
    end
  
    def extract_data(files)
      files.each do |f|
        @collection << CSV.parse(File.read(f), headers: true)
      end
      @collection
    end
  
    def appending_filename(year_month, path)
      appended = path.split('/')[-1] << '_' << year_month.split('/')[0] << '_'
      appended << Date::ABBR_MONTHNAMES[year_month.split('/')[-1].to_i]
    end
  end
end
