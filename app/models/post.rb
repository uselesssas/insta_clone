class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :comments, -> { order(created_at: :desc) }, dependent: :destroy

  def belongs_to_user?(user)
    Post.find_by(user_id: user.id, id: id)
  end

  def liked?(user)
    Like.find_by(user_id: user.id, post_id: id)
  end
end
