FactoryBot.define do
  factory :post_comment do
    comment { "MyText" }
    user_id { 1 }
    post_image_id { 1 }
  end
end
