class CreateComics < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.string :title, :null => false
      t.string :description
      t.string :image_url
    end
  end
end
