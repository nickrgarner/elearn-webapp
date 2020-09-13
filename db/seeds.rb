# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Discipline.create(name: "CSC")
Discipline.create(name: "CE")
Discipline.create(name: "EE")
Discipline.create(name: "MAE")

s = Student.create(discipline_id: 1)
Profile.create(first_name: "student", last_name: "GGM", email: "student@GGM.edu", phone_number: 999, address: "internet", password: "123", password_confirmation: "123", userable_id: s.id, userable_type: "Student")

a = Admin.create()
Profile.create(first_name: "admin", last_name: "GGM", email: "admin@GGM.edu", phone_number: 9929, address: "internet", password: "123", password_confirmation: "123", userable_id: a.id, userable_type: "Admin")

t = Teacher.create(discipline_id: 1)
Profile.create(first_name: "teacher", last_name: "GGM", email: "teacher@GGM.edu", phone_number: 9929, address: "internet", password: "123", password_confirmation: "123", userable_id: t.id, userable_type: "Teacher")

Courses.create(course_number: 517, name: OODD, discipline_id: 1, area: "Software Development", price: 999)

CourseSection.create()