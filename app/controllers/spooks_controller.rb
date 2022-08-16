class SpooksController < ApplicationController
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
  end

  def create
  end

  def edit
    # As a user, I can update/edit a spook
  end

  def update
  end

  def destroy
    # As a user, I can cancel a spook/haunting/request
  end
end
