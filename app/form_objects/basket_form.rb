class BasketForm
  include ActiveModel::Model

  attr_reader :basket, :product_code

  validates :product_code, presence: true, allow_blank: false
  validate :product_code_exists?

  def initialize(basket, options)
    @basket = basket
    @product_code = options.delete(:product_code)
    super options
  end

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  def persist!
    build_product
    basket.save
  end

  private

  def build_product
    basket.basket_items.build(product: product)
  end

  def product
    @product ||= ::ProductCatalogQuery.new.product_by_code(product_code)
  end

  def product_code_exists?
    errors.add(:base, I18n.t('product_code_doesnt_match')) unless product.presence
  end
end
