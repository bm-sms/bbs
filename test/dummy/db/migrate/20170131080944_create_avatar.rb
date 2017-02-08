class CreateAvatar < ActiveRecord::Migration[5.0]
  def change
    create_table :avatars do |t|
      t.attachment :image

      t.timestamps
    end
  end
end
