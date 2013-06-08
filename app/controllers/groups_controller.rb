class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :join]
  def index
    @groups = Group.all
  end

  def join
    redirect_to group_path(@group) unless current_user
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end
end
