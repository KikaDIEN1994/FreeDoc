class Doctor < ApplicationRecord
	has_many :appointments
	has_many :patients, through: :appointments
	belongs_to :city
	has_many :doctor_fields
	has_many :specialties, through: :doctor_fields
end