require 'rails_helper'

RSpec.describe Course, type: :model do
  describe "Validations" do
    it "is valid with valid attributes" do
      d1 = Discipline.create(name:"Computer Science")
      c1 = Course.create(course_number: 510, name: "Software Engineering", discipline_id: d1.id, area:
          "Software Development", price: 555)
      expect(c1).to be_valid
    end
    it "is not valid without a course_number" do
      c1 = Course.create(name: "Java II", discipline_id: 1, area: "Software Development", price: 555)
      expect(c1).to_not be_valid
    end
    it "cannot match another Course's discipline AND course_number" do
      c1 = Course.create(course_number: 216, name: "Java II", discipline_id: 1, area:
          "Software Development", price: 555)
      c2 = Course.create(course_number: 216, name: "Java II", discipline_id: 1, area:
          "Software Development", price: 555)
      expect(c2).to_not be_valid
    end
    it "cannot have a non-integer course_number" do
      c1 = Course.create(course_number: 216.25, name: "Java II", discipline_id: 1, area:
          "Software Development", price: 555)
      expect(c1).to_not be_valid
    end
    it "is not valid without a name" do
      c1 = Course.create(course_number: 216, discipline_id: 1, area: "Software Development", price: 555)
      expect(c1).to_not be_valid
    end
    it "is not valid without an area" do
      c1 = Course.create(course_number: 216, name: "Java II", discipline_id: 1, price: 555)
      expect(c1).to_not be_valid
    end
    it "is not valid without a price" do
      c1 = Course.create(course_number: 216, name: "Java II", discipline_id: 1, area: "Software Development")
      expect(c1).to_not be_valid
    end
    it "must have a price greater than or equal to 0" do
      c1 = Course.create(course_number: 216, name: "Java II", discipline_id: 1, area:
          "Software Development", price: -555)
      expect(c1).to_not be_valid
    end
  end
  describe "Functions" do
    it "is_deleted updates to true when running delete_course" do
      d1 = Discipline.create(name:"CSC")
      c1 = Course.create(course_number: 216, name: "Java II", discipline_id: d1.id, area:
          "Software Development", price: 555)
      c1.delete_course
      expect(c1.is_deleted).to eq(true)
    end
  end
end
