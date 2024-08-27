 class Category < ApplicationRecord
  has_many :subcategories, class_name: "Category", foreign_key: "parent_id", dependent: :destroy
  belongs_to :parent_category, class_name: "Category", optional: true, foreign_key: "parent_id"

  has_many :products

  validates :name, presence: true
end
