require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/1/posts'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/1/posts/show'
      expect(response).to have_http_status(:success)
    end
  end
end

# If response status was correct.
# If a correct template was rendered.

#expect(response).to redirect_to(path) 
# If the response body includes correct placeholder text.