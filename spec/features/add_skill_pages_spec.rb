require 'rails_helper'

describe "the add a skill process" do
  it "adds a new skill" do
    admin = FactoryGirl.create(:admin)
    login_as admin, scope: :user
    visit skills_path
    click_on "Add a Skill"
    fill_in 'Name', :with => 'jQuery'
    fill_in 'Description', :with => 'JS Library'
    fill_in 'Experience', :with => 'Not enough'
    click_on 'Create Skill'
    expect(page).to have_content 'jQuery'
  end

  it "gives error when no values is entered" do
    admin = FactoryGirl.create(:admin)
    login_as admin, scope: :user
    visit new_skill_path
    click_on 'Create Skill'
    expect(page).to have_content 'errors'
  end

end
