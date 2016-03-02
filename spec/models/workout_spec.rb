require 'spec_helper'

describe Workout do
  let(:workout) { FactoryGirl.create(:workout) }
  it "should have an date" do
    expect(workout).to respond_to(:date)
  end
  it "should have an time" do
    expect(workout).to have_attribute(:time)
  end
  it "should have an activity" do
    expect(workout).to have_attribute(:activity)
  end
  it "should have an location" do
    expect(workout).to have_attribute(:location)
  end
  it "should have an description" do
    expect(workout).to have_attribute(:description)
  end
end
