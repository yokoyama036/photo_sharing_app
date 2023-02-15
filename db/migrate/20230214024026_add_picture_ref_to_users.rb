class AddPictureRefToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :picture, null: false, foreign_key: true
  end
end
