class Product < ActiveRecord::Base
  has_one :photo
  has_many :comments
  belongs_to :category

  accepts_nested_attributes_for :photo
end
