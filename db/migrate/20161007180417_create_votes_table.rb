class CreateVotesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.belongs_to :users, null: false
      t.belongs_to :reviews, null: false
      t.boolean :vote_value
    end
  end
end
