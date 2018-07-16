class ProductCatalogueQuery
  def products
    # NOTE: It is VERY bad practice to pull all rows from a table into memory e.g. Product.all, or below code...
    # Consider limiting large calls with pagination e.g. will_paginate, kaminari...
    @products ||= Product.order(product_name: :asc)
  end

  def product_by_codes(product_codes)
    products.where(code: product_codes)
  end
end
