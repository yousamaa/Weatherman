# frozen_string_literal: true

# This module will calculate all the stats
module Stats
  # This class calculates and send all the results to Output class
  class Result
    def self.highest_temperature(collection)
      local_max = []
      max_dates = []
      collection.each do |file|
        local_max << file['Max TemperatureC'].compact.map(&:to_i).max
        max_dates << file.by_col[0][Result.new.max_index(file['Max TemperatureC'])]
      end
      [local_max.max, max_dates[Result.new.max_index(local_max)]]
    end
    
    def self.lowest_temperature(collection)
      local_min = []
      min_dates = []
      collection.each do |file|
        local_min << file['Min TemperatureC'].compact.map(&:to_i).min
        min_dates << file.by_col[0][Result.new.min_index(file['Min TemperatureC'])]
      end
      [local_min.min, min_dates[Result.new.min_index(local_min)]]
    end
  
    def self.most_humid(collection)
      local_max = []
      max_dates = []
      collection.each do |file|
        local_max << file['Max Humidity'].compact.map(&:to_i).max
        max_dates << file.by_col[0][Result.new.max_index(file['Max Humidity'])]
      end
      [local_max.max, max_dates[Result.new.max_index(local_max)]]
    end
  
    def self.highest_average(collection)
      local_max = []
      collection.each do |file|
        local_max << Result.new.calculate_avg(file['Max TemperatureC'])
      end
      local_max.max
    end
  
    def self.lowest_average(collection)
      local_max = []
      collection.each do |file|
        local_max << Result.new.calculate_avg(file['Min TemperatureC'])
      end
      local_max.max
    end
  
    def self.humidity_average(collection)
      local_max = []
      collection.each do |file|
        local_max << Result.new.calculate_avg(file[' Mean Humidity'])
      end
      local_max.max
    end
  
    def self.month_high_low(collection)
      local_max = collection[0]['Max TemperatureC'].compact.map(&:to_i)
      local_min = collection[0]['Min TemperatureC'].compact.map(&:to_i)
      [local_max, local_min]
    end
  
    def max_index(column)
      column.map(&:to_i).each_with_index.max[1]
    end
  
    def min_index(column)
      column.map(&:to_i).each_with_index.min[1]
    end
  
    def calculate_avg(column)
      array_length = column.compact.length
      column.compact.map(&:to_i).inject { |sum, el| sum + el }.to_f / array_length
    end
  end
end
