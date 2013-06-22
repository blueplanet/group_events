class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :join]
  
  def index
    @groups = Group.order("updated_at DESC").limit(5)
  end

  def join
    @group.members << current_user if current_user

    redirect_to group_path(@group)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(post_params)
    if @group.save
      redirect_to @group
    else
      render :new
    end
  end

  private
  def set_group
    @group = Group.find(params[:id])
  end

  def post_params
    params.require(:group).permit(:name, :description)
  end
end
