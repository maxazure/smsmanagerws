class Appointment < ApplicationRecord
  belongs_to :template
  belongs_to :company
  belongs_to :user
end
