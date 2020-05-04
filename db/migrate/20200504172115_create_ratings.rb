class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :stars
      t.string :title
      t.string :content
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :beer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
