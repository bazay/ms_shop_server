# == Schema Information
#
# Table name: baskets
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :basket do
    trait :with_products do
      transient do
        product_count 3
      end

      after :create do |basket, evaluator|
        products = create_list(:product, evaluator.product_count)
        products.each { |product| create :basket_item, basket: basket, product: product }
      end
    end
  end
end
