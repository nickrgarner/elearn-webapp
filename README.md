# ELearning and Mentoring System - A Rails App

## [Final Submission Deployment v1.0](https://hidden-meadow-75629.herokuapp.com/)

## Test Login Information
### Admin
**Username:** admin@GGM.edu, **Password:** 123<br>

### Teachers - Discipline varies
* **Username:** teacher1@GGM.edu, **Password:** 123<br>
* **Username:** teacher2@GGM.edu, **Password:** 123<br>
* **Username:** teacher3@GGM.edu, **Password:** 123<br>
* **Username:** teacher4@GGM.edu, **Password:** 123<br>
* **Username:** teacher5@GGM.edu, **Password:** 123<br>

### Students - Discipline varies
* **Username:** student1@GGM.edu, **Password:** 123<br>
* **Username:** student2@GGM.edu, **Password:** 123<br>
* **Username:** student3@GGM.edu, **Password:** 123<br>
* **Username:** student4@GGM.edu, **Password:** 123<br>
* **Username:** student5@GGM.edu, **Password:** 123<br>

## Requirements
* [**Ruby v2.6.6**](https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.6.tar.gz)<br>
* [**Ruby on Rails v6.0.3.3**](https://guides.rubyonrails.org/v5.0/getting_started.html#installing-rails)<br>
* [**Yarn v1.22.5**](https://classic.yarnpkg.com/en/docs/cli/version/)<br>
* [**Bundler v2.1.4**](https://bundler.io/)

## Feature Map
Feature|Path
-------|----
**Admin role**|Admin login
**Student role**|Student login
**Teacher role**|Teacher login
**Edit Profile**|User login -> Edit Profile
**Manage Students & Carts**|Admin login -> Students
**Manage Teachers**|Admin login -> Teachers
**Disciplines**|Admin login -> Disciplines
**Courses**|Admin login -> Courses
**Course Sections**|Admin login -> Courses -> View Course Sections
**Teacher Registration**|Teacher login -> Courses -> Create Course Section
**Shopping Cart**|Student login -> Courses -> View Course Sections -> Add/Remove to/from Cart
**Credit Card**|Student login -> Edit Profile -> Add/Edit/Delete/Show Credit Card
**Checkout**|Student login -> View Cart -> Checkout
**Purchase History**|Student login -> View Purchase History
**Create Feedbacks**|Student login -> View Purchase History -> Create/Edit Feedback
**View Feedbacks**|Student/Teacher login -> View Feedbacks
**View mentored Students**|Teacher login -> Students
**View Teachers in Student's Discipline**|Student login -> Teachers
**EC: User cannot access another account**|Student/Teacher login -> Change URL id param -> Redirected to Home
**EC: One-Time Password**|Student login -> Courses -> View Course Sections -> Add to Cart -> Home -> View Cart -> Checkout
**EC: Registration Welcome Email**|Login Page -> Sign Up -> Submit form OR Admin login -> Students/Teachers -> New Student/Teacher

## Edge Cases
Case|Handling
----|--------
**Admin deletes course with registered students and/or teachers**|Course is internally marked as `isDeleted` and no longer appears in Course views, but purchases of that course remain in students' histories and feedbacks of that course remain accessible.
**Admin deletes teacher registered for a course**|The course section will be removed and handled like the above.
**Admin deletes a user**|The user is removed from the db but their email address is preserved. Their purchases, feedbacks, etc. are also preserved.
**Admin deletes course currently in a student's cart**|Student receives an error when attempting to checkout, and the invalid course is removed from their cart.
**Courses cannot be dropped after Checkout**|This functionality was not listed in the project specs.
