require 'rspec'
require_relative '../challenge/product'

RSpec.describe Product do
  describe '#initialize' do
    subject(:product) { Product.new(price: 10.0, quantity: 2, name: 'book', imported: true) }

    it 'initializes with correct price' do
      expect(product.price).to eq(10.0)
    end

    it 'initializes with correct quantity' do
      expect(product.quantity).to eq(2)
    end

    it 'initializes with correct name' do
      expect(product.name).to eq('book')
    end

    it 'initializes with correct imported' do
      expect(product.imported).to eq(true)
    end

    it 'initializes with correct type' do
      expect(product.type).to eq('book')
    end

    it 'initializes with correct is_taxable' do
      expect(product.is_taxable).to eq(false)
    end
  end

  describe '#get_type_by_name' do
    subject(:product) { Product.new(price: 50.0, quantity: 1, name: name, imported: false) }

    context 'when the product name is "pills"' do
      let(:name) { 'pills' }

      it 'returns type medical' do
        expect(product.type).to eq('medical')
      end
    end

    context 'when the product name is "chocolate"' do
      let(:name) { 'chocolate' }

      it 'returns type medicine' do
        expect(product.type).to eq('food')
      end
    end

    context 'when the product name is "book"' do
      let(:name) { 'book' }

      it 'returns type medicine' do
        expect(product.type).to eq('book')
      end
    end

    context 'when the product name is "cellphone"' do
      let(:name) { 'cellphone' }

      it 'returns type other' do
        expect(product.type).to eq('other')
      end
    end
  end

  describe '#is_taxable' do
    subject(:product) { Product.new(price: 50.0, quantity: 1, name: name, imported: false) }

    context 'when the product type is "other"' do
      let(:name) { 'gadget' }

      it 'returns true' do
        expect(product.is_taxable).to eq(true)
      end
    end

    context 'when the product type is "book"' do
      let(:name) { 'book' }

      it 'returns false' do
        expect(product.is_taxable).to eq(false)
      end
    end
  end
end
