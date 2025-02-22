require 'rspec'
require_relative '../challenge/product'
require_relative '../challenge/tax'

RSpec.describe Tax do
  describe '#calculate' do
    subject(:tax) { described_class.new(product) }

    context 'when product is taxable and imported' do
      let(:product) { Product.new(price: 100.0, quantity: 1, name: 'pen', imported: true) }

      it 'returns the correct calculation' do
        tax.calculate
        expect(tax.tax_price).to eq(115.0)
      end
    end

    context 'when product is taxable and non-imported' do
      let(:product) { Product.new(price: 100.0, quantity: 1, name: 'pencil', imported: false) }

      it 'returns the correct calculation' do
        tax.calculate
        expect(tax.tax_price).to eq(110.0)
      end
    end

    context 'when product is non-taxable and imported' do
      let(:product) { Product.new(price: 100.0, quantity: 1, name: 'chocolate', imported: true) }

      it 'returns the correct calculation' do
        tax.calculate
        expect(tax.tax_price).to eq(105.0)
      end
    end

    context 'when product is non-taxable and non-imported' do
      let(:product) { Product.new(price: 100.0, quantity: 1, name: 'pills', imported: false) }

      it 'returns the correct calculation' do
        tax.calculate
        expect(tax.tax_price).to eq(100.0)
      end
    end
  end
end
