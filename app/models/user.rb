class User < ApplicationRecord
  has_many :items

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nick_name
    validates :birth_day

    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ } do
      validates :first_name
      validates :last_name
    end

    with_options format: { with: /\A[ァ-ヶー]+\z/ } do
      validates :first_name_furigana
      validates :last_name_furigana
    end
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
end
