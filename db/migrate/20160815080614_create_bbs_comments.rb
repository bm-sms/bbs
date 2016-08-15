class CreateBbsComments < ActiveRecord::Migration[5.0]
  def change
    create_table :bbs_comments do |t|
      t.integer :topic_id, null: false
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps
    end

    add_foreign_key :bbs_comments, :bbs_topics, column: :topic_id
  end
end
