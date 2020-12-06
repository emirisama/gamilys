class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :genre_id
      t.integer :year_id
      t.string :production_date
      t.string :title
      t.string :image_id
      t.text :body

      t.timestamps
    end
  end
end
