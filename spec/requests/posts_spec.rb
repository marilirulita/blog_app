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

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('Here is a list of all posts for a given user') 
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

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('Here is all details for a certain posts for a given user') 
    end
  end
end
