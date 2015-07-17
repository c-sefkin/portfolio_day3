class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.column :name, :string
      t.column :descritpion, :string
      t.timestamps
    end
  end
end
