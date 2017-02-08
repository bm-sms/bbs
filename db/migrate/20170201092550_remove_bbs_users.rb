class RemoveBbsUsers < ActiveRecord::Migration[5.0]
  def change
    drop_table :bbs_users
  end
end
