# spec/basket_spec.rb
require 'rspec'
require_relative '../spec_helper'

RSpec.describe Basket do
  let(:products) do
    [
      Product.new(code: 'R01', name: 'Red Widget', price: 32.95),
      Product.new(code: 'G01', name: 'Green Widget', price: 24.95),
      Product.new(code: 'B01', name: 'Blue Widget', price: 7.95)
    ]
  end

  let(:delivery_rule) do
    DeliveryRule.new([
                       [50.00, 4.95],
                       [90.00, 2.95]
                     ])
  end

  let(:promotions) { [RedWidgetOffer.new] }

  subject { Basket.new(products: products, delivery_rule: delivery_rule, promotions: promotions) }

  context "example baskets" do
    it "calculates total for B01, G01" do
      subject.add('B01')
      subject.add('G01')
      expect(subject.total).to eq("$37.85")
    end

    it "calculates total for R01, R01" do
      subject.add('R01')
      subject.add('R01')
      expect(subject.total).to eq("$54.38")
    end

    it "calculates total for R01, G01" do
      subject.add('R01')
      subject.add('G01')
      expect(subject.total).to eq("$60.85")
    end

    it "calculates total for B01, B01, R01, R01, R01" do
      ['B01', 'B01', 'R01', 'R01', 'R01'].each { |code| subject.add(code) }
      expect(subject.total).to eq("$98.28")
    end
  end

  context "error handling" do
    it "raises error for unknown product code" do
      expect { subject.add('INVALID') }.to raise_error("Unknown product code: INVALID")
    end
  end
end
