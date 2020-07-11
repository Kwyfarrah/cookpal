class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.datetime :datetime
      t.string :address
      t.interger :capacity
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.refernces :homecook

      t.timestamps
    end
  end
end
