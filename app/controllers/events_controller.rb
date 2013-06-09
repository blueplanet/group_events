class EventsController < ApplicationController
  before_action :set_group, only: [:show, :join, :new, :create]
  before_action :set_event, only: [:show, :join]

  def join
    @event.event_users.create user: current_user, join_type: params[:join_type]

    redirect_to group_event_path(@group, @event)
  end

  def new
    @group = Group.find(params[:group_id])
  end

  def create
    event = @group.events.create(post_params)

    redirect_to [@group, event]
  end

  private
  def set_event
    @event = Event.find(params[:id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def post_params
    params.require(:event).permit(:date, :time, :description)
  end
end
