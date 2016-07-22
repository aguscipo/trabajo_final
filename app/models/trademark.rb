class Trademark < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  def to_param #Modificar para que aparezca nombre de categoria en la url
    name
  end
end
