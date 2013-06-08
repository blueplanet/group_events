class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :join]
  
  def index
    @groups = Group.all
  end

  def join
    @group.members << current_user if current_user

    redirect_to group_path(@group)
  end

  private
  def set_group
    @group = Group.find(params[:id])
  end
end
