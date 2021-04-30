class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # ここから手動で追記=============================================
  attachment :profile_image
  validates :name, uniqueness: true, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }
  # ここまで手動で追記=============================================

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ここから手動で追記=============================================
  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :active_relationships, class_name:  "Relationship", foreign_key: "follower_id", dependent:  :destroy
  has_many :follows, through: :active_relationships, source: :followed
  
  has_many :passive_relationships, class_name:  "Relationship", foreign_key: "followed_id", dependent:   :destroy
  has_many :followers, through: :passive_relationships, source: :follower


  # ここまで手動で追記=============================================
end
