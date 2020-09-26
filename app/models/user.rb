class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  validates :nickname,:birthday, presence: true
  validates :last_name,:first_name, presence: true,format: {with: /\A[ぁ-んァ-ン一-龥]/,}
  validates :last_name_kana,:first_name_kana, presence: true,format: {with: /\A[ァ-ヶー－]+\z/,}
  validates :password, presence: true, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
end
