class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes
  has_many :comments
  has_many :bookmarks, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, length: { minimum: 3, maximum: 20 }
end
