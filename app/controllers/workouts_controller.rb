class WorkoutsController < ApplicationController
  before_action :find_workout, only: [:show, :edit, :update, :destroy]

  def index
    @workouts = Workout.all.order('created_at ASC')

    if params[:search].present?
      @workouts = Workout.near(params[:search], 1000, :order => :address)
    else
      @workouts = Workout.all
    end
    @hash = Gmaps4rails.build_markers(@workouts) do |workout, marker|
      marker.lat workout.latitude
      marker.lng workout.longitude
      marker.infowindow workout.activity
      marker.picture({
        "width" => 32,
        "height" => 32})
      marker.json({ activity: workout.activity})
    end

  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      redirect_to @workout
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @workout.update(workout_params)
      flash[:notice] = "Workout edited."
      redirect_to @workout
    else
      render :edit
      flash[:notice] = "Workout was not edited."
    end
  end

  def destroy
    @workout.destroy
    flash[:notice] = "Workout deleted."
    redirect_to workouts_path
  end

  private

  def find_workout
    @workout = Workout.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:date_time, :activity, :location, :description, :address)
  end

end
