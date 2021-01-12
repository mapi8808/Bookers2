class Book < ApplicationRecord
  
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
   validates :title, presence: true
   validates :body, length: { maximum: 200 }, presence: true
   

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end 
  
  def Book.search(search, user_or_book)
    if user_or_book == "2"
      if how_search == "1"
        Book.where(['name LIKE ?', "#{search}"])
      elsif how_search == "2"
        Book.where(['name LIKE ?', "#{search}%"])
      elsif how_search == "3"
        Book.where(['name LIKE ?', "%#{search}"])
      elsif how_search == "4"
        Book.where(['name LIKE ?', "%#{search}%"])
      else
       Book.all
      end
    end
  end
end
