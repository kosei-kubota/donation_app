class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :password, presence: true, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{8,}+\z/i }
  with_options presence: true do
    validates :nickname
  end

 

  has_one :card, dependent: :destroy
  has_many :donations
  has_many :orders

end
