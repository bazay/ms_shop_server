RSpec.describe BasketPriceCalculator do
  let(:calculator) { described_class.new basket }
  let(:basket) { create :basket }

  describe '#basket_total' do
    subject { calculator.basket_total }

    it { is_expected.to be_zero }

    context 'when basket contains products' do
      let(:product_total) { rand(0.01..999.99).round(2) }
      let(:delivery_price) { [0, 2.95, 4.95].sample }

      before do
        allow(calculator).to receive(:product_total).and_return product_total
        allow(calculator).to receive(:delivery_price).and_return delivery_price
      end

      it { is_expected.to eq(product_total + delivery_price) }
    end
  end

  describe '#product_total' do
    subject { calculator.product_total }

    it { is_expected.to be_zero }

    context 'when basket contains products' do
      let(:basket) { create :basket, products: [product, another_product] }
      let(:product) { create :product }
      let(:another_product) { create :product }
      let(:expected_product_total) { product.price + another_product.price }

      it { is_expected.to eq expected_product_total }
    end
  end

  describe '#delivery_price' do
    subject { calculator.delivery_price }

    let(:product_total) { 0 }

    before { allow(calculator).to receive(:product_total).and_return product_total }

    it { is_expected.to be_zero }

    context 'when product total is less than 50' do
      let(:product_total) { rand(0.01..49.99).round(2) }
      let(:expected_delivery_price) { 4.95 }

      it { is_expected.to eq expected_delivery_price }
    end

    context 'when product total is between 50 and 90' do
      let(:product_total) { rand(50..89.99).round(2) }
      let(:expected_delivery_price) { 2.95 }

      it { is_expected.to eq expected_delivery_price }
    end

    context 'when product total is 90 or above' do
      let(:product_total) { rand(90..999).round(2) }
      let(:expected_delivery_price) { 0 }

      it { is_expected.to eq expected_delivery_price }
    end
  end
end
