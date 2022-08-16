require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get '/users' }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders index template' do
      expect(response).to render_template('index')
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('Here is a list of users')
    end
  end

  describe 'GET /show' do
    before(:example) { get '/users/1' }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders show template' do
      expect(response).to render_template('show')
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('Here is all details for given user')
    end
  end
end
