class ShopController < ApplicationController
  def index
    @products = product_catalogue.products
    current_basket.products = @products
  end

  private

  def product_catalogue
    @product_catalogue ||= ProductCatalogueQuery.new
  end
end
