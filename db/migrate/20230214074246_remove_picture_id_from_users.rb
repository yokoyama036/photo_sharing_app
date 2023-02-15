class RemovePictureIdFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :users, :pictures
    remove_reference :users, :picture, index: true
  end
end
