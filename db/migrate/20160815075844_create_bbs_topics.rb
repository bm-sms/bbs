class CreateBbsTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :bbs_topics do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.integer :category_id, null: false

      t.timestamps
    end

    add_foreign_key :bbs_topics, :bbs_categories, column: :category_id
  end
end
