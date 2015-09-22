class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :author
      t.text :body
      t.integer :rating
      t.references :artist, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
