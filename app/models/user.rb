class User < ApplicationRecord
  include Clearance::User

  has_many :appointments
  has_many :templates
end
