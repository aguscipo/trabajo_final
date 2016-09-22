class Payment < ActiveRecord::Base
  attr_accessor :result, :payment_data
  has_and_belongs_to_many :products
  belongs_to :user
  validates :card_number, presence: true
  validates :security_code, presence: true
  validates :expiration_month, presence: true
  validates :expiration_year, presence: true
  validates :doc_number, presence: true
  validate :check_expiration_date

  def approved?
      self.result["response"]["status"] == "approved"
  end

  def add product
    self.products<<product
  end

  def check_expiration_date
    if expiration_year < Date.today.year && expiration_month < Date.today.month
      errors.add(:expiration_year, t(:expired_card))
    end
  end
end
