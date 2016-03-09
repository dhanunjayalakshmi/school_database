class Student < ActiveRecord::Base
  belongs_to :section
  belongs_to :house

  validates(:roll_no, presence: true)
  validates(:name, presence: true)
  validates(:address, presence: true)
  validates(:house_id, presence: true)
  validates(:section_id, presence: true)
  validates(:gender, presence: true)
  validates(:dob, presence: true)
  validates(:fathers_name, presence: true)
  validates(:emergency_contact, presence: true)
  validates(:blood_type, presence: true)


module Gender
  MALE = 1
  FEMALE = 2

  def self.label(code)
      if code == 1
        return "Male"
      else
        return "Female"
      end
    end


  def self.all
    [
      OpenStruct.new(code: MALE, label: "Male"),
      OpenStruct.new(code: FEMALE, label: "Female")
    ]
  end
end

module BloodType
  O_PLUS = 1
  O_NEG = 2
  A_PLUS = 3
  A_NEG = 4
  B_PLUS = 5
  B_NEG = 6
  AB_PLUS = 7
  AB_NEG = 8

  def self.label(code)
    return "O+" if code == 1
    return "O-" if code == 2
    return "A+" if code == 3
    return "A-" if code == 4
    return "B+" if code == 5
    return "B-" if code == 6
    return "AB+" if code == 7
    return "AB-" if code == 8
  end

  def self.all
    [
      OpenStruct.new(code: O_PLUS, label: "O+"),
      OpenStruct.new(code: O_NEG, label: "O-"),
      OpenStruct.new(code: A_PLUS, label: "A+"),
      OpenStruct.new(code: A_NEG, label: "A-"),
      OpenStruct.new(code: B_PLUS, label: "B+"),
      OpenStruct.new(code: B_NEG, label: "B-"),
      OpenStruct.new(code: AB_PLUS, label: "AB+"),
      OpenStruct.new(code: AB_NEG, label: "AB-")
    ]
  end
end
end
