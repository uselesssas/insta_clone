class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy

  def belongs_to_user?(user)
    Post.find_by(user_id: user.id, id: id)
  end
end
