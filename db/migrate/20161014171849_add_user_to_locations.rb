class AddUserToLocations < ActiveRecord::Migration[5.0]
  def change
    add_reference :locations, :user, foreign_key: true
  end
end
