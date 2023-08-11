class MenuItem < ApplicationRecord

  validates :name, presence: true
  validates :name, uniqueness: true

  enum dish_type: ["Veg", "Non-Veg"]
  has_many :menu_item_categories
  has_many :categories, through: :menu_item_categories
end
