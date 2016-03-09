require 'rails_helper'

#------------------INDEX

describe "workouts", type: :request do
  let!(:workout) { FactoryGirl.create(:workout) }
  describe 'reading workouts' do
    it "should render workouts index template" do
      get '/workouts'
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
    end
  end

#------------------NEW/CREATE

  describe 'GET /workouts/new' do
    it "should render workouts new template" do
      get '/workouts/new'
      expect(response).to have_http_status(200)
      expect(response).to render_template :new
    end
  end

  describe 'POST /workouts' do
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


#-----NEW/CREATE FAILURE

  describe 'GET /workouts/:id save failure' do
    before do
        post '/workouts', workout: { location: workout.location,
                                     description: workout.description }
    end
    it 'should not render workout show template' do
      get "/workouts/#{Workout.last.id}"
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end

    it 'does not save the new workout' do
      expect{
        post '/workouts', workout: { location: workout.location,
                                     description: workout.description }
      }.to_not change(Workout,:count)
    end
    
    it 're-renders the new page' do
      post '/workouts', workout: { location: workout.location,
                                   description: workout.description }
      expect(response).to render_template :new
    end
  end

#------------------SHOW

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
      expect(response).to render_template :show
    end
  end

#------------------EDIT/UPDATE

  describe 'GET /workouts/:id/edit' do
    it "should render workouts edit template" do
      get "/workouts/#{workout.id}/edit"
      expect(response).to have_http_status(200)
      expect(response).to render_template :edit
    end
  end

  describe 'POST /workouts/:id' do
    before do
      post '/workouts', workout: { date_time: workout.date_time,
                                   activity: workout.activity,
                                   location: workout.location,
                                   description: workout.description }
    end

    it "should update a workout" do
      expect {
        patch "/workouts/#{workout.id}", workout: { date_time: workout.date_time,
                                   activity: workout.activity,
                                   location: workout.location,
                                   description: workout.description }
      }.to change(Workout, :count).by(0)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(workout_url(workout))
    end
  end

#-----EDIT/UPDATE FAILURE

  describe 'GET /workouts/:id/edit failure' do
    before do
      post '/workouts', workout: { date_time: workout.date_time,
                                   activity: workout.activity,
                                   location: workout.location,
                                   description: workout.description }
    end

    it 're-renders the edit page' do
      get "/workouts/#{Workout.last.id}/edit", workout: { date_time: workout.date_time,
                                  activity: workout.activity,
                                  location: workout.location,
                                  description: workout.description }
      expect(response).to render_template :edit
    end
  end

#------------------DELETE

  describe 'DELETE' do
    before do
      post '/workouts', workout: { date_time: workout.date_time,
                                   activity: workout.activity,
                                   location: workout.location,
                                   description: workout.description }
    end

    it "should delete a workout" do
      expect {
        delete "/workouts/#{Workout.last.id}"
      }.to change(workout, :count).by(-1)
      expect(response).to have_http_status(302)
    end
  end

end
