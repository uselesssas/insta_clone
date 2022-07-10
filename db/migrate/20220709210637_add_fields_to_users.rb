class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :real_name, :string
    add_column :users, :website, :string
    add_column :users, :bio, :text
    add_column :users, :phone, :integer
    add_column :users, :gender, :string
  end
end
