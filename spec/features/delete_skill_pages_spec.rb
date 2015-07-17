require 'rails_helper'


# the following doesn't work because Capybara doesn't like
# allowing you to test JS actions like the alert (according to the intertubes)
# decided to not spend time on figuring it out as it may be covered later


# describe "the delete a skill process" do
#   it "deletes a skill" do
#     Skill.create(name: "Ruby", description: "test", experience: "test")
#     visit skills_path
#     click_on "Ruby"
#     click_on "Delete"
#     click_on "OK"
#     expect(delete_link['data-confirm']).to eq 'Are you sure?'
#   end
#
# end
