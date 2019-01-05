# frozen_string_literal: true

# This helpers aims to classify which products are exempt of 10 porcentage tax
module MatcherHelper
  module_function

  # These keywords stand for exempt products of basic sales tax
  WHITE_LIST = %w[books food medical].freeze

  def compare_with(product_name)
    WHITE_LIST.any? { |w| w == product_name }
  end

  private

  refine String do
    def exempt?
      MatcherHelper.compare_with(self)
    end
  end
end
