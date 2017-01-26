class ChangeAvatar < ActiveRecord::Migration<%= ["#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}"] %>
  def self.up
    change_table :avatars do |t|
      t.attachment :avatar
    end
  end
end
