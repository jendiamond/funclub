require 'rails_helper'

describe "workouts management", type: :request do
  let!(:workout) { FactoryGirl.create(:workout) }

  describe 'reading workouts' do
    it "should render workouts index template" do
      get '/workouts'
      expect(response).to have_http_status(200)
      expect(response).to render_template('index')
    end
  end

  describe 'GET /workouts/new' do
    it "creates a workout and redirects to the Workout's page" do
      get '/workouts/new'
      expect(response).to have_http_status(200)
      expect(response).to render_template('new')
    end
  end

  describe 'POST /workouts' do
    it "should create a new workout" do
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

  describe 'GET /workouts/:id' do
    before do
        post '/workouts', workout: { date_time: workout.date_time,
                                     activity: workout.activity,
                                     location: workout.location,
                                     description: workout.description }
    end

    it "should render workout show template" do
      get "/workouts/#{Workout.last.id}"
      expect(response).to have_http_status(200)
      expect(response).to render_template('show')
    end
  end

   describe 'GET /workouts/:id save failure' do

    it "should not render workout show template" do
      get "/workouts/#{Workout.last.id}"
      expect(response).to have_http_status(200)
      expect(response).to render_template('show')
    end
  end
end
