require 'rails_helper'

describe "the edit a skill process" do
  it "edits a skill" do
    Skill.create(name: "Ruby", description: "test", experience: "test")
    admin = FactoryGirl.create(:admin)
    login_as admin, scope: :user
    visit skills_path
    click_on "Ruby"
    click_on "Edit"
    fill_in 'Name', :with => 'RUBY'
    fill_in 'Description', :with => 'TEST'
    fill_in 'Experience', :with => 'TEST'
    click_on 'Update Skill'
    expect(page).to have_content 'RUBY'
  end

  it "gives error when an empty value is entered" do
    Skill.create(name: "Ruby", description: "test", experience: "test")
    admin = FactoryGirl.create(:admin)
    login_as admin, scope: :user
    visit skills_path
    click_on "Ruby"
    click_on "Edit"
    fill_in 'Name', :with => ''
    fill_in 'Description', :with => ''
    fill_in 'Experience', :with => ''
    click_on 'Update Skill'
    expect(page).to have_content 'errors'
  end

end
