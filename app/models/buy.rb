class Buy < ApplicationRecord
  has_one :customer
  belongs_to :user
  belongs_to :item

end
