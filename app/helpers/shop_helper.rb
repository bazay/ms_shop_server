module ShopHelper
  def formatted_product_codes(products)
    products.map(&:code).join(', ')
  end
end
