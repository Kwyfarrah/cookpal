class CreateHomecooks < ActiveRecord::Migration[6.0]
  def change
    create_table :homecooks do |t|
      t.integer :price_per_person
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
