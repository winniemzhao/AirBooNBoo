class GhostsController < ApplicationController
  before_action :set_ghost, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @ghosts = Ghost.all
    @markers = @ghosts.map do |ghost|
      {
        lat: ghost.latitude,
        lng: ghost.longitude,
        info_window: render_to_string(partial: "info_window_index", locals: {ghost: ghost}),
        image_url: helpers.asset_url("boo-invert.png")
      }
    end
  end

  def create
    @ghost = Ghost.new(ghost_params)
    @ghost.user = current_user
    if @ghost.save
      redirect_to ghost_path(@ghost)
    else
      # raise
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @ghost = Ghost.new
  end

  def edit
  end

  def show
    @spook = Spook.new

    if @ghost.latitude && @ghost.longitude
      @markers = [{
        lat: @ghost.latitude,
        lng: @ghost.longitude,
        info_window: render_to_string(partial: "info_window", locals: {ghost: @ghost}),
        image_url: helpers.asset_url("boo-invert.png")
      }]
    end
  end

  def update
    @ghost.update(ghost_params)
    redirect_to ghost_path(@ghost)
  end

  def destroy
    @ghost.destroy
    redirect_to my_ghosts_path, status: :see_other
  end

  def my_ghosts
    @user_id = current_user.id
    @my_ghosts = Ghost.where(user_id: @user_id)
  end

  private

  def set_ghost
    @ghost = Ghost.find(params[:id])
  end

  def ghost_params
    params.require(:ghost).permit(:name, :spook_action, :address, :daily_rate, :is_active, :user_id, :photo, :description)
  end
end
