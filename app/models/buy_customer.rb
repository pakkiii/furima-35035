class BuyCustomer
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal_code, :place_id, :municipalities, :address, :tel_number, :build_name


  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :place_id, numericality: {other_than: 0}
    validates :municipalities
    validates :address
    validates :tel_number,  length: { maximum: 11}
    validates :token
  end

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Customer.create(postal_code: postal_code, place_id: place_id, municipalities: municipalities, address: address, build_name: build_name, tel_number: tel_number, buy_id: buy.id)

  end




end


