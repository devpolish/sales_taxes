# frozen_string_literal: true

require 'csv'

def fixture_file_path(filename)
  File.join(File.expand_path('../fixtures', __dir__), filename)
end
