class BasketPriceCalculator < Struct.new(:basket)
  delegate :products, to: :basket

  def basket_total
    product_total + delivery_price
  end

  def product_total
    products.sum(&:price)
  end

  def delivery_price
    return 0 if product_total.zero?

    if product_total < 50
      4.95
    elsif product_total < 90
      2.95
    else
      0
    end
  end
end
