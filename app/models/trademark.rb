class Trademark < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  def to_param
    name
  end
end
