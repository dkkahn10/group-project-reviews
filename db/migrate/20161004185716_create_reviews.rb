class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :intimacy_rating, null: false
      t.string :reasoning
      t.belongs_to :location
    end
  end
end
