require 'faker'

City.destroy_all
Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
Specialty.destroy_all
DoctorField.destroy_all

specialties_name = ["dentist", "ophthalmologist", "lung specialist", "cardiologist", "podiatrist", "general practitioner", "dermatologist", "diabetologist", "gynecologist", "rheumatologist"]
cities_name = ["Oran", "Tokyo", "NYC", "Londres", "Paris", "Bangkok", "Marseille", "Alger", "Rio", "Madrid"]
cities = []
specialties = []

10.times do |i|
	cities << City.new(name: cities_name[i])
	cities[i].save
end

10.times do |i|
	specialties << Specialty.new(name: specialties_name[i])
	specialties[i].save
end

5.times do |i|
	Doctor.create first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, zip_code: Faker::Code.nric, city: cities[i+1]
end

10.times do |i|
	Patient.create first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: cities[i]
end

first_doc = Doctor.all.first.id
first_p = Patient.all.first.id

5.times do |i|
	Appointment.new(date: DateTime.new(2019, 8, 10+i, 11, 10+(5*i)), doctor: Doctor.find(first_doc+i), patient: Patient.find(first_p+(2*i)), city: cities[i+1]).save
end

first_s = Specialty.all.first.id

5.times do |i|
	DoctorField.create doctor: Doctor.find(first_doc+i), specialty: Specialty.find(first_s+i)
end