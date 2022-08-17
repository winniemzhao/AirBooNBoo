class GhostsController < ApplicationController
  before_action :set_ghost, only: %i[show edit update destroy]
  SPOOK_ACTION = %w[Scare Joke Comfort Annoy Entertain Protect]

  def index
    @ghosts = Ghost.all
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
    params.require(:ghost).permit(:name, :spook_action, :location, :daily_rate, :is_active, :user_id, :photo, :description)
  end
end
