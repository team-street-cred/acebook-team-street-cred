require 'rails_helper'
require 'web_helper'

RSpec.feature "Not update posts", type: :feature do
  scenario "User cannot update others' posts" do
    log_in
    expect(current_user.first_name).to eq('Bob')
    click_link "New post"
    fill_in "Message", with: "I'm going to update this one"
    click_button "Submit"
    expect(page.find('#posts li:first-child')).to have_content("I'm going to update this one")
    page.find('#posts li:first-child').click_button('Edit')
    fill_in "post_message", with: "This is updated"


  end

  scenario "User can update own posts" do
    log_in
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
    page.find('#posts li:first-child').click_button('Edit')
    fill_in "post_message", with: "This is updated"
    click_button "Submit"
    expect(page).to have_content("This is updated")
  end
end
