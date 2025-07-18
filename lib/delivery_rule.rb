# frozen_string_literal: true

class DeliveryRule
  def initialize(rules)
    @rules = rules.sort_by { |limit, _| limit }
  end

  def calculate_charge(subtotal)
    return 0 if subtotal == 0

    @rules.each do |limit, charge|
      return charge if subtotal < limit
    end
    0.0
  end
end
