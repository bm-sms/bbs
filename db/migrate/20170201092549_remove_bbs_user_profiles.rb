class RemoveBbsUserProfiles < ActiveRecord::Migration[5.0]
  def change
    drop_table :bbs_user_profiles
  end
end
