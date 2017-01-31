class CreateProfile < ActiveRecord::Migration[5.0]
  def change
    create_table :user_profiles do |t|
      t.integer :user_id, null: false
      t.integer :avatar_id, null: false
      t.string :nickname

      t.timestamps
    end

    add_foreign_key :user_profiles, :users, column: :user_id
  end
end
