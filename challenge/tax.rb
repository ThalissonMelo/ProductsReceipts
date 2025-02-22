class Tax
  def initialize(product)
    @product = product
    @basic_sales_tax = 0.10
    @import_duty_tax = 0.05
    @tax_price = 0.0
  end

  def calculate
    @tax_price = basic_sales + import_duty + @product.price
  end

  def tax_price
    @tax_price
  end

  private

  def basic_sales
    return 0 unless @product.is_taxable

    tax = (@product.price * 0.10).ceil(2)
    (tax * 20).ceil / 20.0
  end

  def import_duty
    return 0 unless @product.imported

    tax = (@product.price * 0.05).ceil(2)
    (tax * 20).ceil / 20.0
  end
end
