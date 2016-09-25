class Payment < ActiveRecord::Base
  attr_accessor :result, :payment_data
  has_and_belongs_to_many :products
  belongs_to :user

  def approved?
      self.result["response"]["status"] == "approved"
  end

  def add product
    self.products<<product
  end

end
