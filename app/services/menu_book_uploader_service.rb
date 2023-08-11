class MenuBookUploaderService
  require 'csv'

  def self.upload(file_path)

    CSV.foreach(file_path, headers: true) do |row|

      # map the CSV columns to your database columns
      item_hash = {}
      item_hash[:name] = row['dish_name']
      item_hash[:description] = row['dish_description']
      item_hash[:dish_type] = row['dish_type']
      item_hash[:allergens] = row['allergens']
      item_hash[:price] = row['Price']
      item = MenuItem.create(item_hash)
      unless row['Category'].blank?
        item.categories << Category.find_or_create_by(name: row['Category']) if item.persisted?
      end
      puts "=============Uploaded=============#{item.name}======#{item.categories.pluck(:name)}==================="
    end
  end
end