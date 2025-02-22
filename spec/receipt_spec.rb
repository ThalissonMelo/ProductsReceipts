require 'rspec'
require_relative '../challenge/receipt'
require_relative '../challenge/product'
require_relative '../challenge/tax'

RSpec.describe Receipt do
  describe '#build_receipt' do
    subject(:receipt) { described_class.new(products).build_receipt }

    context 'when the products are passed to the receipt' do
      let(:product1) { Product.new(name: 'book', price: 12.49, quantity: 3, imported: false) }
      let(:product2) { Product.new(name: 'music CD', price: 14.99, quantity: 2, imported: false) }
      let(:product3) { Product.new(name: 'chocolate bar', price: 0.85, quantity: 5, imported: true) }
      let(:products) { [product1, product2, product3] }

      it 'builds the lines correctly' do
        expected_receipt = <<~RECEIPT
          3 book: 37.47
          2 music CD: 32.98
          5 imported chocolate bar: 4.50
          Sales Taxes: 3.25
          Total: 74.95
        RECEIPT

        expect(receipt).to eq(expected_receipt)
      end
    end
  end
end
