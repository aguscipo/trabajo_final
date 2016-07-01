class Category < ActiveRecord::Base
  has_many :products
  validates :name, presence: true, length: { maximum: 100 }
  def to_param
  name
end
end
