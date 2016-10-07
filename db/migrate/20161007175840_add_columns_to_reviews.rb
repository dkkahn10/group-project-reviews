class AddColumnsToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :upvote_count, :integer, null: false, default: 0
    add_column :reviews, :downvote_count, :integer, null: false, default: 0
  end
end
