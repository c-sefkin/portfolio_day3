require 'rails_helper'

describe "the add a project process" do
  it "adds a new project" do
    Skill.create(name: "Ruby", description: "test", experience: "test", id: 1)
    admin = FactoryGirl.create(:admin)
    login_as admin, scope: :user
    visit skills_path
    click_on "Ruby"
    click_on "Add a Project"
    fill_in 'Name', :with => 'testName'
    fill_in 'Description', :with => 'testDesc'
    fill_in 'Github link', :with => 'testLink'
    click_on 'Create Project'
    expect(page).to have_content 'testName'
  end

  it "gives error when no values is entered" do
    Skill.create(name: "Ruby", description: "test", experience: "test", id: 1)
    admin = FactoryGirl.create(:admin)
    login_as admin, scope: :user
    visit skills_path
    click_on "Ruby"
    click_on "Add a Project"
    fill_in 'Name', :with => ''
    fill_in 'Description', :with => ''
    fill_in 'Github link', :with => ''
    click_on 'Create Project'
    expect(page).to have_content 'errors'
  end

end
