# frozen_string_literal: true

class Basket
  def initialize(products:, delivery_rule:, promotions: [])
    @catalog = products.map { |p| [p.code, p] }.to_h
    @delivery_rule = delivery_rule
    @promotions = promotions
    @items = []
  end

  def add(code)
    product = @catalog[code]
    raise "Unknown product code: #{code}" unless product

    @items << product
  end

  def total
    subtotal = @items.map(&:price).sum
    promo_discount = @promotions.map { |promo| promo.apply(@items) }.sum
    discounted_total = subtotal + promo_discount
    delivery_fee = @delivery_rule.calculate_charge(discounted_total)

    format('$%.2f', discounted_total + delivery_fee)
  end
end
