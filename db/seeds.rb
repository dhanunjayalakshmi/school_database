# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'rubygems'
require 'faker'
require 'byebug'

def seed_standards(name)
  Standard.find_or_create_by(name: name)
  print "."
end

puts "#Seeding Standards"
["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"].each do |standard|
  seed_standards(standard)
end
puts "Done."

def seed_sections(standard, name)
  standard.sections.find_or_create_by(name: name)
  print "."
end

puts "#Seeding Sections"
Standard.all.each do |standard|
  sections = %w[A B C]
  (0..(1+rand(2))).each do |section|
    name = sections[section]
    seed_sections(standard, name)
  end
end
puts "Done."

def seed_houses(name)
  House.find_or_create_by(name: name)
  print "."
end

puts "#Seeding Houses"
%w[Yellow Green Red Blue].each do |house|
  seed_houses(house)
end
puts "Done."

def seed_students(section, house, roll_no)
  last_name = Faker::Name.last_name
  age = section.standard.name.to_i + 5
  section.students.find_or_create_by(roll_no: roll_no) do |student|
    student.name = "#{Faker::Name.first_name} #{last_name}"
    student.fathers_name = "#{Faker::Name.first_name} #{last_name}"
    student.gender = Student::Gender.all.sample.code
    student.dob = Faker::Date.between((age + 1).years.ago, (age - 1).years.ago)
    student.emergency_contact = Faker::PhoneNumber.cell_phone
    student.blood_type = Student::BloodType.all.sample.code
    student.address = "#{Faker::Address.street_address}, #{Faker::Address.city}-#{Faker::Address.zip}"
    student.house = house
  end
  print "."
end

puts "#Seeding Students"
  Section.all.each do |section|
    all_houses = House.all
    (1..(20+rand(6))).each do |num|
      house = all_houses.sample
      seed_students(section, house, num)
    end
  end
puts "Done."
