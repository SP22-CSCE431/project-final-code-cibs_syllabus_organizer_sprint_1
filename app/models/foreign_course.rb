class ForeignCourse < ApplicationRecord
  has_one_attached :syllabus
  validates  :foreign_course_name, :contact_hours, :semester_approved, :foreign_course_dept, :foreign_course_num, presence: true
  validates  :syllabus, presence: true, blob: { content_type: 'application/pdf' }
  belongs_to :tamu_department
  belongs_to :university
  # Not sure if needed
  # has_and_belongs_to_many :student
  # has_and_belongs_to_many :tamu_course
end
