class ChanageFieldFromUsers < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.remove :password
    end
  end
end
