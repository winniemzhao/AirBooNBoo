class GhostsController < ApplicationController
  def index
    @ghosts = Ghost.all
  end

  def create
    @ghost = Ghost.new(ghost_params)
    @ghost.user = current_user
    # to avoid making a new migration file
    @ghost.is_active = false
    if @ghost.save!
      redirect_to ghost_path(@ghost)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @ghost = Ghost.new
  end

  def edit
  end

  def show
    @ghost = Ghost.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def ghost_params
    params.require(:ghost).permit(:name, :spook_action, :location, :daily_rate, :is_active, :user_id, :photo, :description)
  end
end
