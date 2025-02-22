require './challenge/product'
require './challenge/receipt'

def process_file(file_path)
  products = []

  File.foreach(file_path) do |line|
    if line.strip.empty?
      puts Receipt.new(products).build_receipt
      puts ''

      products.clear
      next
    end

    products << create_product(line)
  end
end

def create_product(line)
  product_info = line.split(" ")
  imported = product_info.include?('imported')
  product_name = imported ? product_info[1..-3].join(" ") : product_info[1..-2].join(" ")

  Product.new(
    price: product_info.last.to_f,
    quantity: product_info.first.to_i,
    name: product_name,
    imported: imported
  )
end

File.open('output.txt', 'w') do |file|
  original_stdout = $stdout
  $stdout = file

  process_file('input.txt')

  $stdout = original_stdout
end
