class WorkoutsController < ApplicationController

  def index
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      redirect_to @workout
    else
      render 'new'
    end
  end

  def show
    @workout = Workout.find(params[:id])
  end

  private

  def workout_params
    params.require(:workout).permit(:date_time, :activity, :location, :description)
  end

end
