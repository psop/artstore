class Product < ActiveRecord::Base
  has_one :photo
  has_many :comments

  accepts_nested_attributes_for :photo
end
