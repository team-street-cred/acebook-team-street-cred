require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "works! (now write some real specs)" do
      get posts_path
      expect(response).to have_http_status(200)
    end
  end

  it 'accepts HTTP requests to DELETE /posts/id' do
    delete "/posts/1"
    expect(response).to have_http_status(200)
  end
end
