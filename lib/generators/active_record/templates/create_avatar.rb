class CreateAvatar < ActiveRecord::Migration<%= "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]" %>
  def change
    create_table :avatars do |t|
      t.attachment :image

      t.timestamps
    end
  end
end
