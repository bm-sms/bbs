class ChangeProfile < ActiveRecord::Migration<%= "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]" %>
  def self.up
    change_table :user_profiles do |t|
      t.integer :<%= user_model_name %>_id, null: false
      t.string :avatar_url
      t.string :nickname
    end

    add_foreign_key :user_profiles, :<%= user_model_name.pluralize %>, column: :<%= user_model_name %>_id
  end

  def self.down
  end
end
