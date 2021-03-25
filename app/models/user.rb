class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :nick_name,               presence: true
  validates :last_name,               presence: true
  validates :first_name,              presence: true
  validates :last_name_furigana,      presence: true
  validates :first_name_furigana,     presence: true
  validates :birth_day,               presence: true
  

  with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/} do
    validates :first_name
    validates :last_name
  end

  with_options format: { with: /\A[ァ-ヶー]+\z/} do
    validates :first_name_furigana
    validates :last_name_furigana
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX


end
