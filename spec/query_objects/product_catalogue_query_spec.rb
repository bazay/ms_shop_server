RSpec.describe ProductCatalogueQuery do
  let(:query) { described_class.new }

  describe '#products' do
    subject { query.products }

    it { is_expected.to be_empty }

    context 'when there are products' do
      let!(:products) { create_list :product, 3 }

      it { is_expected.to match_array products }
    end
  end

  describe '#product_by_codes' do
    subject { query.product_by_codes product_codes }

    let(:products) { create_list :product, 2 }
    let(:product_codes) { products.map(&:code) }

    it { is_expected.to match_array products }

    context 'when product codes argument is product code string' do
      let(:product_codes) { first_product.code }
      let(:first_product) { products.first }

      it { is_expected.to match_array [first_product] }
    end
  end
end
