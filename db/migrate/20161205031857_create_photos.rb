class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.string :title
      t.string :photo
      t.text :content
      t.timestamps null: false
    end
  end
end
