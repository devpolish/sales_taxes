# frozen_string_literal: true

require_relative 'helpers/csv'
require_relative 'helpers/matcher'
require_relative 'helpers/float'
require_relative 'classifier/classifier'

module SalesTaxes
  # Main class used to get all taxes.
  class Appraiser
    using CSVHelper
    using MatcherHelper
    using FloatHelper

    def initialize(pathname)
      @total_taxes = 0.0
      @products = CSVHelper.read_file(pathname)
    end

    def appraise
      data = []
      @products.map do |product|
        taxes = 0.0
        naive_classification = classifier.classify(product[1])
        unless !naive_classification.empty? && naive_classification.first.exempt?
          taxes += 10.percent_of(product[-1].to_f * product[0].to_i)
        end
        taxes += 5.percent_of(product[-1].to_f * product[0].to_i)
        data.push(product.concat([taxes]))
      end
      # Get total Sales Taxes
      data.push Array.new(3) << data.map(&:last).reduce(:+)
      CSVHelper.write_file('output.csv', data)
    end

    private

    def classifier
      @classifier ||= Classifier.new
    end
  end
end
