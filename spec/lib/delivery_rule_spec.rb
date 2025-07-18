# spec/delivery_rule_spec.rb
require 'rspec'
require_relative '../spec_helper'

RSpec.describe DeliveryRule do
  let(:rule) do
    DeliveryRule.new([
                       [50.00, 4.95],
                       [90.00, 2.95]
                     ])
  end

  it "returns correct delivery charge for under $50" do
    expect(rule.calculate_charge(49.99)).to eq(4.95)
  end

  it "returns correct delivery charge for $50-$89.99" do
    expect(rule.calculate_charge(50.00)).to eq(2.95)
    expect(rule.calculate_charge(89.99)).to eq(2.95)
  end

  it "returns 0 delivery for $90 and above" do
    expect(rule.calculate_charge(90.00)).to eq(0.0)
    expect(rule.calculate_charge(120.00)).to eq(0.0)
  end
end
