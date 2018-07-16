# == Schema Information
#
# Table name: basket_items
#
#  id         :integer          not null, primary key
#  basket_id  :integer
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :basket_item do
    basket
    product
  end
end
