class CreateTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :templates do |t|
      t.text :body
      t.integer :company_id

      t.timestamps
    end
  end
end
