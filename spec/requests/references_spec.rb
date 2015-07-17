require 'rails_helper'
require 'spec_helper'

describe 'References' do
  it 'shows references when the See References button is clicked', js: true do
    visit skills_path
    click_on "See References"
    page.should have_content("John Doe")
  end

  it 'hides references when the hide link is clicked', js: true do
    visit skills_path
    click_on "See References"
    click_on "hide"
    page.should_not have_content("John Doe")
  end
end
