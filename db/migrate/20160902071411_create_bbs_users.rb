class CreateBbsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :bbs_users do |t|

      t.timestamps
    end
  end
end
