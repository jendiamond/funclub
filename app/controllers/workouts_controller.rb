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

  private

  def workout_params
    params.require(:workout).permit(:date_time, :activity, :location, :description)
  end

  def actionname
    @types = Workout.select(:activity).distinct
  end

end
