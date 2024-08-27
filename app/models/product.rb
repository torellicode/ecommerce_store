class Product < ApplicationRecord
  belongs_to :category
  belongs_to :subcategory, class_name: 'Category'
  belongs_to :vendor, class_name: 'User', foreign_key: 'user_id'

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :inventory_count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :subcategory_id, presence: true
end
