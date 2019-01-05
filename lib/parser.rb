# frozen_string_literal: true

require 'optparse'

# Parse options as a CLI
module Parser
  OPTIONS = {}
  def self.parse_options!
    parse = OptionParser.new do |ps|
      ps.banner = 'ruby bin/reporter --help'
      ps.separator ''
      ps.on('-f filename', '--csv-file=filename', 'Input file') do |filename|
        OPTIONS[:filename] = filename
      end
    end
    parse.parse!
  end
end
