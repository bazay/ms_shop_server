class ShopController < ApplicationController
  def index
    @products = product_catalog.products
  end

  private

  def product_catalog
    @product_catalog ||= ProductCatalogQuery.new
  end
end
