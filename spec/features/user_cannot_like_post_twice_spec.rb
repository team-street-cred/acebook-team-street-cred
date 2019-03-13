RSpec.feature "Like a post", type: :feature do

  xscenario "user cannot like a post twice" do
    sign_up
    visit "/posts"
    page.find('#posts li:first-child').click_button('Like')
    expect { page.find('#posts li:first-child').click_button('Unlike') }
            .to change { Like.count }.by(-1)
  end
end
