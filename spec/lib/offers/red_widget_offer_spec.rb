# spec/red_widget_offer_spec.rb
require 'rspec'
require_relative '../../spec_helper'

RSpec.describe RedWidgetOffer do
  let(:product_r) { Product.new(code: 'R01', name: 'Red Widget', price: 32.95) }
  let(:product_b) { Product.new(code: 'B01', name: 'Blue Widget', price: 7.95) }

  subject { RedWidgetOffer.new }

  context '#apply' do



  it "gives 50% off one red widget when buying two" do
    items = [product_r, product_r]
    expect(subject.apply(items)).to eq(-16.475)
  end

  it "applies discount for every pair of red widgets" do
    items = [product_r, product_r, product_r, product_r]
    expect(subject.apply(items)).to eq(-32.95)
  end

  it "only applies discount to full pairs" do
    items = [product_r, product_r, product_r]
    expect(subject.apply(items)).to eq(-16.475)
  end

  it "does not apply discount if only one red widget" do
    items = [product_r]
    expect(subject.apply(items)).to eq(0.0)
  end

  it "ignores other products" do
    items = [product_b, product_r]
    expect(subject.apply(items)).to eq(0.0)
  end
  end

  context '#description' do
    it "gives proper description" do
      expect(subject.description).to eq('buy one red widget, get the second half price')
    end
  end
end
