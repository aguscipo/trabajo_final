class Product < ActiveRecord::Base
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  mount_uploader :cover_picture, PictureUploader
	validates :name, presence: true, length: { maximum: 100 }
	validates :price, presence:true
	validates :stock, presence:true
	validates :category, presence:true
	validates :description, presence:true
	validates :trademark, presence:true
	validates :code, presence:true
  	validate  :picture_size

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end

end
