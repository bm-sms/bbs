module Bbs
  class ProfilesController < Bbs::ApplicationController
    before_action :authenticate_bbs_user

    def edit
      current_bbs_user.build_profile unless current_bbs_user.profile
    end

    def create
      if current_bbs_user.create_profile(profile_params)
        redirect_to edit_profile_path, notice: t('.success')
      else
        flash.now[:alert] = current_bbs_user.profile.errors.full_messages

        render :edit
      end
    end

    def update
      if current_bbs_user.profile.update(profile_params)
        redirect_to edit_profile_path, notice: t('.success')
      else
        flash.now[:alert] = current_bbs_user.profile.errors.full_messages

        render :edit
      end
    end

    private

    def profile_params
      params.require(:user_profile).permit(Bbs.config.user_profile_class.attribute_names.without(%w(id created_at updated_at)))
    end
  end
end
