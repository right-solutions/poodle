class CreateProfilePictures < ActiveRecord::Migration
  def change
    create_table :profile_pictures do |t|
      t.string  :image
      t.references :user
      t.timestamps
    end
  end
end