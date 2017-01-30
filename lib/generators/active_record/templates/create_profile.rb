class CreateProfile < ActiveRecord::Migration<%= "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]" %>
  def change
    create_table :user_profiles do |t|
      t.integer :<%= user_model_name %>_id, null: false
      t.integer :avatar_id, null: false
      t.string :nickname

      t.timestamps
    end

    add_foreign_key :user_profiles, :<%= user_model_name.pluralize %>, column: :<%= user_model_name %>_id
  end
end
