# frozen_string_literal: true

require 'sales_taxes/classifier/classifier'

describe SalesTaxes::Classifier do
  let(:classifier) { SalesTaxes::Classifier.new }

  it 'should raise a error' do
    expect { SalesTaxes::Classifier.new('fake_model.yml') }.to raise_error(ArgumentError)
  end

  it 'should returns an empty array' do
    expect(classifier.classify('the unicorns are real')).to eq([])
  end

  it 'should predicts a medical product' do
    expect(classifier.classify('headache pills')).to include('medical')
  end

  it 'should predicts a food product' do
    expect(classifier.classify('bananas and chocolates')).to include('food')
  end

  it 'should predicts a book' do
    expect(classifier.classify('computer science book')).to include('books')
  end
end
