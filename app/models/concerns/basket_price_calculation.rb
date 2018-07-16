module BasketPriceCalculation
  extend ActiveSupport::Concern

  delegate :product_total, :delivery_price, :basket_total, to: :basket_price_calculator

  private

  def basket_price_calculator
    @basket_price_calculator ||= ::BasketPriceCalculator.new(self)
  end
end
