module Bbs
  class ProfilesController < ApplicationController
    def edit
      current_user.build_profile unless current_user.profile
    end

    def update
      if current_user.profile.update(profile_params)
        redirect_to action: :edit
      else
        render :edit
      end
    end

    private

    def profile_params
      params.require(:user_profile).permit(Bbs::UserProfile.permitted_attributes)
    end
  end
end
