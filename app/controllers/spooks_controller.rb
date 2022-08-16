class SpooksController < ApplicationController
  before_action :set_spook, only: :destroy
  before_action :set_ghost, only: [:new, :create]

  def my_spooks
    # As a user, I can see all the ghosts that I've rented
    @spooks = Spook.all
  end

  def show
    # As a user, I can see all the ghosts that I've rented
    @spook = Spook.find(params[:id])
  end

  def new
    # As a user, I can input details about my spook (start date, end date)
    @spook = Spook.new
  end

  def create
    @spook = Spook.new(spook_params)
    @spook.ghost = @ghost
    @spook.user = current_user
    if @spook.save
      redirect_to my_spook_path(@spook)
    else
      render :new, status: 422
    end
  end

  def edit
    # As a user, I can update/edit a spook
  end

  def update
  end

  def destroy
    # As a user, I can cancel a spook/haunting/request
  end

  private

  def spook_params
    params.require(:spook).permit(:start_date, :end_date)
  end

  def set_ghost
    @ghost = Ghost.find(params[:ghost_id])
  end
end
