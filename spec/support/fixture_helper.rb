# frozen_string_literal: true

require 'csv'
require 'yaml'

def fixture_file_path(filename)
  File.join(File.expand_path('../../fixtures', __dir__), filename)
end

def model_file_path(filename)
  File.join(File.expand_path('../../../models', __dir__), filename)
end