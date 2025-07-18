# spec/calculation_spec.rb
require 'rspec'
require_relative '../spec_helper'


RSpec.describe Calculation do
  context 'with valid basket combinations' do
    it 'returns total for B01, G01' do
      expect(Calculation.new(%w[B01 G01]).total).to eq('$37.85')
    end

    it 'returns total for R01, R01' do
      expect(Calculation.new(%w[R01 R01]).total).to eq('$54.38')
    end

    it 'returns total for R01, G01' do
      expect(Calculation.new(%w[R01 G01]).total).to eq('$60.85')
    end

    it 'returns total for B01, B01, R01, R01, R01' do
      expect(Calculation.new(%w[B01 B01 R01 R01 R01]).total).to eq('$98.28')
    end
  end

  context 'with invalid product code' do
    it 'raises error for invalid code' do
      expect { Calculation.new(%w[B01 XYZ]).total }.to raise_error('Unknown product code: XYZ')
    end
  end

  context 'edge cases' do
    it 'returns $0.00 for empty basket' do
      expect(Calculation.new([]).total).to eq('$0.00')
    end

    it 'returns delivery fee when total < $50' do
      expect(Calculation.new(%w[B01]).total).to eq('$12.90') # 7.95 + 4.95 delivery
    end
  end
end
