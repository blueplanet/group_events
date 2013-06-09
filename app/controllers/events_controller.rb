class EventsController < ApplicationController
  before_action :set_group_event, only: [:show, :join]

  def join
    @event.event_users.create user: current_user, join_type: params[:join_type]

    redirect_to group_event_path(@group, @event)
  end

  private
  def set_group_event
    @group = Group.find(params[:group_id])
    @event = Event.find(params[:id])
  end
end
