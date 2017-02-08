class RemoveBbsAvatars < ActiveRecord::Migration[5.0]
  def change
    drop_table :bbs_avatars
  end
end
