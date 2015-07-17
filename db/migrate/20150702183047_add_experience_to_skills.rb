class AddExperienceToSkills < ActiveRecord::Migration
  def change
    add_column(:skills, :experience, :string)
  end
end
