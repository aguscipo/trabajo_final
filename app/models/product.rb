class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :trademark
  has_and_belongs_to_many :payments
  searchable do
    text :name
    integer :category_id
    integer :trademark_id
    integer :price
  end
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  mount_uploader :cover_picture, PictureUploader
	validates :name, presence: true, length: { maximum: 100 },uniqueness: true
	validates :price, presence:true
  validates :category_id, presence:true
  validates :trademark_id, presence:true
	validates :stock, presence:true, :numericality => { :greater_than_or_equal_to => 0 }
	validates :description, presence:true
	validates :code, presence:true
  validate  :picture_size

  def to_param #Modificar para que aparezca nombre de categoria en la url
    name
  end

  # Validates the size of an uploaded picture.
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end

end
