# frozen_string_literal: true

require 'sales_taxes/helpers/matcher'

describe MatcherHelper do
  using MatcherHelper

  it 'should raise an exception' do
    expect { 3.exempt? }.to raise_error(NoMethodError)
  end

  it 'should throw false' do
    expect('alcohol'.exempt?).to be_falsy
  end
end
