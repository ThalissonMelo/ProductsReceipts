class Tax
  BASIC_SALES_TAX_RATE = 0.10
  IMPORT_DUTY_TAX_RATE = 0.05

  attr_reader :tax_price

  def initialize(product)
    @product = product
    @tax_price = 0.0
  end

  def calculate
    @tax_price = (basic_sales + import_duty + @product.price).round(2)
  end

  private

  def basic_sales
    return 0 unless @product.is_taxable

    tax = (@product.price * BASIC_SALES_TAX_RATE).round(2)
    (tax * 20).ceil / 20.0
  end

  def import_duty
    return 0 unless @product.imported

    tax = (@product.price * IMPORT_DUTY_TAX_RATE).round(2)
    (tax * 20).ceil / 20.0
  end
end
