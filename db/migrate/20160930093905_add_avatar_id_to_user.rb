class AddAvatarIdToUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :bbs_user_profiles, :avatar_url, :string

    add_column :bbs_user_profiles, :avatar_id, :integer
  end
end
