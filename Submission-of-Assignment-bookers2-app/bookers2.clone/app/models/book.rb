class Book < ApplicationRecord
  # ここから手動で追記=============================================
  # 「attachment  :profile_image」は途中で削除。
  #  今回、Bookモデルにはその本の写真はないため、Bookモデルにatttachmentは不要と判断。
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  has_many :passive_relationships, class_name:  "Relationship", foreign_key: "followed_id", dependent:   :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end


  # ここまで手動で追記=============================================
end
