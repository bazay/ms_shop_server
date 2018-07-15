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

RSpec.describe Product, type: :model do
  subject { product }

  let(:product) { build :product }

  describe 'validates' do
    it { is_expected.to be_valid }

    it_behaves_like 'product attribute invalid', :product_name, nil
    it_behaves_like 'product attribute invalid', :code, nil
    it_behaves_like 'product attribute invalid', :price, -10.00

    context 'when product exists with code' do
      let!(:existing_product) { create :product, code: existing_code }
      let(:existing_code) { 'C01' }

      it_behaves_like 'product attribute invalid', :code, 'C01'
    end
  end
end
