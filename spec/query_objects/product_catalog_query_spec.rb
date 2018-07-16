RSpec.describe ProductCatalogQuery do
  let(:query) { described_class.new }

  describe '#products' do
    subject { query.products }

    it { is_expected.to be_empty }

    context 'when there are products' do
      let!(:products) { create_list :product, 3 }

      it { is_expected.to match_array products }
    end
  end

  describe '#product_by_code' do
    subject { query.product_by_code product_code }

    let(:product_code) { product.code }
    let(:product) { create :product }

    it { is_expected.to eq product }

    context 'when product code does not match' do
      let(:product_code) { 'invalid_product_code' }

      it { is_expected.to be_nil }
    end
  end
end
