class Product < ApplicationRecord
  belongs_to :vendor, class_name: 'User', foreign_key: 'user_id'

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :inventory_count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :user_id, presence: true
end
