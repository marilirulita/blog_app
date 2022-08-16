require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get '/users/1/posts' }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders index template' do
      expect(response).to render_template('index') 
    end
  end

  describe 'GET /show' do
    before(:example) {  get '/users/1/posts/1' } 

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders show template' do
      expect(response).to render_template('show') 
    end
  end
end

# If response status was correct.
# If a correct template was rendered.

#expect(response).to redirect_to(path) 
# If the response body includes correct placeholder text.