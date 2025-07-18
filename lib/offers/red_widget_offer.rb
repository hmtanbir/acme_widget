# frozen_string_literal: true

class RedWidgetOffer < Promotion
  RED_WIDGET_CODE = 'R01'

  def apply(items)
    grouped = items.group_by(&:code)
    red_widgets = grouped[RED_WIDGET_CODE] || []

    total_discount = 0.0
    red_widgets.sort_by!(&:price)
    red_widgets.each_slice(2) do |pair|
      total_discount += pair[1].price * 0.5 if pair.size == 2
    end

    -total_discount
  end

  def description
    'buy one red widget, get the second half price'
  end
end
