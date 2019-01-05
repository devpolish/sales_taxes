# frozen_string_literal: true

require 'csv'

# This helpers aims to read/write CSV files.
module CSVHelper
  HEADERS = %w[quantity product price].freeze

  def self.read_file(pathname)
    CSV.read(pathname)
  rescue Errno::ENOENT => exception
    raise ArgumentError, "#{exception.class} File not found"
  end

  def self.write_file(pathname, data)
    CSV.open(pathname, 'wb') do |csv|
      # Add extra column without unfrezee array
      csv << HEADERS.dup.concat(['sales taxes'])
      data.each { |row| csv << row }
    end
  rescue Errno::ENOENT => exception
    raise ArgumentError, "#{exception.class} Pathname not found"
  end
end
