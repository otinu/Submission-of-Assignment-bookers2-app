class Book < ApplicationRecord
#ここから手動で追記=============================================
 attachment  :profile_image
 validates :title, presence: true
 validates :body, presence: true, length: { maximum: 200 }

 belongs_to :user
#ここまで手動で追記=============================================
end
