class SpooksController < ApplicationController
  before_action :set_spook, only: [:destroy, :show, :edit, :update, :edit_ghost_spooks, :update_ghost_spooks]
  before_action :set_ghost, only: [:new, :create]

  def my_spooks
    # As a user, I can see all the ghosts that I've rented
    @spooks = Spook.where(user_id: current_user)
  end

  def my_ghost_spooks
    @ghosts = Ghost.where(user_id: current_user)
    @ghosts.each do |ghost|
      @my_ghost_spooks = Spook.where(ghost_id: ghost.id)
    end
  end

  def edit_ghost_spooks
  end

  def update_ghost_spooks
    if @spook.update!(spook_params)
      redirect_to my_ghost_spooks_path, notice: "Your ghost's reservation was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    # As a user, I can see all the ghosts that I've rented
  end

  def new
    # As a user, I can input details about my spook (start date, end date)
    @spook = Spook.new
  end

  def create
    if @ghost.user_id == current_user.id
      flash[:alert] = "You cannot book your own ghost."
      @spook = Spook.new
      render "ghosts/show", status: 422
    else
      @spook = Spook.new(spook_params)
      @spook.ghost = @ghost
      @spook.user = current_user
      if @spook.save
        redirect_to my_spooks_path
      else
        render "/ghosts/show", status: 422
      end
    end

  end

  def edit
    # As a user, I can update/edit a spook
  end

  def update
    if @spook.update(spook_params)
      redirect_to my_spooks_path, notice: "Your reservation was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # As a user, I can cancel a spook/haunting/request
    @spook.destroy
    redirect_to my_spooks_path(@spook.ghost), status: :see_other, notice: "Your reservation was successfully cancelled."
  end

  private

  def spook_params
    params.require(:spook).permit(:start_date, :end_date, :status)
  end

  def set_ghost
    @ghost = Ghost.find(params[:ghost_id])
  end

  def set_spook
    @spook = Spook.find(params[:id])
  end
end
