class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :deliver_address

  validates :last_name,
            :first_name,
            :last_name_kana,
            :first_name_kana,
            :postcode,
            :prefecture,
            :city,
            :house_number,
            :nickname,
            presence: true
  validates :nickname, presence: true, length: { maximum: 20 }

  has_many :items
  has_many :items, foreign_key: :seller_id
  has_many :items, foreign_key: :buyer_id
  has_many :likes, dependent: :destroy

  acts_as_follower  #フォローする
  acts_as_followable  #フォローされる

end
