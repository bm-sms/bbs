class RenameAvatarColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :bbs_avatars, :avatar_file_name, :image_file_name
    rename_column :bbs_avatars, :avatar_content_type, :image_content_type
    rename_column :bbs_avatars, :avatar_file_size, :image_file_size
    rename_column :bbs_avatars, :avatar_updated_at, :image_updated_at
  end
end
