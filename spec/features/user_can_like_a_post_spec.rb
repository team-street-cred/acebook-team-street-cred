require 'rails_helper'
require 'web_helper'

RSpec.feature "Like a post", type: :feature do
  xscenario "user can like a post" do
    sign_up
    visit "/posts"
    expect {
      page.find('#posts li:first-child').click_button('Like')
    }.to change { Like.count }.by(1)
  end
end
