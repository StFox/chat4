class CreateJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :rooms do |t|
    end
  end
end
