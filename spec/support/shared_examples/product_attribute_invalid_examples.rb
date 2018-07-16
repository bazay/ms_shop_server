shared_examples_for 'product attribute invalid' do |attribute, value|
  let(:product) { build :product, "#{attribute}": value }

  before { product.valid? }

  it { is_expected.to have(1).error_on attribute }
end
