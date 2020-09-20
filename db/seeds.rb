# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

d1 = Discipline.create(name: "CSC")
d2 = Discipline.create(name: "CE")
d3 = Discipline.create(name: "EE")
d4 = Discipline.create(name: "MAE")
d5 = Discipline.create(name: "ECO")
d6 = Discipline.create(name: "PHY")
d7 = Discipline.create(name: "MAT")

s1 = Student.create(discipline_id: 1)
Profile.create(first_name: "student1", last_name: "GGM", email: "student1@GGM.edu", phone_number: 9999999999, address: "internet", password: "123", password_confirmation: "123", userable_id: s1.id, userable_type: "Student")
Cart.create(student_id: s1.id)

s2 = Student.create(discipline_id: 2)
Profile.create(first_name: "student2", last_name: "GGM", email: "student2@GGM.edu", phone_number: 9999999999, address: "internet", password: "123", password_confirmation: "123", userable_id: s2.id, userable_type: "Student")
Cart.create(student_id: s2.id)

s3 = Student.create(discipline_id: 1)
Profile.create(first_name: "student3", last_name: "GGM", email: "student3@GGM.edu", phone_number: 9999999999, address: "internet", password: "123", password_confirmation: "123", userable_id: s3.id, userable_type: "Student")
Cart.create(student_id: s3.id)

s4 = Student.create(discipline_id: 2)
Profile.create(first_name: "student4", last_name: "GGM", email: "student4@GGM.edu", phone_number: 9999999999, address: "internet", password: "123", password_confirmation: "123", userable_id: s4.id, userable_type: "Student")
Cart.create(student_id: s4.id)

s5 = Student.create(discipline_id: 4)
Profile.create(first_name: "student5", last_name: "GGM", email: "student5@GGM.edu", phone_number: 9999999999, address: "internet", password: "123", password_confirmation: "123", userable_id: s5.id, userable_type: "Student")
Cart.create(student_id: s5.id)

a = Admin.create()
Profile.create(first_name: "admin", last_name: "GGM", email: "admin@GGM.edu", phone_number: 9999999999, address: "internet", password: "123", password_confirmation: "123", userable_id: a.id, userable_type: "Admin")

t1 = Teacher.create(discipline_id: 1)
Profile.create(first_name: "teacher1", last_name: "GGM", email: "teacher1@GGM.edu", phone_number: 9999999999, address: "internet", password: "123", password_confirmation: "123", userable_id: t1.id, userable_type: "Teacher")

t2 = Teacher.create(discipline_id: 2)
Profile.create(first_name: "teacher2", last_name: "GGM", email: "teacher2@GGM.edu", phone_number: 9999999999, address: "internet", password: "123", password_confirmation: "123", userable_id: t2.id, userable_type: "Teacher")

t3 = Teacher.create(discipline_id: 2)
Profile.create(first_name: "teacher3", last_name: "GGM", email: "teacher3@GGM.edu", phone_number: 9999999999, address: "internet", password: "123", password_confirmation: "123", userable_id: t3.id, userable_type: "Teacher")

t4 = Teacher.create(discipline_id: 1)
Profile.create(first_name: "teacher4", last_name: "GGM", email: "teacher4@GGM.edu", phone_number: 9999999999, address: "internet", password: "123", password_confirmation: "123", userable_id: t4.id, userable_type: "Teacher")

t5 = Teacher.create(discipline_id: 3)
Profile.create(first_name: "teacher5", last_name: "GGM", email: "teacher5@GGM.edu", phone_number: 9999999999, address: "internet", password: "123", password_confirmation: "123", userable_id: t5.id, userable_type: "Teacher")

c1 = Course.create(course_number: 517, name: "Object Oriented Design Development", discipline_id: 1, area: "Software Development", price: 999)
c2 = Course.create(course_number: 563, name: "Micro Architecture", discipline_id: 2, area: "Computer Architecture", price: 999)
c3 = Course.create(course_number: 560, name: "Embedded Systems Architecture", discipline_id: 2, area: "Embedded Systems", price: 999)
c4 = Course.create(course_number: 566, name: "Compilers", discipline_id: 2, area: "Software Development", price: 999)
c5 = Course.create(course_number: 550, name: "Fluid Mechanics", discipline_id: 4, area: "Fluids", price: 999)
c6 = Course.create(course_number: 505, name: "Algorithms", discipline_id: 1, area: "Data Structures and Algorithms", price: 999)
c7 = Course.create(course_number: 506, name: "Parallel Architecture", discipline_id: 2, area: "Computer Architecture", price: 999)
c8 = Course.create(course_number: 561, name: "Embedded Systems Optimization", discipline_id: 2, area: "Embedded Systems", price: 999)

cs1 = CourseSection.create(course_id: c1.id, teacher_id: t1.id)
cs2 = CourseSection.create(course_id: c2.id, teacher_id: t2.id)

cc1 = CreditCard.create(name: "student1 GGM", card_number: 1234567812345678, expiration_date: "2024-09-13", cvv: 123, student_id: s1.id)
cc2 = CreditCard.create(name: "student2 GGM", card_number: 1234567812345678, expiration_date: "2024-09-13", cvv: 123, student_id: s2.id)

f1 = Feedback.create(student_id: s1.id, teacher_id: t1.id, course_section_id: cs1.id, description: "description")
f2 = Feedback.create(student_id: s2.id, teacher_id: t2.id, course_section_id: cs2.id, description: "description")

CartObject.create(course_section_id: cs1.id, cart_id: cc1.id)

