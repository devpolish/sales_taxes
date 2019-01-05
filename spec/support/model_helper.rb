# frozen_string_literal: true

require 'yaml'

def model_file_path(filename)
  File.join(File.expand_path('../../models', __dir__), filename)
end
