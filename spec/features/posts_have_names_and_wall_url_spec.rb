RSpec.feature 'Posts have name and wall url' do
  scenario 'can click on the name of user who created post and be redirected to wall ' do
    log_in
    expect(page).to have_link("new post")
    find("ul li:nth-child(1)").click_link("Jane")
    expect(page).to have_selector('h1', text: "Jane's wall")
  end
end
