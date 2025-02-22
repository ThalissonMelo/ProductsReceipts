require_relative './dicts'

class Product
  def initialize(price:, quantity:, name:, imported:)
    @price = price.to_f
    @quantity = quantity.to_i
    @name = name
    @imported = imported

    @type = get_type_by_name
    @is_taxable = check_if_is_taxable
  end

  def price
    @price
  end

  def quantity
    @quantity
  end

  def name
    @name
  end

  def imported
    @imported
  end

  def type
    @type
  end

  def is_taxable
    @is_taxable
  end

  private

  def get_type_by_name
    name.split(' ').each do |word|
      word = word[0..-2] if word[-1] == 's'

      return 'medical' if MEDICINE_DICT.include?(word)
      return 'book' if BOOK_DICT.include?(word)
      return 'food' if FOOD_DICT.include?(word)
    end

    'other'
  end

  def check_if_is_taxable
    return true if type == 'other'
    false
  end
end
