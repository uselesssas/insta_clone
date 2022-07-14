class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :bookmarks, -> { order(created_at: :desc) }, dependent: :destroy

  def belongs_to_user?(user)
    Post.find_by(user_id: user.id, id: id)
  end

  def liked?(user)
    Like.find_by(user_id: user.id, post_id: id)
  end

  def in_bookmarks?(user)
    Bookmark.find_by(user_id: user.id, post_id: id)
  end
end
