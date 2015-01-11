class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def show
    @profile = current_user.profile
  end

  def edit
    @profile = current_user.profile
  end

  def update
    current_user.profile = Profile.new(profile_params)
    if current_user.profile.save
      @profile = current_user.profile
      render action: 'show', notice: 'Profile update success.'
    else
      render action: 'edit'
    end
  end

  def create
    current_user.profile = Profile.new(profile_params)
    if current_user.profile.save
      @profile = current_user.profile
      render action: 'show', notice: 'Profile register success.'
    else
      render action: 'new'
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:introduction, :avatar)
  end
end
