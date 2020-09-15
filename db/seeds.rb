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

s1 = Student.create(discipline_id: 1)
Profile.create(first_name: "student1", last_name: "GGM", email: "student1@GGM.edu", phone_number: 999, address: "internet", password: "123", password_confirmation: "123", userable_id: s1.id, userable_type: "Student")

s2 = Student.create(discipline_id: 2)
Profile.create(first_name: "student2", last_name: "GGM", email: "student2@GGM.edu", phone_number: 999, address: "internet", password: "123", password_confirmation: "123", userable_id: s2.id, userable_type: "Student")

a = Admin.create()
Profile.create(first_name: "admin", last_name: "GGM", email: "admin@GGM.edu", phone_number: 999, address: "internet", password: "123", password_confirmation: "123", userable_id: a.id, userable_type: "Admin")

t1 = Teacher.create(discipline_id: 1)
Profile.create(first_name: "teacher1", last_name: "GGM", email: "teacher1@GGM.edu", phone_number: 999, address: "internet", password: "123", password_confirmation: "123", userable_id: t1.id, userable_type: "Teacher")

t2 = Teacher.create(discipline_id: 2)
Profile.create(first_name: "teacher2", last_name: "GGM", email: "teacher2@GGM.edu", phone_number: 999, address: "internet", password: "123", password_confirmation: "123", userable_id: t2.id, userable_type: "Teacher")

c1 = Course.create(course_number: 517, name: "OODD", discipline_id: 1, area: "Software Development", price: 999)
c2 = Course.create(course_number: 563, name: "Micro Architecture", discipline_id: 2, area: "Computer Architecture", price: 999)
c3 = Course.create(course_number: 560, name: "Embedded Systems Architecture", discipline_id: 2, area: "Embedded Systems", price: 999)
c4 = Course.create(course_number: 566, name: "Compilers", discipline_id: 2, area: "Software Development", price: 999)

cs1 = CourseSection.create(course_id: c1.id, teacher_id: t1.id)
cs2 = CourseSection.create(course_id: c2.id, teacher_id: t2.id)

cc1 = CreditCard.create(name: "student1 GGM", card_number: 1234567812345678, expiration_date: "2024-09-13", cvv: 123, student_id: s1.id)
cc2 = CreditCard.create(name: "student1 GGM", card_number: 1234567812345678, expiration_date: "2024-09-13", cvv: 123, student_id: s1.id)

f1 = Feedback.create(student_id: s1.id, teacher_id: t1.id, course_section_id: cs1.id, description: "description")
f2 = Feedback.create(student_id: s2.id, teacher_id: t2.id, course_section_id: cs2.id, description: "description")