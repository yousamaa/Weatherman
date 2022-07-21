# frozen_string_literal: true

# This module will calculate all the stats
module Stats
  def highest_temperature(collection)
    local_max = []
    max_dates = []
    collection.each do |file|
      local_max << file['Max TemperatureC'].compact.map(&:to_i).max
      max_dates << file.by_col[0][max_index(file['Max TemperatureC'])]
    end
    [local_max.max, max_dates[max_index(local_max)]]
  end
  
  def lowest_temperature(collection)
    local_min = []
    min_dates = []
    collection.each do |file|
      local_min << file['Min TemperatureC'].compact.map(&:to_i).min
      min_dates << file.by_col[0][min_index(file['Min TemperatureC'])]
    end
    [local_min.min, min_dates[min_index(local_min)]]
  end

  def most_humid(collection)
    local_max = []
    max_dates = []
    collection.each do |file|
      local_max << file['Max Humidity'].compact.map(&:to_i).max
      max_dates << file.by_col[0][max_index(file['Max Humidity'])]
    end
    [local_max.max, max_dates[max_index(local_max)]]
  end

  def highest_average(collection)
  end

  def lowest_average(collection)
  end

  def humidity_average(collection)
  end

  def month_high_low(collection)
  end

  def max_index(column)
    column.map(&:to_i).each_with_index.max[1]
  end

  def min_index(column)
    column.map(&:to_i).each_with_index.min[1]
  end
end
