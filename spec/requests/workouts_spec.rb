require 'rails_helper'

describe 'Workouts', type: :request do
  let!(:workout) {FactoryGirl.create(:workout) }

  describe 'GET /workouts' do
    it 'returns http success' do
      get '/workouts'
      expect(response).to have_http_status(200)
      expect(response).to render_template('index')
    end
  end

  describe 'GET /workouts/new' do
    it 'should render a new workout template' do
      get '/workouts/new'
      expect(response).to have_http_status(200)
      expect(response).to render_template('new')
  end

  describe 'POST /markets'
    it 'should create a new workout' do
      expect {
        post '/workouts', workout: { date_time: workout.date_time,
                                     activity: workout.activity,
                                      location: workout.location,
                                      description: workout.description }
      }.to change(Workout, :count).by(1)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(workout_url(Workout.last.id))
    end
  end
end
