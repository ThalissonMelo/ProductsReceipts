require_relative './tax'

class Receipt
  def initialize(products)
    @products = products
  end

  def build_receipt
    total_tax, total_price, receipt = 0.0, 0.0, ""

    @products.each do |product|
      tax = Tax.new(product).tap(&:calculate)
      price_with_tax = calculate_price_with_tax(tax, product)
      product_tax = calculate_product_tax(tax, product)

      total_price += price_with_tax
      total_tax += product_tax

      receipt << build_receipt_line(product, price_with_tax)
    end

    receipt << build_totals(total_tax, total_price)
  end

  private

  def calculate_price_with_tax(tax, product)
    tax.tax_price * product.quantity
  end

  def calculate_product_tax(tax, product)
    (tax.tax_price - product.price) * product.quantity
  end

  def build_receipt_line(product, price_with_tax)
    "#{product.quantity} #{product.imported ? "imported " : ""}#{product.name}: #{'%.2f' % price_with_tax}\n"
  end

  def build_totals(total_tax, total_price)
    "Sales Taxes: #{'%.2f' % total_tax}\nTotal: #{'%.2f' % total_price}\n"
  end
end
