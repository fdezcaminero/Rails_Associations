class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.date :day
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
