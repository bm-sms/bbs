class CreateBbsUserProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :bbs_user_profiles do |t|
      t.integer :user_id, null: false
      t.string :avatar_url
      t.string :nickname

      t.timestamps
    end

    add_foreign_key :bbs_user_profiles, :bbs_users, column: :user_id
  end
end
