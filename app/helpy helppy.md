MODELS

class User < ActiveRecord::Base
  has_secure_password

  has_many :mentor_sessions, class_name: "Appointment", foreign_key: "mentor_id"
  has_many :study_sessions, class_name: "Appointment", foreign_key: "student_id"
  has_many :feedbacks

end


class Feedback < ActiveRecord::Base
  belongs_to :user
  belongs_to :appointment
end


class Appointment < ActiveRecord::Base
  has_many :feedbacks
  belongs_to :mentor, class_name: "User"
  belongs_to :student, class_name: "User"

end

SCHEMA
ActiveRecord::Schema.define(version: 20161207231152) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: true do |t|
    t.integer  "mentor_id"
    t.integer  "student_id"
    t.string   "topic"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedbacks", force: true do |t|
    t.integer  "appointment_id"
    t.integer  "user_id"
    t.text     "body"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "telephone"
    t.string   "avatar"
    t.string   "user_type"
    t.integer  "phase"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

SEED

require 'faker'
15.times {
        User.create(name: Faker::Name.name, user_type: "student", email: Faker::Internet.email, telephone: Faker::PhoneNumber.cell_phone , password: "p", phase: rand(1..3), avatar: Faker::Avatar.image )
  }

  5.times {
        User.create(name: Faker::Name.name, user_type: "mentor", email: Faker::Internet.email, telephone: Faker::PhoneNumber.cell_phone , password: "p", phase: rand(1..3), avatar: Faker::Avatar.image )
  }

  20.times {
    Appointment.create(mentor_id:rand(16..20) ,student_id:rand(1..15), topic: Faker::Hipster.sentence ,start_time: Faker::Time.between(DateTime.now - 1, DateTime.now) ,end_time: Faker::Time.between(DateTime.now - 1, DateTime.now))
  }

  20.times do |i|

    s = Appointment.find(i+1)

    Feedback.create(body: Faker::Hipster.paragraph, rating: rand(0..5), appointment_id: i, user_id: s.mentor_id)

    Feedback.create(body: Faker::Hipster.paragraph, rating: rand(0..5), appointment_id: i, user_id: s.student_id)

  end
