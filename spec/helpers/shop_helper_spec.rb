RSpec.describe ShopHelper do
  describe '.formatted_product_codes' do
    subject { helper.formatted_product_codes products }

    let(:product) { create :product }
    let(:another_product) { create :product }
    let(:products) { [product, another_product] }
    let(:expected_result) { "#{product.code}, #{another_product.code}" }

    it { is_expected.to eq expected_result }

    context 'when products empty' do
      let(:products) { [] }

      it { is_expected.to be_blank }
    end
  end
end
