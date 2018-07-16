RSpec.describe BasketForm do
  let(:form) { described_class.new basket, params }
  let(:basket) { create :basket }
  let(:params) { {} }

  describe '#save' do
    subject { form.save }

    it { is_expected.to be_falsy }

    context 'when product code is provided' do
      let(:params) { { product_code: product_code } }
      let(:product) { create :product }
      let(:product_code) { product.code }

      it { is_expected.to be_truthy }

      context 'but is invalid' do
        let(:product_code) { 'invalid_product_code' }

        it { is_expected.to be_falsy }
      end
    end
  end
end
