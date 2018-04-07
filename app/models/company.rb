class Company < ApplicationRecord
  has_many :appointments
  has_many :templates
  has_many :users
end
