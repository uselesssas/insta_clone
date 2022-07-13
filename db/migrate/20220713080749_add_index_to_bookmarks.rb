class AddIndexToBookmarks < ActiveRecord::Migration[7.0]
  def change
    add_index :bookmarks, [:post_id, :user_id], unique: true
  end
end
