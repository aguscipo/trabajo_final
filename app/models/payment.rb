class Payment < ActiveRecord::Base
  validates :card_number, length: { is: 16 }
  validates :security_code, length: { is: 3 }
end
