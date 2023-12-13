class Book < ApplicationRecord
    belongs_to :user

    has_many :post_comments, dependent: :destroy #コメントに関する記述
    has_many :favorites, dependent: :destroy #いいね機能に関する記述

    validates :title, presence: true
    validates :body, presence: true, length: {maximum: 200}

    def favorited_by?(user)
        favorites.exists?(user_id: user.id)
    end
end
