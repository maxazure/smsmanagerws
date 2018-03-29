class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.string :phone
      t.string :fullname
      t.string :appointment_date
      t.string :appointment_when
      t.integer :template_id
      t.integer :user_id
      t.integer :company_id
      t.date :sent_time
      t.integer :flag
      t.text :error_info

      t.timestamps
    end
  end
end
