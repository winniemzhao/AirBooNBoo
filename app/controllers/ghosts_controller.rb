class GhostsController < ApplicationController
  def index
    @ghosts = Ghost.all
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
    @ghost = Ghost.find(params[:ghost_id])
  end

  def update
  end

  def destroy
  end
end
