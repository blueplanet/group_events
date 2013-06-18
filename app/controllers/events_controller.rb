class EventsController < ApplicationController
  before_action :set_group, only: [:show, :join, :new, :edit, :create, :update, :create_kpt]
  before_action :set_event, only: [:show, :join, :edit, :update, :create_kpt]

  def join
    @event.event_users.create user: current_user, 
                              join_type: params[:join_type]

    redirect_to group_event_path(@group, @event)
  end

  def new
    @event = @group.events.build
  end

  def show
    @kpt = @event.kpts.build
  end

  def create_kpt
    @kpt = @event.kpts.build(post_kpt_params)
    if @kpt.save
      redirect_to [@group, @event]
    else
      render :show
    end
  end

  def create
    @event = @group.events.build(post_params)
    if @event.save
      redirect_to [@group, @event]
    else
      render :new
    end
  end

  def update
    if @event.update(post_params)
      redirect_to [@group, @event]
    else
      render :edit
    end
  end

  private
  def set_event
    @event = Event.find(params[:id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def post_params
    params.require(:event).permit(:title, :date, :time, :content)
  end

  def post_kpt_params
    params.require(:kpt).permit(:kpt_type, :content)
  end
end
