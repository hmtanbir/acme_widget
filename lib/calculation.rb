# frozen_string_literal: true

require_relative 'product'
require_relative 'promotion'
require_relative 'offers/red_widget_offer'
require_relative 'delivery_rule'
require_relative 'basket'

PRODUCTS = [
  Product.new(code: 'R01', name: 'Red Widget', price: 32.95),
  Product.new(code: 'G01', name: 'Green Widget', price: 24.95),
  Product.new(code: 'B01', name: 'Blue Widget', price: 7.95)
].freeze

DELIVERY_RULES = [
  [50.00, 4.95],
  [90.00, 2.95]
].freeze

PROMOTIONS = [RedWidgetOffer.new].freeze

class Calculation

  def initialize(codes)
    @codes = codes
  end

  def total
    delivery_rule = DeliveryRule.new(DELIVERY_RULES)
    basket = Basket.new(products: PRODUCTS, delivery_rule: delivery_rule, promotions: PROMOTIONS)

    @codes.each { |code| basket.add(code) }
    basket.total
  end
end
