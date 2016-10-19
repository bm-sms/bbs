module Bbs
  class ProfilesController < Bbs::ApplicationController
    before_action :authenticate_user!

    def edit
      current_user.build_profile unless current_user.profile
    end

    def create
      if current_user.create_profile(profile_params)
        redirect_to action: :edit
      else
        render :edit
      end
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
