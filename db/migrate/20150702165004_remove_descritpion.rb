class RemoveDescritpion < ActiveRecord::Migration
  def change
    remove_column(:skills, :descritpion, :string)
  end
end
