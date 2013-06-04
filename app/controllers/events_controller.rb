class EventsController < ApplicationController
  def show
    @group = Group.find(params[:group_id])
    @event = Event.find(params[:id])
  end
end
