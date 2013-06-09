class EventsController < ApplicationController
  before_action :set_group_event, only: [:show, :join, :absente]

  def join
    @event.participants << current_user

    redirect_to group_event_path(@group, @event)
  end

  def absente
    @event.absentees << current_user

    redirect_to group_event_path(@group, @event)
  end

  private
  def set_group_event
    @group = Group.find(params[:group_id])
    @event = Event.find(params[:id])
  end
end
