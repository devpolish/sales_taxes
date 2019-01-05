# frozen_string_literal: true

require_relative '../naive_bayes/naive_bayes'
require 'yaml'

module SalesTaxes
  # Determines and classify products using naive bayes's theorem
  class Classifier
    def initialize
      @models = YAML.safe_load(File.read('models/train.yml'))
    end

    def classify(sentence)
      classifier.classify(*sentence.split(' '))
    end

    private

    def classifier
      @classifier ||= NaiveBayes.new(*@models.keys)
      # Train classifier based in models/train.yml
      @models.map { |k, arr| @classifier.train(k, *arr.map(&:to_sym)) } and return @classifier
    end
  end
end
