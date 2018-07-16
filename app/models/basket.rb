# == Schema Information
#
# Table name: baskets
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Basket < ApplicationRecord
  include BasketPriceCalculation

  attr_accessor :product_code

  has_many :basket_items, dependent: :destroy
  has_many :products, through: :basket_items
end
