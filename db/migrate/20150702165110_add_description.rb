class AddDescription < ActiveRecord::Migration
  def change
    add_column(:skills, :description, :string)
  end
end
