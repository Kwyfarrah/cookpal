class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.datetime :datetime
      t.string :address
      t.integer :capacity
      t.text :description
      t.boolean :status
      t.references :user, null: false, foreign_key: true
      t.references :homecook, null: false, foreign_key: true

      t.timestamps
    end
  end
end
