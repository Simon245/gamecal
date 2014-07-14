class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|

      t.integer  :game_id
      t.string   :owner
      t.datetime :date
      t.datetime :time_start
      t.datetime :time_finish
      t.integer  :friend_id
      t.string   :email_address
      t.text     :description

      t.timestamps
    end
  end
end
