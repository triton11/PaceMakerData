class CreateDatapoints < ActiveRecord::Migration
  def change
    create_table :datapoints do |t|
      t.belongs_to :pacemaker, index: true
      t.integer :beat
      t.string :sign
      t.datetime :recieved_at
      t.timestamps null: false
    end
  end
end
