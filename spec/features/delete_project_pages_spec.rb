require 'rails_helper'


# the following doesn't work because Capybara doesn't like
# allowing you to test JS actions like the alert (according to the intertubes)
# decided to not spend time on figuring it out as it may be covered later


# describe "the delete a project process" do
#   it "deletes a Project" do
#     Project.create(name: "Poker", description: "test", github_link: "test")
#     admin = FactoryGirl.create(:admin)
#     login_as admin, scope: :user
#     visit projects_path
#     click_on "Poker"
#     click_on "Delete"
#     click_on "OK"
#     expect(delete_link['data-confirm']).to eq 'Are you sure?'
#   end
#
# end
