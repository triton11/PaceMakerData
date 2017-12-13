class CreatePacemakers < ActiveRecord::Migration
  def change
    create_table :pacemakers do |t|

      t.timestamps null: false
    end
  end
end
