require 'rails_helper'

describe "the edit a project process" do
  it "edits a project" do
    Skill.create(name: "Ruby", description: "test", experience: "test", id: 1)
    Project.create(name: "Poker", description: "test", github_link: "test", skill_id: 1)
    admin = FactoryGirl.create(:admin)
    login_as admin, scope: :user
    visit projects_path
    click_on "Poker"
    click_on "Edit"
    fill_in 'Name', :with => 'RUBY'
    fill_in 'Description', :with => 'TEST'
    fill_in 'Github link', :with => 'TEST'
    click_on 'Update Project'
    expect(page).to have_content 'RUBY'
  end

  it "gives error when an empty value is entered" do
    Skill.create(name: "Ruby", description: "test", experience: "test", id: 1)
    Project.create(name: "Poker", description: "test", github_link: "test", skill_id: 1)
    admin = FactoryGirl.create(:admin)
    login_as admin, scope: :user
    visit projects_path
    click_on "Poker"
    click_on "Edit"
    fill_in 'Name', :with => ''
    fill_in 'Description', :with => ''
    fill_in 'Github link', :with => ''
    click_on 'Update Project'
    expect(page).to have_content 'errors'
  end

end
