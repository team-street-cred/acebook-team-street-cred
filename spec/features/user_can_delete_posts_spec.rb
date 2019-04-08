feature 'Users can delete posts', type: :feature do

  scenario 'Users can delete posts' do
    log_in_and_go_to_posts
    expect { click_link('Delete', match: :first) }.to change(Post, :count).by(-1)
    expect(page).to have_content 'Post was successfully destroyed.'
  end

  scenario 'Users can only delete their own posts' do
    sign_up
    visit "/posts"
    expect(page).to have_content('acebook')
    expect { click_link('Delete', match: :first) }.to_not change(Post, :count)
    expect(page).to have_content('You do not have permission to delete this post.')
  end
end
