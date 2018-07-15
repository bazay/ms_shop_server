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

FactoryBot.define do
  factory :product do
    product_name { Faker::Commerce.product_name }
    code { Faker::Code.asin.first(3) }
    price { Faker::Commerce.price(1..99.0, false) }
  end
end
