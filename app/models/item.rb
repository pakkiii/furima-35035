class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery
  belongs_to :how_long
  belongs_to :place
  belongs_to :status

  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :title,  length: {maximum: 40}                             
    validates :value,  numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
    validates :description,  length: {maximum: 1000}
    validates :delivery_id, numericality: { other_than: 1 }
    validates :place_id, numericality: { other_than: 0 }
    validates :how_long_id, numericality: { other_than: 1 }
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
  end



end
