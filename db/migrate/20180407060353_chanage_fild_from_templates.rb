class ChanageFildFromTemplates < ActiveRecord::Migration[5.1]
  def change
    change_table :templates do |t|
      t.integer :user_id
    end
  end
end
