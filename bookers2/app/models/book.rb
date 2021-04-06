class Book < ApplicationRecord
  # ここから手動で追記=============================================
  # 「attachment  :profile_image」は途中で削除。
  #  今回、Bookモデルにはその本の写真はないため、Bookモデルにatttachmentは不要と判断。
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

  belongs_to :user
  # ここまで手動で追記=============================================
end
