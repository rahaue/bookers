class Book < ApplicationRecord
    # アソシエーションが実装できたら、db:migrateをしてください
    belongs_to :user
    
    validates :title, presence: true
    validates :body, presence: true, length: {maximum: 200}
end
