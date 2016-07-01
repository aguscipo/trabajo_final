class Category < ActiveRecord::Base
  has_many :products
  validates :name, presence: true, length: { maximum: 100 }, uniqueness: true


  def to_param #Modificar para que aparezca nombre de categoria en la url
    name
  end
end
