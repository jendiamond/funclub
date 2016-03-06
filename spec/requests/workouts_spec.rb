require 'rails_helper'

describe 'workouts', type: :request do
  let!(:workout) {FactoryGirl.create(:workout) }

  describe 'GET #index' do
    it 'returns http success' do
      get '/workouts'
      expect(response).to have_http_status(200)
      expect(response).to render_template('index')
    end
  end
end
