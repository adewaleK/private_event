class EventsController < ApplicationController
  include SessionsHelper

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(events_params)
    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def index
    @events = Event.all
    @past_events = Event.past
    @upcoming = Event.upcoming
  end

  def show
    @event = Event.find(params[:id])
    @creator = @event.creator
  end

  private

  def events_params
    params.require(:event).permit(:title, :description, :location, :date)
  end
end
