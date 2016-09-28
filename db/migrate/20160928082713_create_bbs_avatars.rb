class CreateBbsAvatars < ActiveRecord::Migration[5.0]
  def change
    create_table :bbs_avatars do |t|
      t.attachment :avatar

      t.timestamps
    end
  end
end
