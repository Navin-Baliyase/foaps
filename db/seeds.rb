require 'csv'

# Provided headers
headers = ["dish_name", "dish_description", "dish_type", "allergens", "Category", "Price"]

# No. of rows to be generated
count = 100

# Generate and write data
CSV.open("sample_data.csv", "w", write_headers: true, headers: headers) do |csv|
  count.times do |i|
    csv << [
      Faker::Food.dish + " -#{i}",
      Faker::Food.description,
      ["Veg", "Non-Veg"].sample,
      Faker::Food.allergen,
      Faker::Food.ethnic_category,
      rand(50.0..200.0).round(2)
    ]
  end
end

puts "CSV file generated with #{count} rows of sample data."
