class AddIntroductionToHomecooks < ActiveRecord::Migration[6.0]
  def change
    add_column :homecooks, :introduction, :text
  end
end
