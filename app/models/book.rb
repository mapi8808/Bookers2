class Book < ApplicationRecord
  
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
   validates :title, presence: true
   validates :body, length: { maximum: 200 }, presence: true
   

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end 
  
  def self.search(search)
    if search
        Book.where(['item_name LIKE (?)', "%#{search}%"])
    else
        Book.all 
    end
  end
   
end
