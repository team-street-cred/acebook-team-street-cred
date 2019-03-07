RSpec.feature "Like a post", type: :feature do

  scenario "user cannot like a post twice" do
    sign_up
    page.find('#posts li:first-child').click_button('Like')
    expect { page.find('#posts li:first-child').click_button('Unlike') }
            .to change { Like.count }.by(-1)
  end
end
