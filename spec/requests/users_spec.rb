require 'rails_helper'

#------------------INDEX

describe "users", type: :request do
  let!(:user) { FactoryGirl.create(:user) }
  describe 'reading users' do
    it "should render users index template" do
      get '/users'
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
    end
  end

#------------------NEW/CREATE

  describe 'GET /users/new' do
    it "should render users new template" do
      get '/users/new'
      expect(response).to have_http_status(200)
      expect(response).to render_template :new
    end
  end

  describe 'POST /users' do
    it 'should create a new user' do
      expect {
        post '/users', user: { date_time: user.date_time,
                                     activity: user.activity,
                                     location: user.location,
                                     description: user.description }
      }.to change(User, :count).by(1)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(user_url(user.last.id))
    end
  end


#-----NEW/CREATE FAILURE

  describe 'GET /users/:id save failure' do
    before do
        post '/users', user: { location: user.location,
                                     description: user.description }
    end
    it 'should not render user show template' do
      get "/users/#{User.last.id}"
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end

    it 'does not save the new user' do
      expect{
        post '/users', user: { location: user.location,
                                     description: user.description }
      }.to_not change(User,:count)
    end
    
    it 're-renders the new page' do
      post '/users', user: { location: user.location,
                                   description: user.description }
      expect(response).to render_template :new
    end
  end

#------------------SHOW

  describe 'GET /users/:id' do
    before do
      post '/users', user: { date_time: user.date_time,
                                   activity: user.activity,
                                   location: user.location,
                                   description: user.description }
    end

    it "should render user show template" do
      get "/users/#{User.last.id}"
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end
  end

#------------------EDIT/UPDATE

  describe 'GET /users/:id/edit' do
    it "should render users edit template" do
      get "/users/#{user.id}/edit"
      expect(response).to have_http_status(200)
      expect(response).to render_template :edit
    end
  end

  describe 'POST /users/:id' do
    before do
      post '/users', user: { date_time: user.date_time,
                                   activity: user.activity,
                                   location: user.location,
                                   description: user.description }
    end

    it "should update a user" do
      expect {
        patch "/users/#{user.id}", user: { date_time: user.date_time,
                                   activity: user.activity,
                                   location: user.location,
                                   description: user.description }
      }.to change(user, :count).by(0)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(user_url(user))
    end
  end

#-----EDIT/UPDATE FAILURE

  describe 'GET /users/:id/edit failure' do
    before do
      post '/users', user: { date_time: user.date_time,
                                   activity: user.activity,
                                   location: user.location,
                                   description: user.description }
    end

    it 're-renders the edit page' do
      get "/users/#{User.last.id}/edit", user: { date_time: user.date_time,
                                  activity: user.activity,
                                  location: user.location,
                                  description: user.description }
      expect(response).to render_template :edit
    end
  end

#------------------DELETE

  describe 'DELETE' do
    before do
      post '/users', user: { date_time: user.date_time,
                                   activity: user.activity,
                                   location: user.location,
                                   description: user.description }
    end

    it "should delete a user" do
      expect {
        delete "/users/#{User.last.id}"
      }.to change(User, :count).by(-1)
      expect(response).to have_http_status(302)
    end
  end

end
