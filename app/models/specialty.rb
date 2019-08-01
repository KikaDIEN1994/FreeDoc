class Specialty < ApplicationRecord
	has_many :doctor_fields
	has_many :doctors, through: :doctor_fields
end