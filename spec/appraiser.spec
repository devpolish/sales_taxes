# frozen_string_literal: true

require 'sales_taxes'

describe SalesTaxes do
  let(:headers) { %w[quantity product price].freeze }
  let(:appraiser) { SalesTaxes::Appraiser.new(fixture_file_path('order.csv')) }

  it 'products should not have headers' do
    expect(appraiser.products).not_to include(headers)
  end
end
