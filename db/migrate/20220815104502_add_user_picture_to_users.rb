class AddUserPictureToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user_picture, :string
  end
end
