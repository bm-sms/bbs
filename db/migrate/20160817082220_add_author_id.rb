class AddAuthorId < ActiveRecord::Migration[5.0]
  def change
    add_column :bbs_topics, :author_id, :integer
    add_column :bbs_comments, :author_id, :integer
  end
end
