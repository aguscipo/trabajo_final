class Category < ActiveRecord::Base
  has_many :products
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true

  def to_param #Modificar para que aparezca nombre de categoria en la url
    name
  end

  def get_products
    search = Product.search do
      with(:category_id, self.id)
      order_by :price, :asc
    end
    return search.results
  end
  
end
