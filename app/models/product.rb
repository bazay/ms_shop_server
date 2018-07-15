# == Schema Information
#
# Table name: products
#
#  id           :integer          not null, primary key
#  product_name :string
#  code         :string
#  price        :decimal(8, 2)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Product < ApplicationRecord
  validates :product_name, presence: true, allow_blank: false
  validates :code, uniqueness: true, presence: true, allow_blank: false
  validates :price, numericality: { greater_than: 0 }
end
