require 'rails_helper'
require 'web_helper'

RSpec.feature "Not update posts", type: :feature do
  scenario "User cannot update others' posts" do
    log_in
    expect(page.find('#posts li:nth-child(1)')).to have_content("Huzzay!")
    expect { 
      page.find('#posts li:nth-child(1)').click_button('Edit') 
    }.to raise_error(Capybara::ElementNotFound)

  end

  scenario "User can update own posts" do
    log_in
    click_link "new post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
    page.find('#posts li:first-child').click_button('Edit')
    fill_in "post_message", with: "This is updated"
    click_button "Submit"
    expect(page).to have_content("This is updated")
  end
end
