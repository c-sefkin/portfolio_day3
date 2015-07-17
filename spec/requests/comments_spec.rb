require 'rails_helper'
require 'spec_helper'

describe 'Comments' do
  it 'shows add comment form when the Add Comment link is clicked on the individual post page', js: true do
    FactoryGirl.create(:post)
    admin = FactoryGirl.create(:admin)
    login_as admin, scope: :user
    visit posts_path
    click_on "title"
    click_on "Add a Comment"
    page.should have_content("Post:")
  end

  it 'hides the comment form when the form is submitted on the individual post page', js: true do
    FactoryGirl.create(:post)
    admin = FactoryGirl.create(:admin)
    login_as admin, scope: :user
    visit posts_path
    click_on "title"
    click_on "Add a Comment"
    fill_in "Body", :with => "RSPEC TEST"
    click_on "Create Comment"
    sleep 1.seconds
    page.should_not have_content("Post: ")
  end

  it 'shows add comment form when the Add Comment link is clicked on the post comments page', js: true do
    FactoryGirl.create(:post)
    admin = FactoryGirl.create(:admin)
    login_as admin, scope: :user
    visit posts_path
    click_on "title"
    click_on "View Comments"
    click_on "Add New Comment"
    page.should have_content("Body")
  end

  it 'hides the comment form when the form is submitted on the post comments page', js: true do
    FactoryGirl.create(:post)
    admin = FactoryGirl.create(:admin)
    login_as admin, scope: :user
    visit posts_path
    click_on "title"
    click_on "View Comments"
    click_on "Add New Comment"
    fill_in "Body", :with => "RSPEC TEST"
    click_on "Create Comment"
    sleep 1.seconds
    page.should_not have_content("Body")
  end
end
